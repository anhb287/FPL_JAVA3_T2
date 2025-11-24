<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản - ABC News</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
    /* VARIABLES */
    :root {
        --primary-red: #d00000;
        --dark-red: #a30000;
        --light-bg: #f7f9fc;
        --shadow-color: rgba(0, 0, 0, 0.05);
        --transition-speed: 0.3s;
    }
    body {
        font-family: 'Roboto', sans-serif;
        background-color: var(--light-bg);
    }

    /* 1. Header (giữ nguyên layout, làm gọn gàng hơn) */
    .header {
        display: flex; 
        justify-content: space-between;
        align-items: center;
        padding: 15px 30px; 
        background-color: #ffffff; 
        border-bottom: 3px solid var(--primary-red); /* Dải đỏ nổi bật */
        height: 80px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }
    .header-image {
        height: 100px; /* Giảm kích thước ảnh một chút */
        width: auto;
    }
    .header-login a {
        color: var(--primary-red);
        text-decoration: none;
        font-weight: 500;
        padding: 8px 15px;
        border: 1px solid var(--primary-red);
        border-radius: 6px;
        transition: var(--transition-speed);
    }
    .header-login a:hover {
        background-color: var(--primary-red);
        color: white;
    }

    /* 2. Main Content & Form Container */
    .page-main {
        display: flex;
        justify-content: center;
        align-items: center;
        /* Điều chỉnh chiều cao cho linh hoạt hơn */
        min-height: calc(100vh - 160px); 
        padding: 40px 20px;
    }

    .form-container {
        width: 100%;
        max-width: 480px; /* Tăng chiều rộng form để thoáng hơn */
        padding: 45px; 
        background-color: #fff;
        border-radius: 16px; /* Cong hơn */
        /* Tạo bóng đổ hiện đại và sâu */
        box-shadow: 0 15px 40px var(--shadow-color), 0 0 10px rgba(0, 0, 0, 0.03);
        transition: transform 0.3s ease-out;
    }
    .form-container:hover {
        transform: translateY(-2px); /* Hiệu ứng nâng nhẹ */
    }

    .form-container h2 {
        text-align: center;
        color: var(--primary-red);
        margin-bottom: 35px;
        font-size: 2em; /* Tiêu đề lớn hơn */
        font-weight: 900;
        font-family: 'Merriweather', serif; /* Dùng font Merriweather cho tiêu đề */
    }
    .form-container h2::after {
        content: '';
        display: block;
        width: 70px;
        height: 4px; /* Dày hơn */
        background-color: var(--primary-red);
        margin: 10px auto 0;
        border-radius: 3px;
    }

    /* 3. Input Groups */
    .form-group {
        margin-bottom: 25px;
    }
    .form-group label {
        display: block;
        margin-bottom: 6px;
        font-weight: 500;
        color: #333;
        font-size: 1em;
    }

    .form-group input[type="text"],
    .form-group input[type="password"],
    .form-group input[type="email"] { 
        width: 100%;
        padding: 14px 18px; /* Padding lớn hơn */
        border: 2px solid #e0e0e0; /* Border màu nhẹ hơn */
        border-radius: 8px; 
        box-sizing: border-box;
        font-size: 1em;
        transition: all var(--transition-speed);
    }
    /* Hiệu ứng focus sinh động */
    .form-group input:focus {
        border-color: var(--primary-red);
        box-shadow: 0 0 0 4px rgba(208, 0, 0, 0.2); /* Tạo hiệu ứng 'Ring' */
        outline: none;
        background-color: #fffafb; /* Nền nhạt khi focus */
    }

    /* 4. Submit Button (Thiết kế lại hoàn toàn) */
    .submit-button {
        width: 100%;
        padding: 16px;
        background-image: linear-gradient(135deg, var(--primary-red) 0%, var(--dark-red) 100%);
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1.25em;
        font-weight: 700;
        letter-spacing: 0.7px;
        margin-top: 20px;
        box-shadow: 0 4px 15px rgba(208, 0, 0, 0.3);
        transition: all 0.2s ease-in-out;
    }
    .submit-button:hover {
        /* Đổi màu gradient khi hover */
        background-image: linear-gradient(135deg, var(--dark-red) 0%, #7d0000 100%);
        box-shadow: 0 6px 20px rgba(208, 0, 0, 0.5);
        transform: translateY(-1px);
    }
    .submit-button:active {
        transform: scale(0.98) translateY(1px);
        box-shadow: 0 2px 10px rgba(208, 0, 0, 0.3);
    }
    
    /* 5. Alt Link & Messages */
    .alt-link {
        text-align: center;
        margin-top: 30px;
        font-size: 0.95em;
        color: #666;
    }
    .alt-link a {
        color: var(--primary-red);
        text-decoration: none;
        font-weight: 600;
        transition: color var(--transition-speed);
    }
    .alt-link a:hover {
        color: var(--dark-red);
        text-decoration: underline;
    }
    .error-message, .success-message {
        font-size: 0.9em;
        padding: 12px;
        margin-bottom: 20px;
        border-radius: 6px;
        font-weight: 500;
        border-left: 5px solid;
    }
    .error-message {
        color: var(--dark-red);
        background-color: #ffeaea;
        border-color: var(--primary-red);
    }
    .success-message {
        color: #006400;
        background-color: #e6ffe6;
        border-color: #006400;
    }

    /* 6. Responsive adjustments */
    @media (max-width: 600px) {
        .form-container {
            padding: 30px 20px;
            margin: 0 10px;
        }
        .form-container h2 {
            font-size: 1.7em;
        }
        .header {
            padding: 10px 15px;
            height: auto;
        }
        .header-image {
            height: 80px;
        }
    }
    </style>
</head>
<body>
    
    <header class="header">
        <!-- Đảm bảo đường dẫn hình ảnh đúng -->
        <img src="${pageContext.request.contextPath}/img/lgo.png" alt="Logo ABC News" class="header-image">
        <div class="header-login">
            <a href="${pageContext.request.contextPath}">Về Trang Chủ</a>
        </div>
    </header>

    <jsp:include page="/menu.jsp" />

    <main class="page-main">
        <div class="form-container">
            <h2>Đăng ký Tài khoản</h2>
            
            <form action="${pageContext.request.contextPath}/register" method="POST"> 
                
                <%-- Hiển thị lỗi/thành công --%>
                <c:if test="${not empty requestScope.error}">
                    <p class="error-message">${requestScope.error}</p>
                </c:if>
                <c:if test="${not empty requestScope.success}">
                    <p class="success-message">${requestScope.success}</p>
                </c:if>

                <div class="form-group">
                    <label for="fullname">Họ và Tên:</label>
                    <input type="text" id="fullname" name="fullname" required 
                           placeholder="Nhập họ và tên đầy đủ của bạn">
                </div>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <!-- ĐÃ SỬA: Đảm bảo name cho email là 'email' -->
                    <input type="email" id="email" name="email" required
                           placeholder="Ví dụ: hoten@example.com">
                </div>
                
                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" required
                           placeholder="Ít nhất 6 ký tự">
                </div>

                <div class="form-group">
                    <label for="confirmPass">Xác nhận Mật khẩu:</label>
                    <input type="password" id="confirmPass" name="confirmPassword" required
                           placeholder="Nhập lại mật khẩu">
                </div>
                               
                <button type="submit" class="submit-button">Tạo Tài Khoản </button>
                
                <div class="alt-link">
                    <p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập tại đây</a></p>
                </div>
                
            </form>
        </div>
    </main>

    <footer class="footer">
        <p>Góc Nhìn Báo Chí</p>
    </footer>
</body>
</html>