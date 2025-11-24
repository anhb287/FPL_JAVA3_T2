<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="sidebar">
    <div class="widget hot-news">
        <h3>5 bản tin được xem nhiều</h3>
        <ul>
            <li><a href="detail.jsp?id=hot1">Tin Hot Về Vấn Đề Pháp Luật</a></li>
            <li><a href="detail.jsp?id=hot2">Tin Hot Về Vấn Đề Giáo Dục </a></li>
            <li><a href="detail.jsp?id=hot3">Tin Hot Về Vấn Đề Thể Thao</a></li>
            <li><a href="detail.jsp?id=hot4">Tin Hot Về Vấn Đề Thời Sự</a></li>
            <li><a href="detail.jsp?id=hot5">Tin Hot Về Vấn Đề Văn Hóa</a></li>
        </ul>
    </div>

    <div class="widget new-news">
        <h3>6 bản tin mới nhất</h3>
        <ul>
            <li><a href="detail.jsp?id=new1">Tin Mới Nhất </a></li>
            <li><a href="detail.jsp?id=new2">Tin Mới Về Giáo Dục </a></li>
            <li><a href="detail.jsp?id=new3">Tin Mới Về Pháp Luật</a></li>
            <li><a href="detail.jsp?id=new4">Tin Mới Về Thể Thao</a></li>
            <li><a href="detail.jsp?id=new5">Tin Mới Về Thời Sự</a></li>
            <li><a href="detail.jsp?id=new5">Tin Mới Về Văn Hóa</a></li>
            
        </ul>
    </div>

    <div class="widget viewed-news">
        <h3>5 bản tin đã bạn đã xem</h3>
        <ul>
            <li><a href="detail.jsp?id=view1">Tin đã xem </a></li>
            <li><a href="detail.jsp?id=view2">Tin đã xem </a></li>
            <li><a href="detail.jsp?id=view3">Tin đã xem </a></li>
            <li><a href="detail.jsp?id=view4">Tin đã xem </a></li>
            <li><a href="detail.jsp?id=view5">Tin đã xem </a></li>
        </ul>
    </div>

    <div class="widget newsletter">
        <h3>Đăng ký Newsletter</h3>
        <p>Nhập email để nhận tin mới nhất từ ABC News.</p>
        <form action="newsletter-register" method="POST">
            <input type="email" name="email" placeholder="Email nhận bản tin" required>
            <button type="submit">Đăng ký</button>
        </form>
    </div>
</aside>