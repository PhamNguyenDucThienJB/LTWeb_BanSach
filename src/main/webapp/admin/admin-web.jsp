<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Admin | Shop Bánh Sách</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<div class="container-fluid position-relative d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner"
         class="show bg-pink position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-pink navbar-dark">
            <!--  -->
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <i class="fa fa-user icon__user"></i>
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">Thanh Thùy</h6>
                    <span>Admin</span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="admin-web.jsp" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Tổng
                    quan</a>
                <a href="./list-products.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>DS Sản Phẩm</a>
                <a href="./customers.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>DS Khách Hàng</a>
                <a href="./list-blogs.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>DS Blog</a>
                <a href="./add-product.html" class="nav-item nav-link"><i class="fa fa-birthday-cake me-2"></i>Thêm Sản
                    Phẩm</a>
                <a href="./add-blog.html" class="nav-item nav-link"><i class="fa fa-blog me-2"></i>Thêm blog</a>
                <a href="../index.jsp" class="nav-item nav-link"><i class="fa fa-arrow-alt-circle-right me-2"></i>Về
                    trang chủ</a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand bg-pink navbar-dark sticky-top px-4 py-0">
            <a href="admin-web.jsp" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <form class="d-none d-md-flex ms-4">
                <input class="form-control bg-pink " type="search" placeholder="Tìm Kiếm">
            </form>
            <div class="navbar-nav align-items-center ms-auto">

                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-bell me-lg-2"></i>
                        <span class="d-none d-lg-inline-flex">Thông báo</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-pink border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">Cập nhật thông tin</h6>
                            <small>15 phút trước</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">Thêm người dùng mới</h6>
                            <small>15 phút trước</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item">
                            <h6 class="fw-normal mb-0">Đổi mật khẩu</h6>
                            <small>15 phút trước</small>
                        </a>
                        <hr class="dropdown-divider">
                        <a href="#" class="dropdown-item text-center">Xem tất cả</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="fa fa-user icon__user__small"></i>
                        <span class="d-none d-lg-inline-flex">Thanh Thùy</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-pink border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">Thông tin của tôi</a>
                        <a href="#" class="dropdown-item">Cài đặt</a>
                        <a href="../index.jsp" class="dropdown-item">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->


        <!-- Sale & Revenue Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4">

                <div class="col-sm-6 col-xl-3">
                    <div class="bg-pink rounded d-flex align-items-center justify-content-between p-4">
                        <i class="fa fa-chart-bar fa-3x text-primary"></i>
                        <div class="ms-3">
                            <p class="mb-2">Đơn hàng hôm nay</p>
                            <h6 class="mb-0">123 </h6>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-xl-3">
                    <div class="bg-pink rounded d-flex align-items-center justify-content-between p-4">
                        <i class="fa fa-chart-area fa-3x text-primary"></i>
                        <div class="ms-3">
                            <p class="mb-2">Sản phẩm bán được</p>
                            <h6 class="mb-0">100 </h6>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="bg-pink rounded d-flex align-items-center justify-content-between p-4">
                        <i class="fa fa-chart-line fa-3x text-primary"></i>
                        <div class="ms-3">
                            <p class="mb-2">Doanh thu hôm nay</p>
                            <h6 class="mb-0">1.234.000 </h6>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="bg-pink rounded d-flex align-items-center justify-content-between p-4">
                        <i class="fa fa-chart-pie fa-3x text-primary"></i>
                        <div class="ms-3">
                            <p class="mb-2">Doanh thu tháng này</p>
                            <h6 class="mb-0">4.234.000 </h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sale & Revenue End -->

        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-pink text-center rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">Bán gần đây</h6>
                    <a href="">Xem tất cả</a>
                </div>
                <div class="table-responsive">
                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                        <thead>
                        <tr class="text-black">
                            <th scope="col">STT</th>
                            <th scope="col">Ngày</th>
                            <th scope="col">Khách hàng</th>
                            <th scope="col">Địa chỉ</th>
                            <th scope="col">Thành tiền</th>

                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1</td>
                            <td>22/10/22</td>
                            <td>Thanh Thùy</td>
                            <td>TP.HCM</td>
                            <td>500,000</td>

                        </tr>
                        <tr>
                            <td>2</td>
                            <td>22/10/22</td>
                            <td>Thanh Thùy</td>
                            <td>TP.HCM</td>
                            <td>500,000</td>

                        </tr>
                        <tr>
                            <td>3</td>
                            <td>22/10/22</td>
                            <td>Thanh Thùy</td>
                            <td>TP.HCM</td>
                            <td>500,000</td>

                        </tr>
                        <tr>
                            <td>4</td>
                            <td>22/10/22</td>
                            <td>Thanh Thùy</td>
                            <td>TP.HCM</td>
                            <td>500,000</td>

                        </tr>
                        <tr>
                            <td>5</td>
                            <td>22/10/22</td>
                            <td>Thanh Thùy</td>
                            <td>TP.HCM</td>
                            <td>500,000</td>

                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Recent Sales End -->

        <!-- Sales Chart Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="row g-4">
                <div class="col-sm-12 col-xl-12">
                    <div class="bg-pink text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Doanh thu theo tháng</h6>
                        </div>
                        <canvas id="worldwide-sales"></canvas>
                    </div>
                </div>

            </div>
        </div>
        <!-- Sales Chart End -->


        <!-- Widgets Start -->

        <!-- Widgets End -->


        <!-- Footer Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-pink rounded-top p-4">
                <div class="row">
                    <div class="col-12 col-sm-6 text-center text-sm-start">
                        &copy; <a href="#">Lập trình web thầy Phan Đình Long Khoa CNTT - ĐH Nông Lâm TP HCM</a>
                    </div>
                    <div class="col-12 col-sm-6 text-center text-sm-end">
                        <a href="https://htmlcodex.com">Nhóm 27</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
    </div>
    <!-- Content End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/chart/chart.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="./js/main.js"></script>
</body>

</html>