<%--
  Created by IntelliJ IDEA.
  User: John Pham
  Date: 12/11/2024
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="deznav">
    <div class="deznav-scroll">
        <ul class="metismenu" id="menu">
            <li>
                <a href="/admin/AdminIndexSL">
                    <i class="bi bi-house-door"></i>
                    <span class="nav-text">DashBroad</span>
                </a>
            </li>
            <li>
                <a href="orders.html">
                    <i class="bi bi-cart-check"></i>
                    <span class="nav-text">List Order</span>
                </a>
            </li>
            <li>
                <a href="staff.html">
                    <i class="bi bi-people"></i>
                    <span class="nav-text">List User and Admin</span>
                </a>
            </li>

            <li>
                <a href="/admin/ListProductServlet">
                    <i class="bi bi-box-seam"></i>
                    <span class="nav-text">List Product</span>
                </a>
            </li>
            <li>
                <a href="/admin/CategoryList">
                    <i class="bi bi-tags"></i>
                    <span class="nav-text">List Category</span>
                </a>
            </li>
            <li>
                <a href="blogs.html">
                    <i class="bi bi-journal-text"></i>
                    <span class="nav-text">List Blog</span>
                </a>
            </li>
            <li>
                <a href="../IndexServlet">
                    <i class="bi bi-box-arrow-right"></i>
                    <span class="nav-text">Logout</span>
                </a>
            </li>
        </ul>

        <div class="copyright">
            <p><strong>Books | Admin</strong> © 2024 All Rights Reserved</p>
        </div>
    </div>
</div>
<style>
    .metismenu li.active > a {
        background-color: #007bff; /* Màu nền cho mục active */
        color: white; /* Màu chữ */
        font-weight: bold;
    }

    .metismenu li.active > a i {
        color: white; /* Màu icon */
    }

    .deznav {
        position: relative; /* Hoặc absolute/fixed nếu cần */
        /*width: 250px; !* Đảm bảo kích thước không vượt quá khung chứa *!*/
        height: auto; /* Đảm bảo chiều cao đầy đủ */
    }

    .deznav-scroll {
        max-height: 100vh; /* Giới hạn chiều cao */
        overflow-y: auto; /* Kích hoạt cuộn dọc */
        -webkit-overflow-scrolling: touch; /* Hỗ trợ cuộn mượt trên di động */
    }


</style>
<script>
    // Lấy URL hiện tại
    const currentUrl = window.location.href;

    // Lặp qua tất cả các mục menu
    document.querySelectorAll('#menu li a').forEach(link => {
        // Kiểm tra nếu href của link trùng URL hiện tại
        if (link.href === currentUrl) {
            link.parentElement.classList.add('active'); // Thêm class 'active'
        }
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/metismenu@3.0.7/dist/metismenu.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const activeItem = document.querySelector('.metismenu li.active');
        const scrollContainer = document.querySelector('.deznav-scroll');

        if (activeItem && scrollContainer) {
            scrollContainer.scrollTop = activeItem.offsetTop - scrollContainer.offsetHeight / 2;
        }
    });

</script>
