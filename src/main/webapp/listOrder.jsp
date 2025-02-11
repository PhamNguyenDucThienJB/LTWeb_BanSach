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
                    <h2>Order List</h2>
                    <div class="breadcrumb__option">
                        <a href="index.jsp">Home </a>
                        <span>Order List</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%-- Kiểm tra xem có thông báo không --%>
<c:if test="${not empty message}">
    <div class="alert alert-success"
         style="text-align: center; width: 100%; display: flex; justify-content: center; align-items: center;">
        <strong>${message}</strong>
    </div>
</c:if><%-- Kiểm tra xem có thông báo không --%>

<section class="about spad" style="display: flex;">

    <div class="container-91 mx-auto">
        <div class="row">
            <div class="tab-content flex-sm-row mt-2">

                <%--                <c:if test="${sessionScope.cart.isEmpty()}">--%>
                <%--                    <!-- Hiển thị thông báo khi giỏ hàng trống -->--%>
                <%--                    <div class="cartEmpty" name="cartEmpty">--%>
                <%--                        <img src="./img/null.png" alt="Giỏ hàng của bạn đang trống" class="d-block m-auto" width="250"/>--%>
                <%--                        <p class="text-center font-weight-bold" style="opacity: .6;">Không có đơn hàng nào</p>--%>
                <%--                    </div>--%>
                <%--                    <div class="col-lg-12">--%>
                <%--                        <div class="shoping__cart__btns" style="text-align: center">--%>
                <%--                            <a href="./ListProduct" class="primary-btn cart-btn">Xem thêm sản phẩm</a>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </c:if>--%>

                <%--Thêm dòng kẻ ở chỗ này để tách rõ các đơn hàng--%>
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
                                            <%--                                        <div class="col-6 text-right my-2 pt-2">--%>
                                            <%--                                                                                                <small class="d-inline text-secondary">Trạng thái | </small>--%>
                                            <%--                                            <div class="d-inline pr-3 text-uppercase"--%>
                                            <%--                                            ><span>ĐỊA CHỈ GIAO HÀNG: </span>--%>
                                            <%--                                                <span style="color:#ee4d2d; font-size:14px">${order.diachigiao}</span>--%>
                                            <%--                                                <!-- Hiển thị địa chỉ giao hàng -->--%>
                                            <%--                                            </div>--%>
                                            <%--                                        </div>--%>
                                    </div>

                                    <div class="card mb-3 border-left-0 border-right-0 border-bottom-0 mx-3">
                                        <div class="row my-3 pb-3 mx-2" style="border-bottom:1px solid #eee">
                                            <div class="col-2">
                                                <div class="vertical-center">
                                                    <!-- Chỉ hiển thị ảnh đầu tiên trong danh sách anhsp -->
                                                    <img class="d-block mx-auto" src="${order.anhsp[0]}" width="100">
                                                </div>
                                            </div>
                                            <div class="col-7">
                                                <div class="card-body my-0">
                                                    <div class="card-text text-dark">
                                                        <a href="#"
                                                           class="text-decoration-none text-dark text-uppercase">
                                                                ${order.tensp} <!-- Hiển thị tên sản phẩm -->
                                                        </a>
                                                    </div>
                                                    <div class="text-dark" style="font-size:14px">x ${order.solg}</div>
                                                    <!-- Hiển thị số lượng -->
                                                </div>
                                            </div>
                                            <div class="col-3 mt-3">
                                                <small class="text-dark">
                                                    <fmt:formatNumber value="${order.price}" type="number"
                                                                      groupingUsed="true"/> VND</small>
                                                <!-- Hiển thị giá -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="total-amount">
                            <h6>Tổng số tiền: </h6>
                            <h3 style="color:#ee4d2d">
                                <fmt:formatNumber value="${group.value[0].totalprice}" type="number"
                                                  groupingUsed="true"/> VND
                            </h3>
                            <!-- Hiển thị địa chỉ giao hàng -->
                            <p><strong style="color: black">Ngày đặt hàng: </strong> ${group.value[0].date}
                            </p
                            <p><strong style="color: black">Địa chỉ giao hàng: </strong> ${group.value[0].diachigiao}
                            </p
                            <p><strong style="color: black">Số Điện Thoại: </strong> ${group.value[0].tele}
                            </p>

                            <!-- Hiển thị trạng thái sản phẩm -->
                            <p><strong style="color: black">Trạng thái sản phẩm:</strong>
                                <c:choose>
                                <c:when test="${group.value[0].status == 0}">
                                <span style="color:red;">Chờ xác nhận</span>
                            <form action="/DeleteOrder" method="POST" style="display:inline;">
                                <input type="hidden" name="idOrder" value="${group.value[0].mahd}"/>
                                <button type="submit" class="btn btn-danger btn-sm">Hủy đơn hàng</button>
                            </form>
                            </c:when>
                            <c:when test="${group.value[0].status == 1}">
                                <span style="color:orange;">Đã xác nhận</span>
                            </c:when>
                            <c:when test="${group.value[0].status == 2}">
                                <span style="color:green;">Đang giao hàng</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color:gray;">Không xác định</span>
                            </c:otherwise>
                            </c:choose>
                            </p>
                        </div>
                    </div>
                    <hr style="border: 5px solid #ccc; margin: 20px 0;">
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