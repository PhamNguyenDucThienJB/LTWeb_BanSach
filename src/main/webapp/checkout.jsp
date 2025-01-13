<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <title>Books | Checkout</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
            rel="stylesheet">
    <!-- ==================== -->

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

<!-- Humberger Begin -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Thanh Toán</h2>
                    <div class="breadcrumb__option">
                        <a href="./IndexServlet"> Trang Chủ</a>
                        <span>Giỏ Hàng -</span>
                        <span> Thanh Toán</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h6><span class="icon_tag_alt"></span> Bạn có voucher? Sử dụng ngay <a href="#">tại đây</a>
                </h6>
            </div>
        </div>
        <div class="checkout__form">
            <h4>Thông Tin Thanh Toán</h4>
            <form action="/AddNewOrder" method="GET">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="row">

                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Họ và Tên<span> *</span></p>
                                    <input type="text" name="name" value="${auth.tentk}">
                                </div>
                            </div>
                        </div>
                        <!-- <div class="checkout__input">
                            <p>Country<span>*</span></p>
                            <input type="text">
                        </div> -->
                        <div class="checkout__input">
                            <p>Địa chỉ<span>*</span></p>
                            <!-- <input type="text" placeholder="Tên Đường" class="checkout__input__add"> -->
                            <input type="text" name="address" placeholder="Số nhà, xã/phường, quận/huyện"
                                   value="${inforUser.DIACHI}">
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Điện Thoại<span> * </span></p>
                                    <input type="text" name="tele" value="${inforUser.SDT}">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span> * </span></p>
                                    <input type="text" name="email" value="${auth.email}">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>Ghi chú cho cửa hàng</p>
                            <input name="note" type="text"
                                   placeholder="VD: Giao giờ hành chính,...">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>Đơn hàng</h4>
                            <div class="checkout__order__products">Sản Phẩm <span>Tổng</span></div>
                            <ul>
                                <c:forEach var="item" items="${cartItems}">
                                    <li>${fn:substring(item.sp.name, 0, 15)}...
                                        <span><fmt:formatNumber value="${item.price}" type="number"
                                                                groupingUsed="true"/> VND</span>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="checkout__order__subtotal">Tạm tính <span><fmt:formatNumber
                                    value="${totalPrice}" type="number" groupingUsed="true"/> VND</span></div>
                            <div class="checkout__order__total">Tổng
                                <span><fmt:formatNumber value="${totalPrice}" type="number"
                                                        groupingUsed="true"/> VND</span>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="acc-or">
                                    Tạo Tài Khoản?
                                    <input type="checkbox" id="acc-or">
                                    <span class="checkmark"></span>
                                </label>
                            </div>

                            <div class="checkout__input__checkbox">
                                <label for="payment">
                                    Thanh Toán Khi Nhận Hàng
                                    <input type="checkbox" id="payment">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="checkout__input__checkbox">
                                <label for="paypal">
                                    MOMO
                                    <input type="checkbox" id="paypal">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <button type="submit" class="site-btn">ĐẶT HÀNG
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<jsp:include page="footer.jsp"></jsp:include>
<!-- Footer Section End -->
<!-- back to top btn -->
<a href="#" class="btn-to-top back-to-top"><i class="fa fa-angle-double-up"></i></a>
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


<style>
    /* CSS */

    .custom-buttons {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #1C1D22;
    }

    .custom-buttons button {
        padding: 10px;
    }

    .custom-notifications {
        position: fixed;
        top: 30px;
        right: 20px;
        z-index: 1000000000;
    }

    .custom-toast {
        position: relative;
        padding: 10px;
        color: #fff;
        margin-bottom: 10px;
        width: 400px;
        display: grid;
        grid-template-columns: 70px 1fr 70px;
        border-radius: 5px;
        --color: #0abf30;
        background-image: linear-gradient(
                to right, #0abf3055, #22242f 30%
        );
        animation: show 0.3s ease 1 forwards;
        z-index: 1000000000;
    }

    .custom-toast i {
        color: var(--color);
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: x-large;
    }

    .custom-toast .custom-title {
        font-size: x-large;
        font-weight: bold;
    }

    .custom-toast .fa-xmark {
        cursor: pointer;
        font-size: 18px;
        /*background-color: lightblue;*/
    }

    .custom-toast span, .custom-toast i:nth-child(3) {
        color: #fff;
        opacity: 0.6;
    }

    @keyframes show {
        0% {
            transform: translateX(100%);
        }
        40% {
            transform: translateX(-5%);
        }
        80% {
            transform: translateX(0%);
        }
        100% {
            transform: translateX(-10%);
        }
    }

    .custom-toast::before {
        position: absolute;
        bottom: 0;
        left: 0;
        background-color: var(--color);
        width: 100%;
        height: 3px;
        content: '';
        box-shadow: 0 0 10px var(--color);
        animation: timeOut 5s linear 1 forwards;
    }

    @keyframes timeOut {
        to {
            width: 0;
        }
    }

    .custom-toast.custom-error {
        --color: #f24d4c;
        background-image: linear-gradient(
                to right, #f24d4c55, #22242F 30%
        );
    }

    .custom-toast.custom-warning {
        --color: #e9bd0c;
        background-image: linear-gradient(
                to right, #e9bd0c55, #22242F 30%
        );
    }

    .custom-toast.custom-info {
        --color: #3498db;
        background-image: linear-gradient(
                to right, #3498db55, #22242F 30%
        );
    }
</style>