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
    <title>Books | Trang Chủ</title>

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
<!-- Header Section Begin -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Header Section End -->
<c:if test="${not empty success}">
    <!-- Phần tử chứa thông báo -->
    <div id="notifications"   class="custom-notifications"></div>

    <!-- Thông báo thành công (sẽ được hiển thị trong toast) -->
    <script>
        window.onload = function () {
            // Kiểm tra nếu thông báo đã được hiển thị trong phiên này
            if (!sessionStorage.getItem('successToastShown')) {
                let newToast = document.createElement('div');
                newToast.classList.add('custom-toast', 'custom-success');
                newToast.innerHTML = `
                  <i class="bi bi-check-circle"></i>
                    <div class="custom-content">
                        <div class="custom-title">Thành công</div>
                        <span>${success}</span> <!-- Hiển thị thông báo từ biến success -->
                    </div>
                    <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
                `;

                // Thêm vào phần tử chứa thông báo
                const notifications = document.getElementById('notifications');
                notifications.appendChild(newToast);

                // Đánh dấu là đã hiển thị toast
                sessionStorage.setItem('successToastShown', 'true');

                // Xóa thông báo sau 5 giây
                setTimeout(() => newToast.remove(), 5000);
            }
        };
    </script>
</c:if>

<!-- Hero Section Begin -->
<section class="hero" style="background-color: #FFF8F2;">
    <div class="container">




        <!-- Carousel Start -->
        <div class="container-fluid p-0 mb-5 pb-5">
            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100 rounded" src="img/hero/slider_4.jpg" alt="Image"
                             style="height: 600px; width: auto;">

                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center distance">
                            <div class="p-3" style="max-width: 900px;">
                                <!-- <h4 class="text-white text-uppercase mb-md-3 slogun_slide">Truyền thống & hiện đại</h4>
                                <h1 class="display-3 text-white font-weight-bold mb-md-4 slogun_slide">Tận hưởng thế giới ngọt ngào của bạn.</h1>
                                <a href="./shop-product.html" class="btn btn_pink py-md-3 px-md-5 mt-2">Đặt bánh ngay <i class="fa fa-hand-o-down"></i></a> -->
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100 rounded" src="img/hero/slider_2.jpg" alt="Image"
                             style="height: 600px; width:  1000px;">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center distance">
                            <div class="p-3" style="max-width: 900px;">
                                <!-- <h4 class="text-white text-uppercase mb-md-3 slogun_slide">Truyền thống & hiện đại</h4>
                                <h1 class="display-3 text-white font-weight-bold mb-md-4 slogun_slide">Không chỉ là bánh ngọt, đây là sự yêu thương.</h1>
                                <a href="./shop-product.html" class="btn btn_pink py-md-3 px-md-5 mt-2">Đặt bánh ngay <i class="fa fa-hand-o-down"></i> </a>                        -->
                            </div>
                        </div>

                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-secondary btn_next_slide px-0" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n1"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-secondary btn_next_slide px-0" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n1"></span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- Carousel End -->
    </div>
    </div>

</section>
<!-- Hero Section End -->
<div class="container">
    <div class="row">
        <div class="col-md-6 image">
            <a href="https://alphabooks.vn/gioi-thieu"><img class="lazyload loaded"
                                                            src="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/about_image.jpg?1726331743433"
                                                            data-src="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/about_image.jpg?1726331743433"
                                                            alt="" data-was-processed="true"></a>
        </div>
        <div class="col-md-6">
            <div class="title"><img class="lazyload loaded"
                                    src="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/about_title.png?1726331743433"
                                    data-src="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/about_title.png?1726331743433"
                                    alt="" data-was-processed="true"></div>
            <div class="title-2">Công ty Cổ phần Sách Alpha (Alpha Books)</div>
            <div class="content">Alpha Books được biết đến là một trong những thương hiệu hàng đầu về dòng sách quản trị
                kinh doanh, phát triển kỹ năng, tài chính, đầu tư… với các cuốn sách hướng dẫn khởi nghiệp, các bài học,
                phương pháp và kinh nghiệm quản trị của các chuyên gia, và các tập đoàn nổi tiếng trên thế giới. Sau 18
                năm hình thành và phát triển, Alpha Books đã từng bước khẳng định tên tuổi của mình, đặc biệt đối với
                các thế hệ doanh nhân, nhà quản lý và những người trẻ luôn khát khao xây dựng sự nghiệp thành công.
            </div>
            <a href="https://alphabooks.vn/gioi-thieu" class="more">XEM THÊM</a>
        </div>
    </div>
</div>
<!-- Categories Section Begin -->
<section class="categories" style="background-color: #FFF8F2">
    <div class="section-title">
        <h2>Top Sản Phẩm Bán Chạy</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/product/S001/sach11.jpg">
                        <h5><a href="./shop-details.html">Luân Lý</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/product/S001/sach5.jpg">
                        <h5><a href="#">Học Nhanh</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/product/S001/sach7.jpg">
                        <h5><a href="#">Chứng Nhân Giữa Đời Thường</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/product/S001/sach10.jpg">
                        <h5><a href="./shop-details.html">Ngược Dòng</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="img/product/S001/sach9.jpg">
                        <h5><a href="./shop-details.html">Đức Mẹ Maria</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->
<section class="section_banner_adv">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <a href="https://store.alphabooks.vn/vanderbilt" title="">
                    <img class="img-responsive center-base"
                         src="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/banner_1.jpg?1726331743433"
                         alt="Alpha Books">
                </a>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <a href="" title="">
                    <img class="img-responsive center-base"
                         src="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/banner_2.jpg?1726331743433"
                         alt="Alpha Books">
                </a>
            </div>
        </div>
    </div>
</section>
<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container" style="background-color: #FFF8F2;">
        <div class="row">
            <div class="col-lg-12">
                <div class="featured__controls">
                    <div class="section-title">
                        <h2>Danh Sách Sản Phẩm</h2>
                    </div>
                    <ul>
                        <li class="active" data-filter="*">Tất cả</li>
                        <li data-filter=".traditional">Kinh Thánh</li>
                        <li data-filter=".modern">Khoa học</li>
                        <li data-filter=".lover">Truyện Dài</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter">
            <div class="col-lg-3 col-md-4 col-sm-6 mix traditional lover">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/product/B012/banh1.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="./shop-details.html">Bánh sinh nhật</a></h6>
                        <h5>300,000 VND</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix traditional">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/product/B013/banh1.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="./shop-details.html">Bánh sinh nhật</a></h6>
                        <h5>300,000 VND</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix traditional">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/product/B014/banh2.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="./shop-details.html">Bánh sinh nhật</a></h6>
                        <h5>300,000 VND</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix traditional lover">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/product/B015/banh1.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="./shop-details.html">Bánh sinh nhật</a></h6>
                        <h5>300,000 VND</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix lover modern">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/product/B016/banh1.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="./shop-details.html">Bánh sinh nhật</a></h6>
                        <h5>300,000 VND</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix lover modern">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/product/B017/banh1.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="./shop-details.html">Bánh sinh nhật</a></h6>
                        <h5>300,000 VND</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix modern">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/product/B018/banh1.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="./shop-details.html">Bánh sinh nhật</a></h6>
                        <h5>300,000 VND</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix modern">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="img/product/B019/banh1.jpg">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="./shop-details.html">Bánh sinh nhật</a></h6>
                        <h5>300,000 VND</h5>
                    </div>
                </div>
            </div>
            <a href="./shop-product.html" type="button" class="btn btn_pink py-md-3 px-md-5 mt-2 btn-rm">Xem tất cả</a>
        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad" style="background-color: antiquewhite;">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title from-blog__title">
                    <h2>Tin Tức</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/sach2.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> 22-10-2022</li>

                        </ul>
                        <h5><a href="blog-details-1.html">Giải mã sức hút của bánh kem hiện đại</a></h5>
                        <p class="text-justify">Trong những bữa tiệc quan trọng bánh kem góp phần mang đến cho không
                            khí thêm phần hoàn hảo. Sự xuất hiện của bánh kem hiện đại như một bước ngoặt mới...
                        </p>
                        <a href="contact.html" class="blog__btn" style="">Xem thêm <span class="arrow_right"></span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/sach3.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> 22-10-2022</li>

                        </ul>
                        <h5><a href="blog-details-2.html">Tổng hợp cách bảo quản bánh kem cực đơn giản</a></h5>
                        <p class="text-justify">Các loại bánh kem khi không dùng hết hoặc chưa dùng đến bạn đều phải
                            bảo quản đúng cách, để giúp bánh giữ nguyên hương vị. Cùng tìm hiểu cách bảo quản bánh
                            kem cực đơn giản... </p>
                        <a href="blog-details-2.html" class="blog__btn">Xem thêm <span class="arrow_right"></span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/sach4.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i>22-10-2022</li>

                        </ul>
                        <h5><a href="blog-details-3.html">Chọn bánh kem cho những ngày kỷ niệm ý nghĩa</a></h5>
                        <p class="text-justify">Ngày nay, bánh kem không chỉ xuất hiện vào duy nhất sinh nhật mà bất
                            cứ dịp kỷ niệm nào cũng có thể sử dụng. Cùng tìm hiểu các dịp kỷ niệm ý nghĩa nên sử
                            dụng bánh kem và cách chọn sao cho phù hợp nhất...</p>
                        <a href="blog-details-3.html" class="blog__btn">Xem thêm <span class="arrow_right"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->


</body>
<!-- Footer Section End -->
<jsp:include page="footer.jsp"></jsp:include>
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
