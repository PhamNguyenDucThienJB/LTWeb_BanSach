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
    <title>Books | Book Detail</title>

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
          rel="stylesheet">
    <!-- ==================== -->
    <!-- ==================== -->
    <link rel="icon" href="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/favicon.png?1730705463447"
          type="image/x-icon">
    <!-- Css Styles -->
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

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>${detailProduct.name}</h2>
                    <div class="breadcrumb__option">
                        <a href="/IndexServlet">Trang chủ</a>
                        <a href="/ListProduct">Sản phẩm</a>
                        <span>${detailProduct.name}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="${detailProduct.listImg[0]}" alt="">
                    </div>
                    <!-- Slider hiển thị các ảnh còn lại -->
                    <div class="product__details__pic__slider owl-carousel">
                        <c:forEach var="img" items="${detailProduct.listImg}">
                            <img data-imgbigurl="${img}" src="${img}" alt="Product Thumbnail">
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${detailProduct.name}</h3>

                    <div class="product__details__price">${detailProduct.price} VND</div>
                    <p>${detailProduct.description}</p>
                    <form action="/AddCart" class="test" method="post" style="display:none;">
                        <input type="hidden" name="productId" value="${detailProduct.id}">
                        <input type="hidden" name="quantity" value="1" id="quantityInput">
                    </form>

                    <button type="button" class="primary-btn" id="addToCartBtn">Thêm vào giỏ hàng</button>


                    <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
                    <ul>
                        <li><b>Tác Giả: </b> <span>${detailProduct.author}</span></li>
                        <li><b>Tình trạng</b> <span>Còn hàng</span></li>
                        <li><b>Giao hàng</b> <span>Giao ngay trong ngày</span></li>


                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">Mô tả</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">Thông tin</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                               aria-selected="false">Bình luận<span>(1)</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Mô tả sản phẩm</h6>
                                <p>${detailProduct.description}</p>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>Đặc điểm:</h6>
                                <%--                                <p>- Loại Sách: Bánh hoa</p>--%>
                                <%--                                <p>- Kích thước: Vừa</p>--%>
                                <%--                                <p>- Khối lượng: 500g</p>--%>
                            </div>
                        </div>
                        <%--                        <div class="tab-pane" id="tabs-3" role="tabpanel">--%>
                        <%--                            <div class="product__details__tab__desc">--%>
                        <%--                                <h6 style="margin-bottom: 10px;">Trần Nhật Linh</h6>--%>
                        <%--                                <i class="fa fa-calendar-o"></i> <span--%>
                        <%--                                    style="font-size: 13px; color: rgb(179, 178, 178);">22-10-2022</span>--%>

                        <%--                                <p>Lần đầu đặt bánh ở tiệm này thấy rất hài lòng, cầm chiếc bánh trên tay đi tặng được--%>
                        <%--                                    mọi người khen--%>
                        <%--                                    . Rất hài lòng, trang trí sang trọng, đẹp mắt.</p>--%>
                        <%--                                <div class="input-comment">--%>
                        <%--                                    <div class="input-item">--%>
                        <%--                                        <span>Tên của bạn:</span>--%>
                        <%--                                        <input type="text" placeholder="Nhập họ tên...">--%>
                        <%--                                    </div>--%>
                        <%--                                    <div class="input-item">--%>
                        <%--                                        <span>Số điện thoại:</span>--%>
                        <%--                                        <input type="text" placeholder="Nhập số điện thoại...">--%>

                        <%--                                    </div>--%>

                        <%--                                    <div class="input-item">--%>
                        <%--                                        <span>Nhập bình luận:</span>--%>
                        <%--                                        <input type="text" placeholder="Viết bình luận..." style="width:70%;">--%>
                        <%--                                        <span class="add-comment">--%>
                        <%--                                                    <button type="submit" class="btn-add-comment">Gửi</button>--%>
                        <%--                                                </span>--%>
                        <%--                                    </div>--%>

                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<%--<section class="related-product">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-12">--%>
<%--                <div class="section-title related__product__title">--%>
<%--                    <h2>Sản phẩm liên quan</h2>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row">--%>
<%--            <div class="col-lg-3 col-md-4 col-sm-6">--%>
<%--                <div class="product__item">--%>
<%--                    <div class="product__item__pic set-bg" data-setbg="img/product/B002/banh1.jpg">--%>
<%--                        <ul class="product__item__pic__hover">--%>
<%--                            <li><a href="#"><i class="fa fa-heart"></i></a></li>--%>
<%--                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>--%>
<%--                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                    <div class="product__item__text">--%>
<%--                        <h6><a href="#">Bánh hoa hồng kem dâu tây</a></h6>--%>
<%--                        <h5>450,000 VND</h5>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-4 col-sm-6">--%>
<%--                <div class="product__item">--%>
<%--                    <div class="product__item__pic set-bg" data-setbg="img/product/B003/banh1.jpg">--%>
<%--                        <ul class="product__item__pic__hover">--%>
<%--                            <li><a href="#"><i class="fa fa-heart"></i></a></li>--%>
<%--                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>--%>
<%--                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                    <div class="product__item__text">--%>
<%--                        <h6><a href="#">Bánh hoa hồng nhật</a></h6>--%>
<%--                        <h5>420,000 VND</h5>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-4 col-sm-6">--%>
<%--                <div class="product__item">--%>
<%--                    <div class="product__item__pic set-bg" data-setbg="img/product/B004/banh1.jpg">--%>
<%--                        <ul class="product__item__pic__hover">--%>
<%--                            <li><a href="#"><i class="fa fa-heart"></i></a></li>--%>
<%--                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>--%>
<%--                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                    <div class="product__item__text">--%>
<%--                        <h6><a href="#">Bánh hoa linh lang</a></h6>--%>
<%--                        <h5>250,000 VND</h5>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-lg-3 col-md-4 col-sm-6">--%>
<%--                <div class="product__item">--%>
<%--                    <div class="product__item__pic set-bg" data-setbg="img/product/B005/banh1.jpg">--%>
<%--                        <ul class="product__item__pic__hover">--%>
<%--                            <li><a href="#"><i class="fa fa-heart"></i></a></li>--%>
<%--                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>--%>
<%--                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                    <div class="product__item__text">--%>
<%--                        <h6><a href="#">Bánh hoa kiểu Anh sang trọng</a></h6>--%>
<%--                        <h5>330,000 VND</h5>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Related Product Section End -->

<!-- Footer Section End -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- back to top btn -->
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
<script>
    // Lắng nghe sự kiện khi người dùng thay đổi giá trị số lượng
    document.getElementById("quantityInput").addEventListener("input", function () {
        var quantity = document.getElementById("quantityInput").value;
        // Kiểm tra giá trị số lượng hợp lệ, ví dụ chỉ chấp nhận giá trị dương
        if (quantity <= 0) {
            alert("Số lượng phải lớn hơn 0");
            document.getElementById("quantityInput").value = 1; // Đặt lại số lượng mặc định nếu không hợp lệ
        }
    });

    // Lắng nghe sự kiện khi người dùng nhấn nút "Thêm vào giỏ hàng"
    document.getElementById("addToCartBtn").addEventListener("click", function (event) {
        var quantity = document.getElementById("quantityInput").value;
        var productID = "${detailProduct.id}"; // Giá trị ID sản phẩm từ server (JSP)

        // Cập nhật URL với tham số quantity
        var updatedUrl = "/AddCart?productID=" + productID + "&quantity=" + quantity;
        window.location.href = updatedUrl; // Chuyển hướng đến URL mới
        event.preventDefault(); // Ngừng hành động mặc định của liên kết
    });
    document.getElementById("addToCartBtn").addEventListener("click", function () {
        // Lấy giá trị số lượng từ ô nhập
        var quantity = document.getElementById("quantityInput").value;

        // Kiểm tra số lượng hợp lệ (ví dụ chỉ chấp nhận số dương)
        if (quantity <= 0) {
            alert("Số lượng phải lớn hơn 0");
            document.getElementById("quantityInput").value = 1; // Đặt lại số lượng mặc định nếu không hợp lệ
        } else {
            // Cập nhật giá trị số lượng trong form
            document.querySelector("input[name='quantity']").value = quantity;

            // Gửi form
            document.querySelector(".test").submit();
        }
    });

</script>