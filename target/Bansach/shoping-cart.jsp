<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Books | Giỏ Hàng </title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
            rel="stylesheet">
    <!-- ==================== -->
    <link rel="icon" href="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/favicon.png?1730705463447"
          type="image/x-icon">
    <!-- Css Styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="icon" href="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/favicon.png?1730705463447"
          type="image/x-icon">
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>


<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<jsp:include page="header.jsp"></jsp:include>
<!-- Breadcrumb Section End -->
<!-- Phần tử chứa thông báo -->
<div id="notifications" class="custom-notifications"></div>

<!-- CSS cho thông báo -->

<c:if test="${empty cartItems}">
    <div class="alert alert-warning" role="alert">
        Giỏ hàng của bạn đang trống. Vui lòng thêm sản phẩm.
    </div>
</c:if>


<section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Giỏ Hàng</h2>
                    <div class="breadcrumb__option">
                        <a href="./IndexServlet"> Trang Chủ</a>
                        <span>Giỏ Hàng </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Sản phẩm</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td class="shoping__cart__item">
                                    <img src="${item.sp.listImg[0]}" alt="${item.sp.name}">
                                    <h5>${item.sp.name}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                    <fmt:formatNumber value="${item.price}" type="number" groupingUsed="true"/> VND
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <form action="/UpdateCart" method="POST" class="quantity-form">
                                            <!-- ID sản phẩm -->
                                            <input type="hidden" name="productId" value="${item.masp}">

                                            <!-- Nút giảm số lượng -->
                                            <button type="button" class="btn-dec qtybtn"
                                                    onclick="updateQuantity(this, -1)">-
                                            </button>

                                            <!-- Ô nhập số lượng -->
                                            <input type="number" name="quantity" value="${item.soLgMua}" min="1"
                                                   readonly
                                                   style="width: 50px; text-align: center;">

                                            <!-- Nút tăng số lượng -->
                                            <button type="button" class="btn-inc qtybtn"
                                                    onclick="updateQuantity(this, 1)">+
                                            </button>

                                            <!-- Nút gửi form để cập nhật -->
                                            <button type="submit" class="btn btn-update">Cập nhật</button>
                                        </form>
                                    </div>

                                </td>

                                <td class="shoping__cart__total">
                                    <fmt:formatNumber value="${item.price * item.soLgMua}" type="number"
                                                      groupingUsed="true"/> VND
                                </td>
                                <td class="shoping__cart__item__close">
                                    <a href="/Remove?productId=${item.masp}">
                                        <span class="icon_close"></span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>


                        </tbody>

                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__btns">
                    <a href="shop-product.jsp" class="primary-btn cart-btn">Xem thêm sản phẩm </a>

                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__continue">
                    <div class="shoping__discount">
                        <h5>Mã giảm giá</h5>
                        <form action="#">
                            <input type="text" placeholder="Nhập mã giảm giá của bạn...">
                            <button type="submit" class="site-btn">Xong</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Tổng cộng</h5>
                    <ul>
                        <li>Tổng tiền <span><fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true"/> VND</span>
                        </li>
                        <li>Tổng thanh toán <span><fmt:formatNumber value="${totalPrice }" type="number"
                                                                    groupingUsed="true"/> VND</span></li>
                    </ul>
                    <a href="./DoCheckout" class="primary-btn">THANH TOÁN NGAY</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shoping Cart Section End -->

<!-- Footer Section Begin -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>


</body>

</html>
<script>
    function updateQuantity(button, change) {
        const form = button.closest('.quantity-form'); // Lấy form gần nhất
        const quantityInput = form.querySelector('input[name="quantity"]');
        let currentValue = parseInt(quantityInput.value) || 1;

        // Tăng hoặc giảm giá trị
        const newValue = currentValue + change;
        if (newValue > 0) {
            quantityInput.value = newValue; // Gán giá trị mới
        }
    }

</script>
<style>
    .quantity {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .quantity .qtybtn {
        width: 30px;
        height: 30px;
        font-size: 18px;
        color: white;
        background-color: #007bff;
        border: none;
        border-radius: 3px;
        text-align: center;
        cursor: pointer;
    }

    .quantity .qtybtn:hover {
        background-color: #0056b3;
    }

    .quantity input[name="quantity"] {
        width: 50px;
        text-align: center;
        border: 1px solid #ddd;
        border-radius: 3px;
        padding: 5px;
    }

    .quantity .btn-update {
        padding: 5px 10px;
        background-color: #28a745;
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    .quantity .btn-update:hover {
        background-color: #218838;
    }

    /* Nút giảm - màu đỏ */
    .quantity .btn-dec {
        background-color: #dc3545; /* Màu đỏ */
    }

    .quantity .btn-dec:hover {
        background-color: #c82333; /* Màu đỏ đậm khi hover */
    }

    /* Nút tăng - màu xanh */
    .quantity .btn-inc {
        background-color: #007bff; /* Màu xanh */
    }

    .quantity .btn-inc:hover {
        background-color: #0056b3; /* Màu xanh đậm khi hover */
    }


</style>


<style>
    .alert-warning {
        background-color: #f8d7da;
        color: #721c24;
        padding: 10px;
        border-radius: 5px;
        font-weight: bold;
        margin: 20px 0;
        text-align: center; /* Căn giữa nội dung theo chiều ngang */
        display: flex; /* Sử dụng flexbox để căn giữa theo chiều dọc */
        justify-content: center; /* Căn giữa theo chiều ngang */
        align-items: center; /* Căn giữa theo chiều dọc */
        height: 100px; /* Cung cấp chiều cao cho thông báo */
    }


</style>