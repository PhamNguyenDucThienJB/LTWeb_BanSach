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
    <title>Books | Blog</title>

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
    <link rel="icon" href="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/favicon.png?1730705463447" type="image/x-icon">
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
<!-- Hero Section Begin -->
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Tin tức</h2>
                    <div class="breadcrumb__option">
                        <a href="index.jsp">Trang chủ</a>
                        <span>Tin tức</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="blog__sidebar">
                    <div class="blog__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Tìm kiếm...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Danh mục</h4>
                        <ul>
                            <li><a href="./blog.jsp">Tất cả</a></li>
                            <li><a href="#">Đời sống (3)</a></li>
                            <li><a href="./blog-details-3.html">Kỷ niệm (1)</a></li>

                        </ul>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Tin mới nhất</h4>
                        <div class="blog__sidebar__recent">
                            <a href="blog-details-1.jsp" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="img/blog/sidebar/blog1.png" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <h6>Giải mã sức hút của<br/> bánh kem hiện đại</h6>
                                    <span>22-10-2022</span>
                                </div>
                            </a>
                            <a href="blog-details-2.html" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="img/blog/sidebar/blog2.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <h6>Tổng hợp cách bảo quản <br/>bánh kem cực đơn giản</h6>
                                    <span>22-10-2022</span>
                                </div>
                            </a>
                            <a href="blog-details-3.html" class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img src="img/blog/sidebar/blog3.jpg" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                    <h6>Chọn bánh kem cho những <br/>ngày kỷ niệm ý nghĩa</h6>
                                    <span>22-10-2022</span>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>Chủ đề</h4>
                        <div class="blog__sidebar__item__tags">
                            <a href="./blog.jsp">Bánh kem</a>
                            <a href="blog-details-1.jsp">Hiện đại</a>
                            <a href="./blog-details-2.html">Bảo quản bánh</a>
                            <a href="./blog-details-3.html">Chọn bánh</a>
                            <a href="./blog-details-4.html">Ý nghĩa bánh</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog1.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> 22-10-2022</li>

                                </ul>
                                <h5><a href="blog-details-1.jsp">Giải mã sức hút của bánh kem hiện đại</a></h5>
                                <p class="text-justify">Trong những bữa tiệc quan trọng bánh kem góp phần mang đến cho
                                    không khí thêm phần hoàn hảo. Sự xuất hiện của bánh kem hiện đại như một bước ngoặt
                                    mới... </p>
                                <a href="blog-details-1.jsp" class="blog__btn">Xem thêm <span
                                        class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog2.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> 22-10-2022</li>

                                </ul>
                                <h5><a href="blog-details-2.html">Tổng hợp cách bảo quản bánh kem cực đơn giản</a></h5>
                                <p class="text-justify">Các loại bánh kem khi không dùng hết hoặc chưa dùng đến bạn đều
                                    phải bảo quản đúng cách, để giúp bánh giữ nguyên hương vị. Cùng tìm hiểu cách bảo
                                    quản bánh kem cực đơn giản... </p>
                                <a href="blog-details-2.html" class="blog__btn">Xem thêm <span
                                        class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog3.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> 22-10-2022</li>

                                </ul>
                                <h5><a href="blog-details-3.html">Chọn bánh kem cho những ngày kỷ niệm ý nghĩa</a></h5>
                                <p class="text-justify">Ngày nay, bánh kem không chỉ xuất hiện vào duy nhất sinh nhật mà
                                    bất cứ dịp kỷ niệm nào cũng có thể sử dụng. Cùng tìm hiểu các dịp kỷ niệm ý nghĩa
                                    nên sử dụng bánh kem và cách chọn sao cho phù hợp nhất...</p>
                                <a href="blog-details-3.html" class="blog__btn">Xem thêm <span
                                        class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="img/blog/blog4.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> 22-10-2022</li>

                                </ul>
                                <h5><a href="blog-details-4.html">Tại sao sinh nhật lại quan trọng đến thế?</a></h5>
                                <p class="text-justify">Ai cũng biết rằng sinh nhật là một ngày đặc biệt đối với tất cả
                                    mọi người. Là sự kiện đánh dấu ngày ra đời, đó như là một điều mặc định khi nói về ý
                                    nghĩa của ngày sinh...</p>
                                <a href="blog-details-4.html" class="blog__btn">Xem thêm <span
                                        class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

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
