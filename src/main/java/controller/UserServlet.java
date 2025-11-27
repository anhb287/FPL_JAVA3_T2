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

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.endsWith("/login")) {
			// Forward tới Login.jsp. Các thông báo từ Session (sau khi đăng ký/đăng xuất) 
			// sẽ được xử lý hiển thị ở Login.jsp
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} else if (uri.endsWith("/register")) {
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
		} else if (uri.endsWith("/logout")) {
			// Đăng xuất: Xóa Session và chuyển về trang đăng nhập
			// Lưu Flash Message Đăng xuất thành công vào Session
			req.getSession().setAttribute("successMessage", "Bạn đã đăng xuất thành công!");
			req.getSession().invalidate(); // Hủy toàn bộ Session trừ các thuộc tính mới đặt (nếu dùng Tomcat 8+). 
			                             // CÁCH TỐT NHẤT LÀ DÙNG setAttribute TRƯỚC VÀ REDIRECT.
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String uri = req.getRequestURI();
		try {
			if (uri.endsWith("/login")) {
				String email = req.getParameter("email").trim();
				String password = req.getParameter("password").trim();

				User u = dao.findByEmail(email);
				
				if (u != null && u.getPassword().equals(password)) { 
					HttpSession session = req.getSession();
					
					// 🔥 QUAN TRỌNG: SỬA TÊN BIẾN SESSION KHỚP VỚI JSTL TRONG index.jsp
					session.setAttribute("loggedInUser", u);
					
					// THÊM: Flash Message để hiển thị thông báo trên index.jsp
					session.setAttribute("flashMessage", "Đăng nhập thành công! Chào mừng, " + u.getFullname() + "!");
					
					// Chuyển hướng về trang tương ứng
					if (u.getRole() == ROLE_ADMIN) {
						// Chuyển hướng về trang Admin
						resp.sendRedirect(req.getContextPath() + "/admin"); 
					} else {
						// Chuyển hướng về trang chủ
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
				
				if (!password.equals(confirm)) {
					req.setAttribute("error", "Mật khẩu xác nhận không khớp!");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return;
				}

				if (dao.findByEmail(email) != null) {
					req.setAttribute("error", "Email đã được sử dụng!");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return; 
				} 
				
				// Thực hiện Đăng ký
				User u = new User();
				u.setFullname(fullname);
				u.setEmail(email);
				u.setPassword(password);
				u.setRole(ROLE_READER);
				dao.insert(u);
				
				// Lưu thông báo thành công vào Session và REDIRECT về trang Login
				req.getSession().setAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
				resp.sendRedirect(req.getContextPath() + "/login");
			}
		} catch (SQLException e) {
		    e.printStackTrace();
		    req.setAttribute("error", "Lỗi cơ sở dữ liệu: " + e.getMessage());
		    String target = uri.endsWith("/login") ? "Login.jsp" : "Register.jsp";
		    req.getRequestDispatcher(target).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}