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
<!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="./img/banner/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>${blog.title}</h2>
                        <div class="breadcrumb__option">
                            <a href="index.jsp">Trang chủ</a>
                            <a href="blog.jsp">Tin tức</a>
                            <span>${blog.title}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2">
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
                                <li><a href="blog.jsp">Tất cả</a></li>
                                <li><a href="blog.jsp">Đời sống(3)</a></li>
                                <li><a href="./blog-details-3.html">Kỉ niệm(1)</a></li>
                            </ul>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Tin mới nhất</h4>
                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/blog1.png" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Giải mã sức hút<br />của bánh kem hiện đại</h6>
                                        <span>22-10-2022</span>
                                    </div>
                                </a>
                                <a href="blog-details-2.html" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/blog2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Tổng hợp cách bảo quản <br />bánh kem cực đơn giản</h6>
                                        <span>22-10-2022</span>
                                    </div>
                                </a>
                                <a href="blog-details-3.html" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="img/blog/sidebar/blog3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h6>Chọn bánh kem cho những <br />ngày kỷ niệm ý nghĩa</h6>
                                        <span>22-10-2022</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Chủ đề</h4>
                            <div class="blog__sidebar__item__tags">
                                <a href="blog.jsp">Bánh kem</a>
                                <a href="./blog-details.jsp">Hiện đại</a>
                                <a href="./blog-details-2.html">Bảo quản bánh</a>
                                <a href="./blog-details-3.html">Chọn bánh</a>
                                <a href="./blog-details-4.html">Ý nghĩa bánh</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 order-md-1 order-1">
                    <div class="blog__details__text">
                        <h3 class="text-center cochu-blog" style="text-transform: uppercase;">${blog.title}</h3>
                        <img src="${blog.img}" alt="" class = "image-blog">
                        <h4>${blog}</h4>
                        <p class="text-justify">Sở dĩ bánh kem được làm theo phong cách hiện đại được mọi người ưa chuộng vì nhiều lý do. Nhưng phải nhắc đến đó là hương vị bánh thơm ngon, kiểu dáng độc đáo, kích thước và màu sắc đa dạng. Bên cạnh đó phải kể đến những điểm đặc biệt sau đây.</p>
                        <h4>1. Tất cả nguyên liệu đều là tự nhiên.</h4>
                        <p class="text-justify">Kế thừa tinh hoa ẩm thực cũ được sáng tạo, thay đổi phù hợp với xu thế mới của thời đại, chiếc bánh kem còn là món ăn tốt cho sức khỏe. Dưới bàn tay khéo léo của những người thợ làm bánh cho ra đời sản phẩm đẹp và độc đáo. Bánh kem hiện đại sử dụng nguyên liệu tự nhiên không chứa chất độc hại. Màu sắc nhẹ nhàng không sử dụng hóa chất.<br>
                            Sử dụng một số loại quả có màu đậm sẽ tạo nên những màu sắc đẹp mắt. Chẳng hạn để tạo nên màu đỏ có thể dùng quả thanh long hoặc dâu tây. Tùy thuộc vào yêu cầu của bánh kem hãy chọn loại quả phù hợp. Và bạn yên tâm rằng chúng an toàn vì không chứa hóa chất. Đặc biệt hoa quả còn là thực phẩm cần thiết để tăng cường sức khỏe.</p>
                      <span id="bld1"> <h4>2. Tạo hình và trang trí bánh kem sáng tạo, độc đáo.</h4>
                        <p  class="text-justify">Khi nhìn ngắm bánh kem hiện đại chắc chắn bạn sẽ phải ngạc nhiên và ngưỡng mộ tài năng của những người thợ làm bánh. Mỗi mẫu bánh khác nhau về hình dáng, màu sắc và được tạo hình mới mẻ. Bạn có thể thấy sự sáng tạo không có giới hạn khi được chiêm ngưỡng những chiếc bánh kem đó.<br>
                            Đã bao giờ bạn thấy những chiếc bánh được trang trí với rất nhiều bông hoa, bánh in hình ảnh. Hay những chiếc bánh được tạo hình các con vật ngộ nghĩnh, nhân vật hoạt hình vui nhộn. Nếu lần đầu nhìn thấy những mẫu bánh kem như vậy bạn sẽ không nỡ ăn chúng. Bởi vì tạo hình của chúng không thể tự nhiên hơn.</p>
                      <h4>3. Hương vị đặc biệt thơm ngon</h4>
                          <p class="text-justify">Một lý do khiến bánh hiện đại được các tín đồ hảo ngọt yêu thích đó chính là hương vị. Nhiều người nghĩ rằng bánh kem ăn rất nhanh chán vị quá ngọt, quá béo. Thế nhưng bánh kem hiện đại đã hạn chế được những nhược điểm đó. Hương vị thơm ngon được tạo nên từ nguyên liệu tươi ngon, an toàn. Chỉ một lần thưởng thức chúng bạn sẽ nhớ mãi vị bánh.<br>

Với những người thích socola bạn có thể chọn bánh kem hương vị socola, hay vị bắp tốt cho sức khỏe. Các loại trái cây thanh mát kết hợp mang đến những chiếc bánh vẻ ngoài bắt mắt, hương vị độc lạ bên trong.<br>

Hãy đặt mua bánh kem hiện đại để những bữa tiệc trở nên ý nghĩa hơn. Đến với Tiệm bánh Hạnh Phúc quý khách sẽ được chọn lựa một trong số rất nhiều kiểu bánh đẹp. Được sản xuất từ nguyên liệu tươi ngon, không chứa chất bảo quản sẽ khiến bạn hài lòng. Nhấc máy gọi ngay cho chúng tôi theo số Hotline 0987654321 để được phục vụ.</p>
                      </span>
                      <span id="readmore" type="button" class="blog__btn" onclick="myFunction()">Xem thêm</span>
                    <div class="blog__details__content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="blog__details__author">
                                    <div class="blog__details__author__pic">
                                        <img src="img/blog/details/github.png" alt="">
                                    </div>
                                    <div class="blog__details__author__text">
                                        <h6>J.B Phạm Nguyễn Đức Thiện</h6>
                                        <span>Linh Mục</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="blog__details__widget">
                                    <ul>
                                        <li><span>Danh mục:</span> Đời sống</li>
                                        <li><span>Chủ đề:</span> Hiện đại, Bánh kem</li>
                                    </ul>
                                    <div class="blog__details__social">
                                        <a href="https://www.facebook.com/mai.thuan.52438/"><i class="fa fa-facebook"></i></a>
                                        <a href="https://www.messenger.com/t/100017755062615"><i class="fa fa-comment"></i></a>
                                        <a href="https://www.instagram.com/maizecorn1542/"><i class="fa fa-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- Blog Details Section End -->

    <!-- Related Blog Section Begin -->
                <section class="from-blog spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="section-title from-blog__title">
                                    <h2>Bảng tin</h2>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="blog__item">
                                    <div class="blog__item__pic">
                                        <img src="img/blog/blog1.jpg" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i> 4/5/2022</li>
                                            <li><i class="fa fa-comment-o"></i> 5</li>
                                        </ul>
                                        <h5><a href="blog-details.jsp">Giải mã sức hút của bánh kem hiện đại</a></h5>
                                        <p class="text-justify">Trong những bữa tiệc quan trọng bánh kem góp phần mang đến cho không khí thêm phần hoàn hảo. Sự xuất hiện của bánh kem hiện đại như một bước ngoặt mới...  </p>
                                        <a href="blog-details.jsp" class="blog__btn">Xem thêm <span class="arrow_right"></span> </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="blog__item">
                                    <div class="blog__item__pic">
                                        <img src="img/blog/blog2.jpg" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i> 31/7/2022</li>
                                            <li><i class="fa fa-comment-o"></i> 6</li>
                                        </ul>
                                        <h5><a href="blog-details-2.html">Tổng hợp cách bảo quản bánh kem cực đơn giản</a></h5>
                                        <p class="text-justify">Các loại bánh kem khi không dùng hết hoặc chưa dùng đến bạn đều phải bảo quản đúng cách, để giúp bánh giữ nguyên hương vị. Cùng tìm hiểu cách bảo quản bánh kem cực đơn giản... </p>
                                        <a href="blog-details-2.html" class="blog__btn">Xem thêm <span class="arrow_right"></span> </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <div class="blog__item">
                                    <div class="blog__item__pic">
                                        <img src="img/blog/blog3.jpg" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i>12/10/2022</li>
                                            <li><i class="fa fa-comment-o"></i> 4</li>
                                        </ul>
                                        <h5><a href="blog-details-3.html">Chọn bánh kem cho những ngày kỷ niệm ý nghĩa</a></h5>
                                        <p class="text-justify">Ngày nay, bánh kem không chỉ xuất hiện vào duy nhất sinh nhật mà bất cứ dịp kỷ niệm nào cũng có thể sử dụng. Cùng tìm hiểu các dịp kỷ niệm ý nghĩa nên sử dụng bánh kem và cách chọn sao cho phù hợp nhất...</p>
                                        <a href="blog-details-3.html" class="blog__btn">Xem thêm <span class="arrow_right"></span> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
    <!-- Related Blog Section End -->

    <!-- Footer Section Begin -->
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



</body>

</html>
