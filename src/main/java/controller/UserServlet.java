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
import jakarta.servlet.http.HttpSession; // <<< CẦN IMPORT NÀY

@WebServlet({ "/login", "/register", "/logout" })
public class UserServlet extends HttpServlet {
	
	private static final int ROLE_READER = 0;
	private static final int ROLE_MANAGER = 1; 
	private static final int ROLE_ADMIN = 2;

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
    // >>> PHƯƠNG THỨC XỬ LÝ FLASH MESSAGE (MỚI) <<<
    // Dùng để chuyển thông báo từ Session sang Request và xóa khỏi Session.
    // =========================================================
    private void handleFlashMessages(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session != null) {
            String flashError = (String) session.getAttribute("flashError");
            String flashMessage = (String) session.getAttribute("flashMessage");

            if (flashError != null) {
                req.setAttribute("error", flashError); 
                session.removeAttribute("flashError");
            }

            if (flashMessage != null) {
                req.setAttribute("message", flashMessage); 
                session.removeAttribute("flashMessage");
            }
        }
    }
    // =========================================================

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
        
        // >>> GỌI HÀM NÀY ĐỂ CHUẨN BỊ THÔNG BÁO CHO JSP <<<
        handleFlashMessages(req); 
        
		if (uri.endsWith("/login")) {
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} else if (uri.endsWith("/register")) {
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
		} else if (uri.endsWith("/logout")) {
			req.getSession().invalidate();
            req.getSession().setAttribute("flashMessage", "Bạn đã đăng xuất thành công."); // Có thể thêm thông báo đăng xuất
			resp.sendRedirect(req.getContextPath() + "/login");
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
					session.setAttribute("currentUser", u);
                    
                    // >>> THÊM FLASH MESSAGE ĐĂNG NHẬP THÀNH CÔNG <<<
                    session.setAttribute("flashMessage", "Đăng nhập thành công! Chào mừng bạn trở lại.");
					
					if (u.getRole() == ROLE_READER) {
						resp.sendRedirect(req.getContextPath() + "/index.jsp"); // Redirect đến trang chủ
					} else if (u.getRole() == ROLE_MANAGER) {
						resp.sendRedirect(req.getContextPath() + "/index.jsp"); // Redirect đến trang chủ
					} else if (u.getRole() == ROLE_ADMIN) {
						resp.sendRedirect(req.getContextPath() + "/admin");
						return;
					} else {
						resp.sendRedirect(req.getContextPath() + "/index.jsp");
					}
				} else {
					req.setAttribute("error", "Sai email hoặc mật khẩu!");
					req.getRequestDispatcher("Login.jsp").forward(req, resp);
				}
			} else if (uri.endsWith("/register")) {
				String fullname = req.getParameter("fullname").trim();
				String email = req.getParameter("email").trim();
				String password = req.getParameter("password");
				String confirm = req.getParameter("confirmPassword");
				
				// 1. Kiểm tra confirm password
				if (!password.equals(confirm)) {
					req.setAttribute("error", "Mật khẩu xác nhận không khớp!");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return;
				}
				
				// Kiểm tra độ dài mật khẩu tối thiểu (>= 6 KÝ TỰ)
				if (password.length() < 6) {
					req.setAttribute("error", "Mật khẩu quá ngắn, không đủ 6 ký tự");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return;
				}

				// 2. Kiểm tra email trùng
				if (dao.findByEmail(email) != null) {
					req.setAttribute("error", "Email đã được sử dụng!");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return;
				}
				
				// 3. Thực hiện Đăng ký
				User u = new User();
				u.setFullname(fullname);
				u.setEmail(email);
				u.setPassword(password);
				u.setRole(ROLE_READER);
				
				dao.insert(u);
				
				// Đăng ký thành công, chuyển sang trang đăng nhập (Sử dụng flash message)
				session.setAttribute("flashMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
				resp.sendRedirect(req.getContextPath() + "/login"); // Đã đổi sang REDIRECT
			}
		} catch (SQLException e) {
		 e.printStackTrace();
            // Sử dụng Flash Message nếu có thể redirect
            if (uri.endsWith("/login")) {
                req.setAttribute("error", "Lỗi cơ sở dữ liệu khi đăng nhập: " + e.getMessage());
                req.getRequestDispatcher("Login.jsp").forward(req, resp);
            } else if (uri.endsWith("/register")) {
                req.setAttribute("error", "Lỗi cơ sở dữ liệu khi đăng ký: " + e.getMessage());
                req.getRequestDispatcher("Register.jsp").forward(req, resp);
            }
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}