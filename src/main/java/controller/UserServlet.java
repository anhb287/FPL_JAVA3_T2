package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException; // Cần import SQLException cho phần xử lý lỗi

import DAO.UserDAO;
import Entity.User;
import Util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/login", "/register", "/logout" })
public class UserServlet extends HttpServlet {
	
	// Định nghĩa các mã vai trò để dễ quản lý
	private static final int ROLE_READER = 0;
	private static final int ROLE_MANAGER = 1; // Thêm vai trò Quản lý
	private static final int ROLE_ADMIN = 2;

	private UserDAO dao;

	@Override
	public void init() throws ServletException {
		try {
			Connection conn = DBConnection.getConnection();
			dao = new UserDAO(conn);
		} catch (Exception e) {
			// In stack trace để dễ debug lỗi kết nối
			e.printStackTrace(); 
			throw new ServletException("Không thể kết nối MySQL", e);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.endsWith("/login")) {
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		} else if (uri.endsWith("/register")) {
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
		} else if (uri.endsWith("/logout")) {
			req.getSession().invalidate();
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Thiết lập UTF-8 để xử lý tiếng Việt
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String uri = req.getRequestURI();
		try {
			if (uri.endsWith("/login")) {
				String email = req.getParameter("email").trim(); // Sử dụng trim()
				String password = req.getParameter("password").trim();

				User u = dao.findByEmail(email);
				
				// Lưu ý: Cần mã hóa mật khẩu ở đây thay vì so sánh trực tiếp
				if (u != null && u.getPassword().equals(password)) { 
					req.getSession().setAttribute("currentUser", u);
					
					// Phân quyền dựa trên Mã Vai trò (int)
					if (u.getRole() == ROLE_READER) {
						resp.sendRedirect(req.getContextPath() + "/index.jsp"); // Độc giả về trang chủ
					} else if (u.getRole() == ROLE_MANAGER) {
						resp.sendRedirect(req.getContextPath() + "/index.jsp"); // Quản lý sang trang chủ
					} else if (u.getRole() == ROLE_ADMIN) {
						resp.sendRedirect(req.getContextPath() + "/admin");
						return;
					} else {
						// Role không xác định (fallback)
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

				// 2. Kiểm tra email trùng
				if (dao.findByEmail(email) != null) {
					req.setAttribute("error", "Email đã được sử dụng!");
					req.getRequestDispatcher("Register.jsp").forward(req, resp);
					return; // Thêm return để dừng xử lý
				} 
				
				// 3. Thực hiện Đăng ký
				User u = new User();
				u.setFullname(fullname);
				u.setEmail(email);
				u.setPassword(password); // LƯU Ý: Nên HASH mật khẩu trước khi lưu
				u.setRole(ROLE_READER); // Đã sửa: Mặc định gán mã số 0 cho Độc giả
				
				dao.insert(u);
				
				// Đăng ký thành công, chuyển sang trang đăng nhập
				req.setAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
				req.getRequestDispatcher("Login.jsp").forward(req, resp);
			}
		} catch (SQLException e) {
		    // Xử lý lỗi SQL cụ thể
		    e.printStackTrace();
		    req.setAttribute("error", "Lỗi cơ sở dữ liệu trong quá trình xử lý: " + e.getMessage());
		    if (uri.endsWith("/login")) {
		        req.getRequestDispatcher("Login.jsp").forward(req, resp);
		    } else if (uri.endsWith("/register")) {
		        req.getRequestDispatcher("Register.jsp").forward(req, resp);
		    }
		} catch (Exception e) {
			// Xử lý các lỗi khác
			e.printStackTrace();
			throw new ServletException(e);
		}
	}
}