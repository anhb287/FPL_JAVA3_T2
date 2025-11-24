<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- SỬA LỖI JSTL: Dùng URI mới của Jakarta EE --%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống - Góc Nhìn Báo Chí</title>
    <%-- Đảm bảo bạn đã có file style.css chung --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> 
    
    <style>
        /* CSS Đã Cải Tiến (Hợp nhất từ khối thứ hai) */
           /* 1. Căn chỉnh Header (Sử dụng Flexbox) */
        .header {
            display: flex; 
            justify-content: space-between; /* Đẩy logo và nút đăng nhập ra hai bên */
            align-items: center; /* Căn giữa theo chiều dọc - GIÚP HÌNH THẲNG HÀNG */
            padding: 15px 30px; 
            background-color: #ffffff; 
            border-bottom: 1px solid #eeeeee; 
            height: 80px; /* Chiều cao cố định cho header */
        }

        /* 2. Điều chỉnh kích thước Logo cho VỪA PHẢI */
        .header-image {
            height: 120px; /* Chiều cao tối đa vừa phải */
            width: 150px; /* Giữ tỷ lệ khung hình */
        }
        
        .page-main {
            display: flex;
            justify-content: center;
            align-items: center;
            /* Điều chỉnh chiều cao để căn giữa form */
            min-height: calc(100vh - 100px - 80px); 
            background-color: #f7f9fc; /* Nền nhẹ nhàng */
        }

        .form-container { /* Sử dụng làm container chính cho form */
            width: 100%;
            max-width: 420px;
            padding: 40px; 
            background-color: #fff;
            border-radius: 12px; 
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); 
            transition: all 0.3s ease-in-out;
        }

        .form-container h2 {
            text-align: center;
            color: #d00000;
            margin-bottom: 30px;
            font-size: 1.8em;
            font-weight: 700;
        }
        .form-container h2::after {
            content: '';
            display: block;
            width: 50px;
            height: 3px;
            background-color: #d00000;
            margin: 10px auto 0;
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
            font-size: 0.95em;
        }

        .form-group input[type="email"],
        .form-group input[type="password"] { 
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 6px; 
            box-sizing: border-box;
            font-size: 1em;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-group input:focus {
            border-color: #d00000;
            box-shadow: 0 0 0 3px rgba(208, 0, 0, 0.1);
            outline: none;
        }

        .submit-button { /* Thay thế cho .login-button */
            width: 100%;
            padding: 14px;
            background-color: #d00000;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 1.15em;
            font-weight: bold;
            letter-spacing: 0.5px;
            margin-top: 15px;
            transition: background-color 0.3s, transform 0.1s;
        }
        .submit-button:hover {
            background-color: #a30000;
        }
        .submit-button:active {
            transform: scale(0.99);
        }
        
        .alt-link {
            text-align: center;
            margin-top: 25px;
            font-size: 0.9em;
            color: #666;
        }
        .alt-link a {
            color: #007bff;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }
        .alt-link a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .error-message {
            color: #d00000;
            text-align: center;
            font-weight: 600;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #ffeaea;
            border: 1px solid #d00000;
            border-radius: 4px;
        }
        .success-message {
            color: #006400; /* Dark green */
            text-align: center;
            font-weight: 600;
            margin-bottom: 15px;
            padding: 10px;
            background-color: #e6ffe6;
            border: 1px solid #006400;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    
    <%-- HEADER (TỪ KHỐI CODE THỨ HAI) --%>
    <header class="header">
        <img src="${pageContext.request.contextPath}/img/lgo.png" alt="Logo ABC News" class="header-image">
        <div class="header-login">
            <a href="${pageContext.request.contextPath}/">Về Trang Chủ</a>
        </div>
    </header>

    <%-- Menu (Nếu tồn tại) --%>
    <jsp:include page="/menu.jsp" />

    <main class="page-main">
        <div class="form-container">
            <h2>Đăng nhập Hệ thống</h2>
            
            <form action="${pageContext.request.contextPath}/login" method="POST"> 
                
                <%-- Hiển thị thông báo Đăng ký thành công --%>
                <c:if test="${not empty requestScope.message}">
                    <p class="success-message">${requestScope.message}</p>
                </c:if>
                
                <%-- Hiển thị lỗi Đăng nhập thất bại --%>
                <c:if test="${not empty requestScope.error}">
                    <p class="error-message">${requestScope.error}</p>
                </c:if>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required placeholder="Nhập địa chỉ Email">
                </div>
                
                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" required placeholder="Nhập mật khẩu của bạn">
                </div>
                               
                <button type="submit" class="submit-button">ĐĂNG NHẬP</button>
                
                <div class="alt-link">
    			    <p>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a></p>            
                </div>
                
            </form>
        </div>
    </main>

    <%-- FOOTER --%>
    <footer class="footer">
        <p>Góc Nhìn Báo Chí</p>
    </footer>

</body> 
</html>