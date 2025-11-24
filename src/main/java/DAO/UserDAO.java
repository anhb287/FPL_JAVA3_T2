package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entity.User;
import java.sql.Date; // Cần import

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

    // Tìm user theo id (Id đã là INT)
    public User findById(int id) throws SQLException { // Đã sửa kiểu tham số từ String sang int
        String sql = "SELECT * FROM users WHERE Id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id); // Đã sửa setString thành setInt
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    // Tìm user theo email
    public User findByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM users WHERE Email=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public void insert(User u) throws SQLException {
        // Đã sửa: Thêm Birthday, Gender vào câu lệnh SQL. Bỏ Id vì là AUTO_INCREMENT.
        String sql = "INSERT INTO users(Fullname, Email, Password, Role, Birthday, Gender, Mobile) VALUES(?,?,?,?,?,?,?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getFullname());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setInt(4, u.getRole()); // Đã sửa setString thành setInt
            ps.setDate(5, u.getBirthday()); // Đã thêm Birthday
            ps.setInt(6, u.getGender());    // Đã thêm Gender
            // Thêm Mobile (nếu Entity User có Mobile, tôi không thấy nhưng nên thêm)
            ps.setString(7, null); // Giả sử Mobile là null hoặc bạn thêm getter/setter cho Mobile
            ps.executeUpdate();
        }
    }


    // Map dữ liệu từ ResultSet sang User object
    private User mapRow(ResultSet rs) throws SQLException {
        User u = new User();
        u.setId(rs.getInt("id"));
        u.setFullname(rs.getString("fullname"));
        u.setEmail(rs.getString("email"));
        u.setPassword(rs.getString("password"));
        u.setRole(rs.getInt("role")); // Đã sửa: dùng getInt cho Role
        u.setBirthday(rs.getDate("birthday")); // Đã thêm: Lấy Birthday
        u.setGender(rs.getInt("gender"));      // Đã thêm: Lấy Gender
        // Bỏ qua cột Mobile vì không có trong Entity đã sửa
        return u;
    }
    
    public List<User> getAllUsers() throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT Id, Fullname, Email, Role, Birthday, Gender FROM users"; // Bỏ Password, Status
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFullname(rs.getString("fullname"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getInt("role")); // Đã sửa: dùng getInt
                u.setBirthday(rs.getDate("birthday")); // Đã thêm
                u.setGender(rs.getInt("gender"));      // Đã thêm
                // Đã loại bỏ: u.setStatus(rs.getString("status"));
                list.add(u);
            }
        }
        return list;
    }

    // Cập nhật
    public boolean updateUser(User u) throws SQLException {
        // Đã sửa: Loại bỏ Status, thêm Birthday, Gender, Mobile
        String sql = "UPDATE users SET Fullname = ?, Email = ?, Role = ?, Birthday = ?, Gender = ?, Mobile = ? WHERE Id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getFullname());
            ps.setString(2, u.getEmail());
            ps.setInt(3, u.getRole()); // Đã sửa
            ps.setDate(4, u.getBirthday()); // Đã thêm
            ps.setInt(5, u.getGender());    // Đã thêm
            ps.setString(6, null); // Giả sử Mobile là null
            ps.setInt(7, u.getId());
            return ps.executeUpdate() > 0;
        }
    }
    
    public boolean deleteUser(int id) throws SQLException {
        String sql = "DELETE FROM users WHERE Id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
    
    public User getUserById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE Id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setId(rs.getInt("id"));
                    u.setFullname(rs.getString("fullname")); // Tên cột là 'fullname', không phải 'name'
                    u.setEmail(rs.getString("email"));
                    u.setPassword(rs.getString("password")); // Thường cần Password khi lấy 1 user
                    u.setRole(rs.getInt("role")); // Đã sửa
                    u.setBirthday(rs.getDate("birthday")); // Đã thêm
                    u.setGender(rs.getInt("gender"));      // Đã thêm
                    // Đã loại bỏ: u.setStatus(rs.getString("status"));
                    return u;
                }
            }
        }
        return null;
    }
}