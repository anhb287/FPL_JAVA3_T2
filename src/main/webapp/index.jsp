<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<!DOCTYPE html>
<html>
<head>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

<link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Trang Chủ - Góc Nhìn Báo Chí </title>
    <link rel="stylesheet" href="css/style.css">
    
    <style>
        /* 1. Căn chỉnh Header (Sử dụng Flexbox) */
        .header {
            display: flex; 
            justify-content: space-between;
            align-items: center; 
            padding: 15px 30px; 
            background-color: #ffffff; 
            border-bottom: 1px solid #eeeeee; 
            height: 80px; 
        }

        /* 2. Điều chỉnh kích thước Logo cho VỪA PHẢI */
        .header-image {
            height: 120px; 
            width: 150px; 
        }
        
        /* CSS cho header-login */
        .header-login {
            display: flex;
            align-items: center;
            font-size: 1.05rem;
        }
        .header-login a {
            text-decoration: none;
            margin: 0 5px; 
        }
        .header-login strong {
            color: #333; 
        }
    </style>
</head>
<body>
    
    <%-- 🔥 KHỐI HIỂN THỊ FLASH MESSAGE (Sau khi Đăng nhập/Đăng xuất thành công) --%>
    <div class="container mt-3"> 
        <c:if test="${not empty sessionScope.flashMessage}">
            <%-- THÊM ID ĐỂ DÙNG TRONG JAVASCRIPT --%>
            <div id="autoDismissAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                ${sessionScope.flashMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%-- QUAN TRỌNG: XÓA THÔNG BÁO SAU KHI HIỂN THỊ --%>
            <c:remove var="flashMessage" scope="session"/>
        </c:if>
    </div>
    
    <header class="header">
    	<img src="img/lgo.png" alt="Logo ABC News" class="header-image">
        
        <%-- 🔥 LOGIC JSTL HIỂN THỊ TÊN NGƯỜI DÙNG --%>
        <div class="header-login">
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <%-- HIỂN THỊ TÊN VÀ NÚT ĐĂNG XUẤT --%>
                    Xin chào, 
                        <strong>${sessionScope.loggedInUser.fullname}</strong>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-sm btn-danger ms-2">Đăng xuất</a>
                </c:when>
                <c:otherwise>
                    <%-- HIỂN THỊ NÚT ĐĂNG NHẬP --%>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-sm btn-primary">Đăng nhập</a>
                </c:otherwise>
            </c:choose>
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    <%-- SCRIPT TỰ ĐỘNG TẮT THÔNG BÁO SAU 3 GIÂY --%>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Lấy phần tử thông báo bằng ID đã thêm
            const alertElement = document.getElementById('autoDismissAlert');
            
            if (alertElement) {
                // Tự động tắt sau 3000 mili giây (3 giây)
                setTimeout(() => {
                    // Tạo đối tượng Alert của Bootstrap
                    const alert = bootstrap.Alert.getOrCreateInstance(alertElement);
                    // Gọi phương thức đóng
                    alert.close();
                }, 2000); 
            }
        });
    </script>
</body>
</html>