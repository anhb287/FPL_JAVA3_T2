<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Trang Chủ - Góc Nhìn Báo Chí </title>
    <link rel="stylesheet" href="css/style.css">
    
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
</head>
<body>
    <header class="header">
    	<img src="img/lgo.png" alt="Logo ABC News" class="header-image">
        
        <div class="header-login">
            <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
        </div>
        
    </header>

    <jsp:include page="menu.jsp" />

    <main class="content-container">
        <section class="main-content">
            <h2>Tin Nổi Bật Trên Trang Nhất</h2>

            <article class="news-item">
                <img src="img/hinh1.png" alt="Ảnh Bản tin 1" class="news-image">
                <div class="news-info">
                    <h3><a href="detail.jsp?id=1">Tiêu đề bản tin nổi bật 1 (Văn hóa)</a></h3>
                    <p class="excerpt">Trích lấy phần đầu của nội dung bản tin. Đây là đoạn tóm tắt ngắn gọn để độc giả có thể nắm bắt nội dung chính. </p>
                    <p class="meta">Ngày đăng: 20/11/2025 | Tác giả: Nguyễn Văn A</p>
                </div>
            </article>

            <article class="news-item">
                <img src="img/hinh2.png" alt="Ảnh Bản tin 2" class="news-image">
                <div class="news-info">
                    <h3><a href="detail.jsp?id=2">Tiêu đề bản tin nổi bật 2 (Pháp luật)</a></h3>
                    <p class="excerpt">Trích lấy phần đầu của nội dung bản tin. Đoạn trích này chỉ nên có số ký tự phù hợp để hiển thị đẹp trên trang chủ. </p>
                    <p class="meta">Ngày đăng: 19/11/2025 | Tác giả: Trần Thị B</p>
                </div>	
            </article>
            
        </section>

        <jsp:include page="sidebar.jsp"/>
    </main>

    <footer class="footer">
        <p>Góc Nhìn Báo Chí</p>
    </footer>
</body>
</html>