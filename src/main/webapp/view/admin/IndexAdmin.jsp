<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%-- <<< CẦN THÊM DÒNG NÀY CHO JSTL --%>
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
        
       
 

/* CSS cho nút Đăng xuất */
.header-login a {
	text-decoration: none;
	color: #d9534f; /* Màu đỏ cho Đăng xuất */
	font-weight: 700;
	padding: 8px 15px;
	border: 2px solid #d9534f;
	border-radius: 5px;
	transition: all 0.3s;
}

.header-login a:hover {
	background-color: #d9534f;
	color: white;
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;1,400&family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Giao Diện Quản Trị - Góc Nhìn Báo Chí</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<div id="page-container">

		<%@ taglib prefix="c" uri="jakarta.tags.core"%>
		<%-- Giả sử đây là phần Header của trang index.jsp hoặc Admin Page --%>

		<header class="header">
			<img src="${pageContext.request.contextPath}/img/lgo.png" alt="Logo"
				class="header-image">

			<div class="header-login">

				<c:choose>
					<%-- KIỂM TRA: Nếu sessionScope.currentUser tồn tại (đã đăng nhập) --%>
					<c:when test="${not empty sessionScope.currentUser}">
						<%-- Hiển thị tên người dùng và nút ĐĂNG XUẤT --%>
						<span style="font-weight: 500; margin-right: 15px;"> Xin
							chào, ${sessionScope.currentUser.fullname}! </span>
						<a href="${pageContext.request.contextPath}/logout"
							class="btn btn-danger btn-sm"> Đăng xuất </a>
					</c:when>

					<%-- NGƯỢC LẠI: Chưa đăng nhập --%>
					<c:otherwise>
						<%-- Hiển thị nút ĐĂNG NHẬP (Link chuyển hướng) --%>
						<a href="${pageContext.request.contextPath}/login"
							class="btn btn-primary btn-sm"> Đăng nhập </a>
					</c:otherwise>
				</c:choose>

			</div>
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


	<%-- 🛑 BƯỚC QUAN TRỌNG: Logic Pop-up và Xóa Flash Message --%>
	<%-- Đây là nơi Pop-up "Đăng nhập thành công" sẽ hiển thị --%>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            // ĐỌC TRỰC TIẾP FLASH MESSAGE TỪ SESSION
            var successMessage = '${sessionScope.flashMessage}'; 
            
            if (successMessage && successMessage.trim() !== '') {
                alert(successMessage); 
            }
        });
    </script>

	<%-- Dùng JSTL để XÓA thông báo ngay sau khi hiển thị (Ngăn lỗi quay lại trang Login) --%>
	<c:remove var="flashMessage" scope="session" />
	<c:remove var="flashError" scope="session" />

</body>
</html>