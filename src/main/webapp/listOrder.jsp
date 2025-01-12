<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Books | List Order</title>

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
          rel="stylesheet">
    <!-- ==================== -->
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

<!-- Hero Section Begin -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><fmt:message key="breadcrumb.title" bundle="${bundle}"/></h2>
                    <div class="breadcrumb__option">
                        <a href="index.jsp"><fmt:message key="breadcrumb.home" bundle="${bundle}"/></a>
                        <span><fmt:message key="breadcrumb.introduction" bundle="${bundle}"/></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="about spad" style="display: flex;">
    <div class="container-91 mx-auto">
        <div class="row">
            <div class="tab-content flex-sm-row mt-2">

                <%--                <div class="cartEmpty" name="cartEmpty">--%>
                <%--                    <img src="./img/null.png" alt="Giỏ hàng của bạn đang trống" class="d-block m-auto" width="250"/>--%>
                <%--                    <p class="text-center font-weight-bold" style="opacity: .6;">Không có đơn hàng nào</p>--%>
                <%--                </div>--%>
                <div class="col-lg-12">
                    <div class="shoping__cart__btns" style="text-align: center">
                        <a href="./ListProduct" class="primary-btn cart-btn">Xem thêm sản phẩm </a>
                    </div>
                </div>
                    <c:forEach var="group" items="${groupedOrders}">
                        <div class="order-group">
                            <h3>Mã đơn hàng: ${group.key}</h3>
                            <div class="order-details">
                                <c:forEach var="order" items="${group.value}">
                                    <div class="order-item">
                                        <div class="row">
                                            <div class="col-6">
<%--                                                <small class="text-secondary d-inline-block pt-3 pl-3">Mã đơn hàng: ${order.mahd}</small>--%>
                                            </div>
                                            <div class="col-6 text-right my-2 pt-2">
<%--                                                <small class="d-inline text-secondary">Trạng thái | </small>--%>
                                                <div class="d-inline pr-3 text-uppercase" style="color:#ee4d2d; font-size:14px">
                                                    <span>${order.diachigiao}</span> <!-- Hiển thị địa chỉ giao hàng -->
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card mb-3 border-left-0 border-right-0 border-bottom-0 mx-3">
                                            <div class="row my-3 pb-3 mx-2" style="border-bottom:1px solid #eee">
                                                <div class="col-2">
                                                    <div class="vertical-center">
                                                        <!-- Chỉ hiển thị ảnh đầu tiên trong danh sách anhsp -->
                                                        <img class="d-block mx-auto" src="${not empty order.anhsp ? order.anhsp[0] : '/path/to/default/image.jpg'}" width="100">
                                                    </div>
                                                </div>
                                                <div class="col-7">
                                                    <div class="card-body my-0">
                                                        <div class="card-text text-dark">
                                                            <a href="#" class="text-decoration-none text-dark text-uppercase">
                                                                    ${order.tensp} <!-- Hiển thị tên sản phẩm -->
                                                            </a>
                                                        </div>
                                                        <div class="text-dark" style="font-size:14px">x ${order.solg}</div> <!-- Hiển thị số lượng -->
                                                    </div>
                                                </div>
                                                <div class="col-3 mt-3">
                                                    <small class="text-dark">${DetailRecipe.formatNum(order.price)} VND</small> <!-- Hiển thị giá -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="total-amount">
                                <h6>Tổng số tiền: </h6>
                                <h3 style="color:#ee4d2d">
                                    <!-- Tính tổng số tiền cho đơn hàng -->
                                    VND
                                </h3>
                            </div>
                        </div>
                    </c:forEach>



            </div>
        </div>
    </div>
</section>

<!-- About Section End -->


<!-- Footer Section Begin -->
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