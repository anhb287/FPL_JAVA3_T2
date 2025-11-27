package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import DAO.UserDAO;
import Entity.User;
import Util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession; 


@WebServlet({ "/login", "/register", "/logout", "/admin" }) // Thêm /admin vào đây để dễ quản lý
public class UserServlet extends HttpServlet {
	
	private static final int ROLE_READER = 0;
	private static final int ROLE_MANAGER = 1; 
	private static final int ROLE_ADMIN = 2; // Đã sửa: Xóa ROLE_MANAGER bị lặp

	private UserDAO dao;

	@Override
	public void init() throws ServletException {
		try {
			Connection conn = DBConnection.getConnection();
			dao = new UserDAO(conn);
		} catch (Exception e) {
			e.printStackTrace(); 
			throw new ServletException("Không thể kết nối MySQL", e);
		}
	}
    
    // =========================================================
    // PHƯƠNG THỨC XỬ LÝ FLASH MESSAGE (Giữ lại để sử dụng cho login/register)
    // =========================================================
    private void handleFlashMessages(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session != null) {
            
            // Xử lý flashError (Nếu có lỗi từ các servlet khác chuyển qua)
            String flashError = (String) session.getAttribute("flashError");
            if (flashError != null) {
                req.setAttribute("error", flashError); 
                session.removeAttribute("flashError");
            }
            
            // Xử lý flashMessage (Thông báo thành công)
            String flashMessage = (String) session.getAttribute("flashMessage");
            if (flashMessage != null) {
                req.setAttribute("message", flashMessage); 
                session.removeAttribute("flashMessage");
            }
            
            // Xử lý successMessage (Dùng cho Login.jsp sau Register/Logout)
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) {
                req.setAttribute("successMessage", successMessage); 
                session.removeAttribute("successMessage");
            }
        }
    }
    // =========================================================

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
        
        handleFlashMessages(req); 
        
		if (uri.endsWith("/login")) {
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} else if (uri.endsWith("/register")) {
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
		} else if (uri.endsWith("/logout")) {
			
			// Lấy session hiện tại
			HttpSession session = req.getSession(false);
			
			// 1. Lưu thông báo đăng xuất thành công vào Session
			if(session != null) {
			    session.setAttribute("successMessage", "Bạn đã đăng xuất thành công!");
			}
			
			// 2. Hủy toàn bộ Session
			if(session != null) {
			    session.invalidate(); 
			}

			// 3. Chuyển hướng về trang đăng nhập
			resp.sendRedirect(req.getContextPath() + "/login");
		} else if (uri.endsWith("/admin")) {
		    // Xử lý chuyển hướng đến trang Admin (đảm bảo user đã đăng nhập, nếu không đã bị chặn ở admin.jsp)
		    req.getRequestDispatcher("admin.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String uri = req.getRequestURI();
        HttpSession session = req.getSession(); // Lấy Session
        
		try {
			if (uri.endsWith("/login")) {
				String email = req.getParameter("email").trim();
				String password = req.getParameter("password").trim();

				User u = dao.findByEmail(email);

				if (u != null && u.getPassword().equals(password)) { 
					
					// 1. Lưu thông tin User vào Session với key "loggedInUser"
					session.setAttribute("loggedInUser", u);
					
					// 2. Flash Message: Hiển thị thông báo trên trang chủ/admin
					session.setAttribute("flashMessage", "Đăng nhập thành công! Chào mừng, " + u.getFullname() + "!");
					
					// 3. Chuyển hướng về trang tương ứng dựa trên Role
					if (u.getRole() == ROLE_ADMIN || u.getRole() == ROLE_MANAGER) { // Admin & Manager dùng chung trang Admin
						resp.sendRedirect(req.getContextPath() + "/admin"); 
					} else {
						// Độc giả hoặc Role khác về trang chủ
						resp.sendRedirect(req.getContextPath() + "/index.jsp"); 
					}
					return;
				} else {
					// Đăng nhập thất bại: Forward lại trang Login và gửi lỗi
					req.setAttribute("error", "Sai email hoặc mật khẩu!");
					req.getRequestDispatcher("Login.jsp").forward(req, resp);
				}
			} else if (uri.endsWith("/register")) {
				String fullname = req.getParameter("fullname").trim();
				String email = req.getParameter("email").trim();
				String password = req.getParameter("password");
				String confirm = req.getParameter("confirmPassword");
				
				// 1. Kiểm tra Mật khẩu khớp
				if (!password.equals(confirm)) {
					req.setAttribute("error", "Mật khẩu xác nhận không khớp!");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return;
				}
				
				// 2. Kiểm tra độ dài mật khẩu tối thiểu (>= 6 KÝ TỰ)
				if (password.length() < 6) {
					req.setAttribute("error", "Mật khẩu quá ngắn, không đủ 6 ký tự");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return;
				}

				// 3. Kiểm tra Email đã tồn tại
				if (dao.findByEmail(email) != null) {
					req.setAttribute("error", "Email đã được sử dụng!");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return;
				}
					 
				// 4. Thực hiện Đăng ký
				User u = new User();
				u.setFullname(fullname);
				u.setEmail(email);
				u.setPassword(password);
				u.setRole(ROLE_READER); // Mặc định là độc giả
				
				dao.insert(u);
				
				// 5. Đăng ký thành công, chuyển sang trang đăng nhập
				session.setAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
				resp.sendRedirect(req.getContextPath() + "/login");
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		    // Xử lý lỗi SQL cho cả Login và Register
		    req.setAttribute("error", "Lỗi cơ sở dữ liệu: " + e.getMessage());
		    String target = uri.endsWith("/login") ? "Login.jsp" : "Register.jsp";
		    req.getRequestDispatcher(target).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}