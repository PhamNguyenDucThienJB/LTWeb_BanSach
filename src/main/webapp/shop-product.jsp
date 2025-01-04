<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html >

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
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <!-- ==================== -->

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
<div class="humberger__menu__overlay"></div>
<!-- <div class="humberger__menu__wrapper"> -->
<!-- <div class="humberger__menu__logo">
    <a href="#"><img src="img/logo_web.jpg" alt=""></a>
</div> -->
<!-- <div class="humberger__menu__cart">
    <ul>
        <li><a href="./favorites.html"><i class="fa fa-heart"></i> <span>1</span></a></li>
        <li><a href="./shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
    </ul>
</div> -->
<!-- <div class="humberger__menu__widget">
    <div class="header__top__right__auth">
        <a href="./admin/signin.html"><i class="fa fa-user"></i> Đăng nhập</a>
    </div>
</div> -->
<!-- <nav class="humberger__menu__nav mobile-menu">
    <ul>
        <li class="active"><a href="./index.html">Trang chủ</a></li>
        <li><a href="./about.html">Giới thiệu</a></li>
        <li><a href="./shop-product.jsp">Sản phẩm</a>

        </li>
        <li><a href="./blog.html">Tin tức</a></li>
        <li><a href="./contact.html">Liên hệ</a></li>
    </ul>
</nav> -->
<!--<div id="mobile-menu-wrap"></div>-->
<!-- <div class="header__top__right__social">
    <a href="https://www.facebook.com/mai.thuan.52438/" target="blank"><i class="fa fa-facebook"></i></a>
    <a href="https://www.messenger.com/t/100017755062615" target="blank"><i class="fa fa-comment"></i></a>
    <a href="https://www.instagram.com/maizecorn1542/" target="blank"><i class="fa fa-instagram"></i></a>
</div> -->
<!-- <div class="humberger__menu__contact">
    <ul>
        <li><i class="fa fa-envelope"></i> tiembanhhanhphuc@gmail.com</li>
        <li>Miễn phí giao hàng nội thành TP HCM</li>
    </ul>
</div> -->
<!-- </div> -->
<!-- Humberger End -->


<!-- Header Section Begin -->
<header class="header">
    <!-- rang cua -->



    <!-- rang cua -->
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li style="color: white;"><i style="color: white;"  class="fa fa-envelope"></i >hotline: 0795035755</li>
                            <!-- <li>Miễn phí giao hàng nội thành TP.HCM</li> -->
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="./favorites.html"><i class="fa fa-heart"></i> <span style="color: white;">1</span></a>
                            <a href="./shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span style="color: white;">3</span></a>
                            <!-- <a href="https://www.instagram.com/maizecorn1542/" target="blank"><i class="fa fa-instagram"></i></a> -->
                        </div>
                        <div class="header__top__right__auth">
                            <a href="./admin/signin.html"><i class="fa fa-user"></i>Đăng nhập</a>
                            <div class="header__top__right__auth__dropdown">
                                <a href="#" class="dropdown-item">Vào trang quản lí</a>
                                <a href="./admin/signin.html" class="dropdown-item">Đăng xuất</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="./index.jsp"><img src="./img/logo.png" alt="" class="header__logo_img"></a>
                </div>
            </div>
            <div class="col-lg-7 ">
                <nav class="header__menu">
                    <ul>
                        <li class="active"><a href="./index.jsp">Trang chủ</a></li>
                        <li><a href="./about.jsp">Giới thiệu</a></li>
                        <li class="active"><a href="./shop-product.jsp">Sản phẩm</a>

                        </li>
                        <li><a href="./blog.jsp">Tin tức</a></li>
                        <li><a href="./contact.jsp">Liên hệ</a></li>
                    </ul>
                </nav>
            </div>

            <!-- <div class="col-lg-2">
                <div class="header__cart">
                    <ul>
                        <li><a href="./favorites.html"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="./shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                    </ul>
                </div>
            </div> -->


        </div>
        <!-- <div style="color:#f47920 ;" class="rang_cua"></div> -->
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form ">
                        <form action="#" >

                            <input type="text" placeholder="Tìm kiếm sản phẩm?">
                            <button type="submit" class="site-btn"><i class="fa fa-search"></i> <span class="text_search">TÌM KIẾM</span></button>
                        </form>
                    </div>

                    <!-- <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <a href="tel:0987654321" class="fa fa-phone cursor"></a>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+84 987654321</h5>
                            <span>Mở cửa từ 8h - 22h</span>
                        </div>
                    </div> -->
                </div>
            </div>
        </div>

    </div>

</header>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<!-- <section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form ">
                        <form action="#" >

                            <input type="text" placeholder="Bạn cần bánh gì nè?">
                            <button type="submit" class="site-btn"><i class="fa fa-search"></i> <span class="text_search">TÌM KIẾM</span></button>
                        </form>
                    </div>

                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <a href="tel:0987654321" class="fa fa-phone cursor"></a>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+84 987654321</h5>
                            <span>Mở cửa từ 8h - 22h</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</section> -->
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Sản phẩm</h2>
                    <div class="breadcrumb__option">
                        <a href="./index.jsp">Trang Chủ</a>
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
                            <li class="text__loaisach"><a class="text__loaisach__active" href="./shop-product.jsp">Tất cả</a></li>
                            <li class="text__loaisach"><a href="./shop-product-banh-hoa.html">Quản trị doanh nghiệp</a></li>
                            <li class="text__loaisach"><a href="./shop-product-trang-tri-don-gian.html">Tài chính - Đầu tư - Chứng khoán</a></li>
                            <li class="text__loaisach"><a href="#">Công nghệ & Chuyển đổi số</a></li>
                            <li class="text__loaisach"><a href="#">Marketing & Bán hàng</a></li>
                            <li class="text__loaisach"><a href="#">Kỹ năng</a></li>

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
                        <div class="latest-product__text">
                            <h4>Sách Bán Chạy</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="./img/product/B019/tamly.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Mindset - Tâm Lý Học Thành Công</h6>
                                            <span>159,000 VND</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="./img/product/B022/tuduy.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Tư Duy Nhanh Và Chậm - Top Best Seller</h6>
                                            <span>215,000 VND</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="./img/product/B023/damphan.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Bạn Có Thể Đàm Phán Bất Cứ Điều Gì (Tái Bản)</h6>
                                            <span>127,000 VND</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="./img/product/B024/nhanto.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Nhân Tố Quyết Định Nên Người Thành Đạt</h6>
                                            <span>199,000 VND</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="./img/product/B025/thaydoituduy.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Thay Đổi Tư Duy (Bộ sách Maxwell Moments)</h6>
                                            <span>79,000 VND</span>
                                        </div>
                                    </a>
                                    <a href="#" class="latest-product__item">
                                        <div class="latest-product__item__pic">
                                            <img src="./img/product/B026/chungkhoan.jpg" alt="">
                                        </div>
                                        <div class="latest-product__item__text">
                                            <h6>Vui Cười Lên Cùng Chứng Khoán</h6>
                                            <span>119,000 VND</span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>Khuyến Mãi</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="./img/product/B067/suthattien.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Quản trị doanh nghiệp</span>
                                        <h5><a href="./shop-details.html">Sự thật trần trụi về tiền</a></h5>
                                        <div class="product__item__price">216,000 VND <span>269,000 VND</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="./img/product/B067/suthatthongke.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Quản trị doanh nghiệp</span>
                                        <h5><a href="./shop-details.html">Sự thật trần trụi về thống kê</a></h5>
                                        <div class="product__item__price">184,000 VND <span>229,000 VND</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="./img/product/B026/quantum.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Marketing & Bán hàng</span>
                                        <h5><a href="./shop-details.html">Quantum Marketing - Bộ công cụ tiếp thị trong thế giới siêu kết nối</a></h5>
                                        <div class="product__item__price">288,000 VND <span>360,000 VND</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="./img/product/B012/bigdata.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Công nghệ & Chuyển đổi số</span>
                                        <h5><a href="./shop-details.html">Big Data - Dữ Liệu Lớn</a></h5>
                                        <div class="product__item__price">288,000 VND <span>360,000 VND</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="././img/product/B021/nguyenly.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Marketing & Bán hàng</span>
                                        <h5><a href="./shop-details.html">Nguyên Lý Marketing - Principle Of Marketing</a></h5>
                                        <div class="product__item__price">799,000 VND <span>999,000 VND</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="product__discount__item">
                                    <div class="product__discount__item__pic set-bg"
                                         data-setbg="././img/product/B022/khoanhkhac.jpg">
                                        <div class="product__discount__percent">-20%</div>
                                        <ul class="product__item__pic__hover">
                                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>Kỹ năng</span>
                                        <h5><a href="./shop-details.html">Bộ sách Maxwell Moments - Khoảnh Khắc Thay Đổi Cuộc Đời (4 cuốn)</a></h5>
                                        <div class="product__item__price">317,000 VND <span>396,000 VND</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                                <h6><span>12</span> Sản phẩm</h6>
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
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B023/build.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Build - Những điều đáng làm tạo ra sản phẩm đáng giá</a></h6>
                                <h5>199,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B024/vanhoaso.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Văn Hoá Số - Gỡ bỏ rào cản trong chuyển đổi số - TG Lê Quang Vũ</a></h6>
                                <h5>152,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B026/camnang.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Cẩm nang đề cử thành viên Hội đồng Quản trị</a></h6>
                                <h5>329,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B067/suthatthongke.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Sự Thật Trần Trụi Về Thống Kê</a></h6>
                                <h5>300,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B067/suthattien.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Sự Thật Trần Trụi Về Tiền</a></h6>
                                <h5>300,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B029/nghethuat.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Nghệ Thuật "Chọn Bạn Mà Chơi"</a></h6>
                                <h5>135,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B028/bosach.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Bộ sách Maxwell Moments - Khoảnh Khắc Thay Đổi Cuộc Đời (4 cuốn)</a></h6>
                                <h5>316,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B025/thaydoituduy.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Thay Đổi Tư Duy (Bộ sách Maxwell Moments)</a></h6>
                                <h5>79,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B021/nguyenly.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Nguyên Lý Marketing - Principle Of Marketing</a></h6>
                                <h5>799,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B024/nhanto.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Nhân Tố Quyết Định Nên Người Thành Đạt</a></h6>
                                <h5>199,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B026/chungkhoan.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Vui Cười Lên Cùng Chứng Khoán</a></h6>
                                <h5>119,000 VND</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                            <div class="product__item__pic set-bg" data-setbg="./img/product/B022/tuduy.jpg">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                    <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                    <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                </ul>
                            </div>
                            <div class="product__item__text">
                                <h6><a href="./shop-details.html">Tư Duy Nhanh Và Chậm - Top Best Seller</a></h6>
                                <h5>215,000 VND</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="product__pagination">
                    <a class="product__pagination__page2" href="#">1</a>
                    <a href="./shop-product-1.html">2</a>
                    <a href="#">3</a>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="./index.jsp"><img src="img/footer.jpg" alt=""></a>
                    </div>
                    <ul class="mt-5" id="about">
                        <li><font size = "4"><i  class="fa fa-home"></i></font> Địa chỉ: Khu phố 6, P. Linh Trung, TP. Thủ Đức, TP. HCM</li>
                        <li><i class="fa fa-phone"></i> SĐT: +84 987654321</li>
                        <li><i class="fa fa-send-o"></i> Mail: cuahangsach@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Giờ mở cửa</h6>
                    <ul>
                        <li><a href="#">T2 - T6</a></li>
                        <li><a href="#">T7 & CN</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">08:00 sáng - 22:00 tối</a></li>
                        <li><a href="#">13:00 chiều - 18:00 tối</a></li>
                    </ul><br><br>
                    <p class="cake-footer"><h5 class="freecake text-animation">Thuê sách miễn phí</h5><a class ="fontsize-14">Thứ sáu hàng tuần tại cửa hàng vào lúc 14h00-14h30</a></p>
                    <img src = "img/footer/logo.jpg">
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Theo dõi bảng tin của chúng tôi</h6>
                    <p>Nhận thông tin cập nhật e-mail về sản phẩm mới nhất và các ưu đãi đặc biệt của chúng tôi.</p>
                    <form action="#">
                        <input type="text" placeholder="Địa chỉ email của bạn...">
                        <button type="submit" class="site-btn">Đăng ký</button>
                    </form>
                    <div class="footer__widget__social">
                        <a href="https://www.facebook.com"><i class="fa fa-facebook"></i></a>
                        <a href="https://www.messenger.com"><i class="fa fa-comment"></i></a>
                        <a href="https://www.instagram.com"><i class="fa fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Bản quyền &copy;<script>document.write(new Date().getFullYear());</script> thuộc Nhóm| Lập trình Web thầy Lê Phi Hùng <i class="fa fa-heart" aria-hidden="true"> </i> Khoa CNTT - ĐH Nông Lâm TP HCM</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    <div class="footer__copyright__payment"></div>
                </div>
            </div>
        </div>
    </div>
</footer>
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