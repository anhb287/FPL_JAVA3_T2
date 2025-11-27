<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập hệ thống - Góc Nhìn Báo Chí</title>
<<<<<<< HEAD
=======
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
    
    <%-- 1. Thêm Bootstrap CSS --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <%-- 2. Thêm Google Fonts --%>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    
    <%-- 3. Thêm Font Awesome (Icon) --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" xintegrity="sha512-SnH5WK+bZxgPHs44uWIX+LLMDgJd65s5fW1o6f3R3+8v0kX1nN+jV1A5iJz8zG5zF0xU3S5h5j9XQzI1zV5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <%-- 4. CSS Tùy chỉnh (Áp dụng Glassmorphism với Hình Nền) --%>
    <style>
<<<<<<< HEAD
        /* GLOBAL: Font, Nền Glassmorphism */
=======
        /* ... (Style Glassmorphism của bạn) ... */
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Roboto', sans-serif;
            
<<<<<<< HEAD
            /* THAY THẾ NỀN GRADIENT BẰNG HÌNH ẢNH */
            background-image: url('img/bacgroundLogin.jpg'); /* Đã sửa đường dẫn theo cấu trúc thư mục */
            background-size: cover; /* Đảm bảo ảnh nền che phủ toàn bộ màn màn hình */
=======
            background-image: url('img/bacgroundLogin.jpg'); 
            background-size: cover; 
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed; 
        }
        body {
            display: flex;
            flex-direction: column;
        }

<<<<<<< HEAD
        /* MAIN CONTENT: Căn giữa */
=======

>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
        .main-content {
            flex-grow: 1; 
            display: flex;
            justify-content: center;
            align-items: center; 
            padding: 20px;
        }

<<<<<<< HEAD
        /* LOGIN CARD: ÁP DỤNG GLASSMORPHISM VÀ ĐÃ TĂNG KÍCH THƯỚC */
        .login-card {
            width: 100%;
            width: 400px; /* Tăng chiều rộng tối đa */
            padding: 40px; /* ĐIỀU CHỈNH: Giảm khoảng đệm dọc */
            border-radius: 18px; 
            
            /* Hiệu ứng Frosted Glass */
            background: rgba(255, 255, 255, 0.15); /* Nền trắng mờ */
            backdrop-filter: blur(15px); /* Làm mờ nền phía sau */
            -webkit-backdrop-filter: blur(15px);
            
            /* Border và Shadow nhẹ nhàng */
=======

        .login-card {
            width: 100%;
            width: 400px; 
            padding: 40px; 
            border-radius: 18px; 
            
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px); 
            -webkit-backdrop-filter: blur(15px);
            
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3);
            
            animation: slideUp 0.7s ease-out; 
        }
        
<<<<<<< HEAD
        /* LOGO CĂN GIỮA VÀ KÍCH THƯỚC ĐÃ ĐIỀU CHỈNH */
        #login-logo {
            display: block; /* Đảm bảo nó là block element để căn giữa */
            width: 80px; /* Giữ nguyên kích thước */
            height: 80px;
            margin: 0 auto 20px auto; /* ĐIỀU CHỈNH: Giảm khoảng cách dưới logo */
            border-radius: 50%; 
            object-fit: cover;
            border: 2px solid rgba(255, 255, 255, 0.6); /* Viền nhẹ nhàng hơn */
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.3);
        }

        /* TIÊU ĐỀ và TEXT: Đổi sang màu sáng */
        .login-card h2 {
            text-align: center;
            color: #ffffff; 
            margin-bottom: 30px; /* ĐIỀU CHỈNH: Giảm khoảng cách dưới tiêu đề */
=======
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

        .login-card h2 {
            text-align: center;
            color: #ffffff; 
            margin-bottom: 30px; 
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
            font-weight: 700;
            font-size: 2.5rem; 
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }
        
<<<<<<< HEAD
        /* INPUT FIELDS (Thêm vị trí tương đối cho Icon) */
=======
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
        .input-group-custom {
            position: relative;
        }
        .input-icon {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
<<<<<<< HEAD
            color: #ffffff; /* Icon trắng */
=======
            color: black; 
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
            z-index: 2; 
            font-size: 1.1em;
        }
        .form-label {
            font-weight: 600; 
            font-size: 1.05em;
<<<<<<< HEAD
            color: #ffffff; /* Label trắng */
=======
            color: black; 
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
        }
        .form-control {
            padding: 12px 15px 12px 45px; 
            border-radius: 8px;
<<<<<<< HEAD
            border: 1px solid rgba(255, 255, 255, 0.5); /* Border trong suốt */
            background-color: rgba(255, 255, 255, 0.1); /* Nền input hơi mờ */
            color: #ffffff; /* Text nhập vào màu trắng */
        }
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7); /* Placeholder màu trắng nhạt */
        }
        /* Hiệu ứng Focus */
        .form-control:focus {
            border-color: #ffffff;
            box-shadow: 0 0 0 4px rgba(255, 255, 255, 0.2); 
            background-color: rgba(255, 255, 255, 0.2);
        }
        
.btn-brand-primary {
    background: rgba(255, 255, 255, 0.22); /* trắng mờ rất nhẹ */
    backdrop-filter: blur(8px);
    border: 1px solid rgba(255, 255, 255, 0.35);
    color: #ffffff;
    padding: 14px;
    font-size: 1.15em;
    font-weight: 700;
    border-radius: 12px;
    letter-spacing: 1px;

    /* hiệu ứng nổi */
    box-shadow: 0 4px 18px rgba(255, 255, 255, 0.25);

    transition: 0.3s ease;
}

.btn-brand-primary:hover {
    background: rgba(255, 255, 255, 0.38); /* sáng hơn khi hover */
    transform: translateY(-2px);
    box-shadow: 0 6px 24px rgba(255, 255, 255, 0.35);
}


        
        /* LINK ĐĂNG KÝ */
=======
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
            background-color: white;
        }
        
		.btn-brand-primary {
		    background: rgba(255, 255, 255, 0.22); 
		    backdrop-filter: blur(8px);
		    border: 1px solid rgba(255, 255, 255, 0.35);
		    color: black;
		    padding: 14px;
		    font-size: 1.15em;
		    font-weight: 700;
		    border-radius: 12px;
		    letter-spacing: 1px;
		    box-shadow: 0 4px 18px rgba(255, 255, 255, 0.25);
		    transition: 0.3s ease;
		}
		
		.btn-brand-primary:hover {
		    background: rgba(220, 275, 205, 0.78); 
		    transform: translateY(-2px);
		    box-shadow: 0 6px 24px rgba(255, 255, 255, 0.35);
		}


        
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
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
             color: #333333; 
             text-decoration: none;
        }

<<<<<<< HEAD
        /* THÔNG BÁO LỖI (Điều chỉnh màu sắc cho nền tối) */
        .alert-error {
            color: #FFEDCC; 
            background-color: rgba(255, 0, 0, 0.3); 
            border-color: rgba(255, 255, 255, 0.5);
        }
        .alert-success-custom {
            color: #ffffff; 
            background-color: rgba(0, 128, 0, 0.4); 
            border-color: rgba(255, 255, 255, 0.5);
        }

        /* FOOTER */
=======
        .alert-error { /* Custom style cho lỗi */
            color: #fff; 
            background-color: rgba(255, 0, 0, 0.5); 
            border-color: rgba(255, 255, 255, 0.5);
        }
        
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
        .app-footer {
            background-color: transparent; 
            border-top: none;
            color: #ffffff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    
<<<<<<< HEAD

=======
    <%-- KHỐI HIỂN THỊ THÔNG BÁO TỪ SESSION (Đăng ký thành công hoặc Đăng xuất thành công) --%>
    <div class="container mt-3" style="max-width: 400px; margin: 20px auto;">
        <c:if test="${not empty sessionScope.successMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${sessionScope.successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%-- XÓA THÔNG BÁO SAU KHI HIỂN THỊ --%>
            <c:remove var="successMessage" scope="session"/>
        </c:if>
    </div>
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
    
    <%-- Main Content (Phần chứa Form Glassmorphism) --%>
    <div class="main-content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-auto">
                    <div class="login-card">
                        
<<<<<<< HEAD
                        <%-- LOGO --%>
=======
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
                        <img id="login-logo" src="img/lgo.png" alt="Logo" onerror="this.onerror=null;this.src='https://placehold.co/60x60/2a3a5e/ffffff?text=LOGO'">
                        
                        <h2 class="mb-4">Đăng nhập</h2>
                        
<<<<<<< HEAD
=======
                        <%-- 🔥 HIỂN THỊ LỖI ĐĂNG NHẬP THẤT BẠI --%>
                        <c:if test="${not empty requestScope.error}">
                            <div class="alert alert-error mb-3" role="alert">
                                ${requestScope.error}
                            </div>
                        </c:if>
                        
>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
                        <form action="${pageContext.request.contextPath}/login" method="POST"> 
                            
                           
                            <%-- Trường Email với Icon --%>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email:</label>
                                <div class="input-group-custom">
                                    <i class="fas fa-envelope input-icon"></i>
                                    <input type="email" id="email" name="email" class="form-control" required placeholder="Nhập địa chỉ Email">
                                </div>
                            </div>
                            
                            <%-- Trường Mật khẩu với Icon --%>
                            <div class="mb-4">
                                <label for="password" class="form-label">Mật khẩu:</label>
                                <div class="input-group-custom">
                                    <i class="fas fa-lock input-icon"></i>
                                    <input type="password" id="password" name="password" class="form-control" required placeholder="Nhập mật khẩu của bạn">
                                </div>
                            </div>
                                           
                            <button type="submit" class="btn btn-brand-primary w-100">ĐĂNG NHẬP</button>
                            
                            <div class="text-center mt-4 alt-link-text">
                                <p class="mb-0">Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a></p>            
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<<<<<<< HEAD
    
<%-- Login.jsp (Đặt trước </body>) --%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // ĐỌC THÔNG BÁO LỖI (từ forward của doPost)
        var errorMessage = '${requestScope.error}'; 
        
        // ĐỌC THÔNG BÁO THÀNH CÔNG ĐĂNG KÝ (từ handleFlashMessages trong doGet)
        var successMessage = '${requestScope.message}';
        
        // Hiển thị LỖI (Ví dụ: Sai email/mật khẩu)
        if (errorMessage && errorMessage.trim() !== '') {
            alert(errorMessage); 
        } 
        // Hiển thị THÀNH CÔNG ĐĂNG KÝ (hoặc Đăng xuất)
        else if (successMessage && successMessage.trim() !== '') {
             alert(successMessage);
        }
    });
</script>
    
=======
    <%-- 🔥 ĐOẠN SCRIPT CŨ GÂY POP-UP ĐÃ ĐƯỢC XÓA BỎ --%>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

>>>>>>> 1f2318a6134876182ac97f9a1301b0991db199fe
    </body> 
</html>