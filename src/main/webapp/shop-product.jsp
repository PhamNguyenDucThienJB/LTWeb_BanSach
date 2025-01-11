<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Books | Sản phẩm</title>

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


<!-- Humberger End -->


<!-- Header Section Begin -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Header Section End -->

<!-- Hero Section Begin -->

<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Sản phẩm</h2>
                    <div class="breadcrumb__option">
                        <a href="./IndexServlet">Trang Chủ</a>
                        <span>Sản Phẩm</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Các Loại Sách</h4>
                        <ul class="slidebar__loaibanh">
                            <li class="text__loaibanh"><a class="text__loaibanh__active" href="./shop-product.html">Tất
                                cả</a></li>
                            <c:forEach var="categories" items="${categoriesList}">
                                <li class="text__loaibanh"><a href="">${categories.bookName}</a></li>
                            </c:forEach>

                        </ul>
                    </div>
                    <div class="sidebar__item">
                        <h4>Giá (VNĐ)</h4>
                        <div class="price-range-wrap">
                            <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                 data-min="50" data-max="1000">
                                <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all vnd-state-default"></span>
                                <span tabindex="0" class="ui-slider-handle ui-corner-all vnd-state-default"></span>
                            </div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="sidebar__item">
                        <h4>Kích thước</h4>
                        <div class="sidebar__item__size">
                            <label for="large">
                                Lớn
                                <input type="radio" id="large">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="medium">
                                Vừa
                                <input type="radio" id="medium">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="small">
                                Nhỏ
                                <input type="radio" id="small">
                            </label>
                        </div>
                        <div class="sidebar__item__size">
                            <label for="tiny">
                                Bé
                                <input type="radio" id="tiny">
                            </label>
                        </div>
                    </div>
                    <%--                    <div class="sidebar__item">--%>
                    <%--                        <div class="latest-product__text">--%>
                    <%--                            <h4>Top Bán Chạy</h4>--%>
                    <%--                            <div class="latest-product__slider owl-carousel">--%>
                    <%--                                <div class="latest-prdouct__slider__item">--%>
                    <%--                                    <a href="#" class="latest-product__item">--%>
                    <%--                                        <div class="latest-product__item__pic">--%>
                    <%--                                            <img src="./img/product/B019/banh1.jpg" alt="">--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="latest-product__item__text">--%>
                    <%--                                            <h6>Bánh Sinh Nhật</h6>--%>
                    <%--                                            <span>200,000 VND</span>--%>
                    <%--                                        </div>--%>
                    <%--                                    </a>--%>
                    <%--                                    <a href="#" class="latest-product__item">--%>
                    <%--                                        <div class="latest-product__item__pic">--%>
                    <%--                                            <img src="./img/product/B022/banh1.jpg" alt="">--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="latest-product__item__text">--%>
                    <%--                                            <h6>Bánh Sinh Nhật</h6>--%>
                    <%--                                            <span>250,000 VND</span>--%>
                    <%--                                        </div>--%>
                    <%--                                    </a>--%>
                    <%--                                    <a href="#" class="latest-product__item">--%>
                    <%--                                        <div class="latest-product__item__pic">--%>
                    <%--                                            <img src="./img/product/B023/banh1.jpg" alt="">--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="latest-product__item__text">--%>
                    <%--                                            <h6>Bánh Sinh Nhật</h6>--%>
                    <%--                                            <span>300,000 VND</span>--%>
                    <%--                                        </div>--%>
                    <%--                                    </a>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="latest-prdouct__slider__item">--%>
                    <%--                                    <a href="#" class="latest-product__item">--%>
                    <%--                                        <div class="latest-product__item__pic">--%>
                    <%--                                            <img src="./img/product/B024/banh1.jpg" alt="">--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="latest-product__item__text">--%>
                    <%--                                            <h6>Bánh Sinh Nhật</h6>--%>
                    <%--                                            <span>300,000 VND</span>--%>
                    <%--                                        </div>--%>
                    <%--                                    </a>--%>
                    <%--                                    <a href="#" class="latest-product__item">--%>
                    <%--                                        <div class="latest-product__item__pic">--%>
                    <%--                                            <img src="./img/product/B025/banh1.jpg" alt="">--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="latest-product__item__text">--%>
                    <%--                                            <h6>Bánh Sinh Nhật</h6>--%>
                    <%--                                            <span>300,000 VND</span>--%>
                    <%--                                        </div>--%>
                    <%--                                    </a>--%>
                    <%--                                    <a href="#" class="latest-product__item">--%>
                    <%--                                        <div class="latest-product__item__pic">--%>
                    <%--                                            <img src="./img/product/B026/banh1.jpg" alt="">--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="latest-product__item__text">--%>
                    <%--                                            <h6>Bánh Sinh Nhật</h6>--%>
                    <%--                                            <span>300,000 VND</span>--%>
                    <%--                                        </div>--%>
                    <%--                                    </a>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">

                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort">
                                <span>Sắp Xếp</span>
                                <select>
                                    <option value="0">Mặc định</option>
                                    <option value="0">Giá từ cao tới thấp</option>
                                    <option value="0">Giá từ thấp đến cao</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>${sizeProduct}</span> Sản phẩm</h6>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-3">
                            <div class="filter__option">
                                <span class="icon_grid-2x2"></span>
                                <!-- <span class="icon_ul"></span> -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="list" items="${listProduct}">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${list.listImg[0]}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li>
                                            <a href="javascript:void(0);" class="add-to-cart">
                                                <i class="fa fa-shopping-cart"></i>
                                            </a>
                                            <form action="/AddCart" class="test" method="post" style="display:none;">
                                                <input type="hidden" name="productId" value="${list.id}">
                                                <input type="hidden" name="quantity" value="1">
                                            </form>
                                        </li>

                                    </ul>
                                </div>

                                <div class="product__item__text">
                                    <h6><a href="./DetailProduct?productID=${list.id}">${list.name}</a></h6>
                                    <h5><fmt:formatNumber value="${list.price}" type="number" groupingUsed="true"/>
                                        VND</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="product__pagination">
                    <!-- Nút trang trước -->
                    <c:if test="${currentPage > 1}">
                        <a href="?page=${currentPage - 1}"><i class="fa fa-long-arrow-left"></i></a>
                    </c:if>

                    <!-- Hiển thị danh sách các trang -->
                    <c:forEach var="i" begin="1" end="${endPage}">
                        <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                    </c:forEach>

                    <!-- Nút trang tiếp theo -->
                    <c:if test="${currentPage < endPage}">
                        <a href="?page=${currentPage + 1}"><i class="fa fa-long-arrow-right"></i></a>
                    </c:if>
                </div>


            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
<!-- Footer Section End -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- back to top btn -->
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
    .product__pagination a.active {
        color: #fff;
        background-color: #fd7e14; /* Màu nền cho trang hiện tại */
        border-radius: 50%; /* Làm cho nút tròn */
    }

    .product__pagination a:hover {
        background-color: #fd7e14; /* Màu khi hover */
        color: #fff; /* Màu chữ khi hover */
    }

</style>
<script>
    document.querySelectorAll('.add-to-cart').forEach(anchor => {
        anchor.addEventListener('click', (event) => {
            const form = event.currentTarget.nextElementSibling; // Lấy form ngay sau thẻ <a>
            if (form && form.tagName === 'FORM') {
                form.submit(); // Gửi biểu mẫu
            }
        });
    });
</script>

