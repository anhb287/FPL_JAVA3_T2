<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng ký Tài khoản - Góc Nhìn Báo Chí</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        /* GLOBAL: Font, Nền Glassmorphism */
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-image: url('img/bacgroundLogin.jpg'); 
            background-size: cover; 
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed; 
        }
        body {
            display: flex;
            flex-direction: column;
        }

        /* MAIN CONTENT: Căn giữa */
        .main-content {
            flex-grow: 1; 
            display: flex;
            justify-content: center;
            align-items: center; 
            padding: 20px;
        }

        /* REGISTER CARD: TĂNG CHIỀU RỘNG VÀ ĐỘ DÀY CHO FORM ĐĂNG KÝ */
        .register-card {
            width: 500px;
            max-width: 450px; 
            padding: 40px; 
            border-radius: 18px; 
            
            /* Hiệu ứng Frosted Glass */
            background: rgba(255, 255, 255, 0.15); 
            backdrop-filter: blur(15px); 
            -webkit-backdrop-filter: blur(15px);
            
            /* Border và Shadow */
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
            
            animation: slideUp 0.7s ease-out; 
        }
        
        /* LOGO, INPUT, TEXT: Giữ nguyên từ Login.jsp */
        #login-logo {
            display: block; 
            width: 80px; 
            height: 80px;
            margin: 0 auto 20px auto; 
            border-radius: 50%; 
            object-fit: cover;
            border: 2px solid rgba(255, 255, 255, 0.6); 
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
        }

        .register-card h2 { 
            text-align: center;
            color: #ffffff; 
            margin-bottom: 30px; 
            font-weight: 700;
            font-size: 2.2rem; 
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }
        
        /* INPUT FIELDS (Giữ nguyên) */
        .input-group-custom {
            position: relative;
        }
        .input-icon {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: black; /* Sửa lại màu trắng để hiển thị tốt hơn trên nền tối */
            z-index: 2; 
            font-size: 1.1em;
        }
        .form-label {
            font-weight: 600; 
            font-size: 1.05em;
            color: black; 
        }
        .form-control {
            padding: 12px 15px 12px 45px; 
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.5); 
            background-color: rgba(255, 255, 255, 0.1); 
            color: black; 
        }
        .form-control::placeholder {
            color: black; 
        }
        .form-control:focus {
            border-color: #ffffff;
            box-shadow: 0 0 0 4px rgba(255, 255, 255, 0.2); 
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        /* NÚT ĐĂNG KÝ: Thay đổi màu sắc và hiệu ứng nhẹ nhàng hơn */
        .btn-brand-secondary {
            background: rgba(180, 255, 255, 0.15); 
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            color: black;
            padding: 14px;
            font-size: 1.15em;
            font-weight: 700;
            border-radius: 12px;
            letter-spacing: 1px;
            box-shadow: 0 4px 18px rgba(0, 255, 255, 0.1);
            transition: 0.3s ease;
        }

        .btn-brand-secondary:hover {
            background: rgba(180, 255, 255, 0.3); 
            transform: translateY(-2px);
            box-shadow: 0 6px 24px rgba(0, 255, 255, 0.2);
        }
        
        /* LINK ĐĂNG NHẬP (Giữ nguyên) */
        .alt-link-text {
            color: #ffffff; 
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }
        .alt-link-text a {
            color: #ffffff;
            font-weight: 700;
            text-decoration: underline;
            transition: color 0.3s;
        }
        .alt-link-text a:hover {
             color: #333333; /* Sửa lại màu hover */
             text-decoration: none;
        }

        .alert-error {
            color: #fff; 
            background-color: rgba(255, 0, 0, 0.5); 
            border-color: rgba(255, 255, 255, 0.5);
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .h2 {
        
        color:black;
        
        }
        
    </style>
</head>
<body>
    
    <%-- Main Content (Phần chứa Form Glassmorphism) --%>
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <div class="register-card"> 
                        
                        <%-- LOGO --%>
                        <img id="login-logo" src="img/lgo.png" alt="Logo" onerror="this.onerror=null;this.src='https://placehold.co/60x60/2a3a5e/ffffff?text=LOGO'">
                        
                        <h2 class="mb-4">Đăng Ký Tài Khoản</h2>
                        
                        <%-- 🔥 HIỂN THỊ LỖI ĐĂNG KÝ (Mật khẩu không khớp/Email đã tồn tại) --%>
                        <c:if test="${not empty requestScope.error}">
                            <div class="alert alert-error mb-3" role="alert">
                                ${requestScope.error}
                            </div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/register" method="POST"> 
                            
                            <%-- Trường Họ và Tên --%>
                            <div class="mb-3">
                                <label for="fullname" class="form-label">Họ và Tên:</label>
                                <div class="input-group-custom">
                                    <i class="fas fa-user input-icon"></i>
                                    <input type="text" id="fullname" name="fullname" class="form-control" required placeholder="Nhập Họ và Tên">
                                </div>
                            </div>

                            <%-- Trường Email --%>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <div class="input-group-custom">
                                    <i class="fas fa-envelope input-icon"></i>
                                    <input type="email" id="email" name="email" class="form-control" required placeholder="Nhập địa chỉ Email">
                                </div>
                            </div>
                            
                            <%-- Trường Mật khẩu --%>
                            <div class="mb-3">
                                <label for="password" class="form-label">Mật khẩu:</label>
                                <div class="input-group-custom">
                                    <i class="fas fa-lock input-icon"></i>
                                    <input type="password" id="password" name="password" class="form-control" required placeholder="Mật khẩu tối thiểu 6 ký tự">
                                </div>
                            </div>
                            
                            <%-- Trường Xác nhận Mật khẩu --%>
                            <div class="mb-4">
                                <label for="confirmPassword" class="form-label">Xác nhận Mật khẩu:</label>
                                <div class="input-group-custom">
                                    <i class="fas fa-key input-icon"></i>
                                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required placeholder="Xác nhận lại mật khẩu">
                                </div>
                            </div>
                                           
                            <button type="submit" class="btn btn-brand-secondary w-100">ĐĂNG KÝ</button>
                            
                            <div class="text-center mt-4 alt-link-text">
                                <p class="mb-0">Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a></p>            
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
<%-- 🔥 ĐOẠN SCRIPT CŨ GÂY POP-UP ĐÃ ĐƯỢC XÓA BỎ --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body> 
</html>