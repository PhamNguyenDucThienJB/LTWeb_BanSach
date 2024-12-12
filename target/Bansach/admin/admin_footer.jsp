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
                <a href="dashboard.html">
                    <i class="bi bi-house-door"></i>
                    <span class="nav-text">DashBroad Admin</span>
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
                    <span class="nav-text">List Staff</span>
                </a>
            </li>
            <li>
                <a href="customers.html">
                    <i class="bi bi-person"></i>
                    <span class="nav-text">List Costumer</span>
                </a>
            </li>
            <li>
                <a href="products.html">
                    <i class="bi bi-box-seam"></i>
                    <span class="nav-text">List Product</span>
                </a>
            </li>
            <li>
                <a href="categories.html">
                    <i class="bi bi-tags"></i>
                    <span class="nav-text">List Categary</span>
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
