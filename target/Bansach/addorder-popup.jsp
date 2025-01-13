<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Cart Success</title>
    <!-- Link Google Fonts -->
    <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
            rel="stylesheet">
    <!-- Link Bootstrap CSS -->
    <link rel="icon" href="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/favicon.png?1730705463447"
          type="image/x-icon">
    <!-- Css Styles -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .btn-primary {
            background-color: #fd7e14; /* Xanh dương */
            border-color: #fd7e14;
        }

        .btn-primary:hover {
            background-color: #e36d0f;
            border-color: #e36d0f;
        }

        .btn-danger {
            background-color: #dc3545; /* Đỏ */
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #b02a37;
            border-color: #7c1d27;
        }

        .text-red {
            color: #dc3545; /* Màu đỏ */
            font-weight: bold;
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center bg-dark bg-gradient vh-100">
<div class="card shadow-lg p-4 text-center" style="max-width: 400px; border-radius: 15px;">
    <div class="card-body">
        <p class="card-text fs-5 text-muted mb-4"> Đã thêm <span class="text-red">thành công</span> sản phẩm vào đơn hàng
        </p>
        <div class="d-grid gap-2">
            <button class="btn btn-primary btn-lg" onclick="window.location.href='/ListOrder';">Xem đơn hàng</button>
            <button class="btn btn-danger btn-lg" onclick="window.location.href='/ListProduct';">Thôi tôi mua tiếp !!!
            </button>
        </div>
    </div>
</div>
<!-- Link Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
