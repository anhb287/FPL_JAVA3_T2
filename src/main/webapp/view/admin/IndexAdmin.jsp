<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style>
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
        
       
    </style>
<link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Giao Diện Quản Trị - Góc Nhìn Báo Chí </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"> 
</head>
<body>    
    
    <div id="page-container">
        
        <header class="header">
            <img src="${pageContext.request.contextPath}/img/lgo.png" alt="Logo ABC News" class="header-image">
           <%--  <div class="header-login">
                <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
            </div> --%>
        </header>
        <jsp:include page="MenuAdmin.jsp" /> 

        <main id="content-wrap" style="padding: 20px; text-align: center;">
            <h2>Vùng Nội Dung Chính</h2>
            <p>Nội dung của trang Admin/Phóng viên.</p>
            </main>
    </div>
        
    
    <footer class="footer">
        <p>Góc Nhìn Báo Chí</p>
    </footer>
</body>
</html>