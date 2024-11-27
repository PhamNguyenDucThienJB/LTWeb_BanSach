<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="xzz">
<meta http-equiv="Content-Type" charset="UTF-8">

<head>
    <meta charset="utf-8">
    <title>Đăng Nhập | Sách</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
            rel="stylesheet">
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
    <!-- Favicon -->
    <link href="./img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap"
          rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="admin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="admin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="admin/css/bootstrap.min.css" rel="stylesheet">
    <!-- Customized Bootstrap Stylesheet -->
    <link href="admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="admin/css/style.css" rel="stylesheet">
    <!-- Template Stylesheet -->
    <link href="admin/css/style.css" rel="stylesheet">
</head>
<style>

</style>
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->


<jsp:include page="header.jsp"></jsp:include>


<!-- Header Section Begin -->

<!-- Header Section End -->
<div class="container-fluid position-relative d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner"
         class="show bg-pink position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Đang tải...</span>
        </div>
    </div>
    <!-- Spinner End -->
    <!--
                <section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg" style="background-image: url(&quot;./img/banner/breadcrumb.jpg&quot;);">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <div class="breadcrumb__text">
                                <h2>Trang Đăng Nhập</h2>
                                <div class="breadcrumb__option">
                                    <a href="./index.jsp"> <span>Trang Chủ</span></a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section> -->

    <!-- Sign In Start -->
    <div class="container-fluid bg_signin_signup">

        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4" style="    display: contents;">
                <form action="/SignInServlet" style="border: solid;
    color: orange;" method="post" class="bg-pink rounded p-4 p-sm-5 my-4 mx-3">

                    <div>
                        <h2 class="title-sg">Đăng nhập</h2>
                    </div>
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger text-center" role="alert">
                                ${error}
                        </div>
                    </c:if>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" name="email" id="floatingInput" value=""
                               placeholder="name@example.com">
                        <label for="floatingInput">Địa chỉ email</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control pass" name="pass" id="floatingPassword"
                               placeholder="Password">
                        <label for="floatingPassword">Mật khẩu</label>
                    </div>
                    <span id="insertTextHere"></span>
                    <div class="d-flex align-items-center justify-content-between mb-4 mt-4"
                         style="flex-direction: row;">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input toggle" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Hiển Thị Mật Khẩu</label>
                        </div>


                        <script>
                            const toggle = document.querySelector(".toggle"),
                                pass = document.querySelector(".pass");

                            toggle.addEventListener("click", () => {
                                if (pass.type === "password") {
                                    pass.type = "text";
                                } else {
                                    pass.type = "password";
                                }
                            })
                        </script>

                        <a style="cursor: pointer;" onclick="forgotPassword()">Quên mật khẩu?</a>
                    </div>
                    <button type="button" id="login-button" class="btn btn-primary py-3 w-100 mb-4">Đăng nhập</button>

                    <script>
                        document.getElementById('login-button').addEventListener('click', function () {
                            const email = document.getElementById('floatingInput').value.trim();
                            const password = document.getElementById('floatingPassword').value.trim();

                            if (!email || !password) {
                                alert('Vui lòng nhập đầy đủ email và mật khẩu!');
                                return;
                            }

                            if (!email.includes('@')) {
                                alert('Email không hợp lệ!');
                                return;
                            }

                            if (password.length < 6) {
                                alert('Mật khẩu phải có ít nhất 6 ký tự!');
                                return;
                            }

                            // Nếu tất cả đều hợp lệ, gửi form
                            document.querySelector('form').submit();
                        });
                    </script>


                    <p class="text-center mb-0">Bạn chưa có tài khoản? <a href="signup.jsp">Đăng ký ngay</a></p>
                    <div class="block social-login--facebooks">
                        <p class="title-sg" style="    margin-left: 80px;
                            margin-right: 80px;
                        ">
                            <span style="font-size: medium;">Hoặc đăng nhập bằng</span>
                        </p>
                        <script>function loginFacebook() {
                            var a = {
                                client_id: "947410958642584",
                                redirect_uri: "https://store.mysapo.net/account/facebook_account_callback",
                                state: JSON.stringify({redirect_url: window.location.href}),
                                scope: "email",
                                response_type: "code"
                            }, b = "https://www.facebook.com/v3.2/dialog/oauth" + encodeURIParams(a, !0);
                            window.location.href = b
                        }

                        function loginGoogle() {
                            var a = {
                                client_id: "997675985899-pu3vhvc2rngfcuqgh5ddgt7mpibgrasr.apps.googleusercontent.com",
                                redirect_uri: "https://store.mysapo.net/account/google_account_callback",
                                scope: "email profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile",
                                access_type: "online",
                                state: JSON.stringify({redirect_url: window.location.href}),
                                response_type: "code"
                            }, b = "https://accounts.google.com/o/oauth2/v2/auth" + encodeURIParams(a, !0);
                            window.location.href = b
                        }

                        function encodeURIParams(a, b) {
                            var c = [];
                            for (var d in a) if (a.hasOwnProperty(d)) {
                                var e = a[d];
                                null != e && c.push(encodeURIComponent(d) + "=" + encodeURIComponent(e))
                            }
                            return 0 == c.length ? "" : (b ? "?" : "") + c.join("&")
                        }</script>
                        <a href="javascript:void(0)" class="social-login--facebook" onclick="loginFacebook()"><img
                                width="129px" height="37px" alt="facebook-login-button"
                                src="//bizweb.dktcdn.net/assets/admin/images/login/fb-btn.svg"></a>
                        <a href="javascript:void(0)" class="social-login--google" onclick="loginGoogle()"><img
                                width="129px" height="37px" alt="google-login-button"
                                src="//bizweb.dktcdn.net/assets/admin/images/login/gp-btn.svg"></a>
                    </div>

                </form>


                  


                <div class="right-col">
                    <h4>
                        Quyền lợi với thành viên
                    </h4>
                    <div>
                        <p>Vận chuyển siêu tốc</p>
                        <p>Sản phẩm đa dạng </p>
                        <p>Đổi trả dễ dàng</p>
                        <p>Tích điểm đổi quà</p>
                        <p>Được giảm giá cho lần mua tiếp theo lên đến 10% </p>

                    </div>
                    <a href="./signup.jsp" class="btn-register-default">Đăng ký</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Sign In End -->
    <!-- Footer Section Begin -->
    <jsp:include page="footer.jsp"></jsp:include>
</div>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="admin/lib/chart/chart.min.js"></script>
<script src="admin/lib/easing/easing.min.js"></script>
<script src="admin/lib/waypoints/waypoints.min.js"></script>
<script src="admin/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="admin/lib/tempusdominus/js/moment.min.js"></script>
<script src="admin/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="admin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>


<!-- Template Javascript -->
<script src="admin/js/main.js"></script>
<script src="js/main.js"></script>

<!-- LOGIN ADMIN -->

</body>

</html>









