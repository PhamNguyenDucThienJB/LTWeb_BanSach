<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en">
<meta http-equiv="Content-Type" charset="UTF-8">

<head>
    <meta charset="utf-8">
    <title>Đăng Nhập | Sách</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
            rel="stylesheet">
    <!-- ==================== -->

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


    <!-- Template Stylesheet -->
    <link rel="stylesheet" href="./css/style.css" type="text/css">
    <!-- Template Stylesheet -->
    <link href="./admin/css/style.css" rel="stylesheet">

</head>

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
                <form id="login-form" action="/SignInServlet" style="border: solid;
    color: orange;" method="post" class="bg-pink rounded p-4 p-sm-5 my-4 mx-3">

                    <div>
                        <h2 class="title-sg"><fmt:message bundle="${bundle}"  key="login.title"/></h2>
                    </div>
                    <jsp:include page="validation.jsp"></jsp:include>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" name="email" id="floatingInput" value=""
                               placeholder="name@example.com">
                        <label for="floatingInput"><fmt:message  bundle="${bundle}" key="login.email"/></label>
                    </div>
                    <div class="form-floating mb-4">
                        <input type="password" class="form-control pass" name="pass" id="floatingPassword"
                               placeholder="Password">
                        <label for="floatingPassword"><fmt:message bundle="${bundle}"  key="login.password"/></label>
                    </div>
                    <span id="insertTextHere"></span>
                    <div class="d-flex align-items-center justify-content-between mb-4 mt-4"
                         style="flex-direction: row;">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input toggle" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1"> <fmt:message bundle="${bundle}"
                                                                                              key="login.show-password"/>   </label>
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

                        <a style="cursor: pointer;" href="/page_ForgetPasswd.jsp"> <fmt:message bundle="${bundle}"
                                                                                                key="login.forgot-password"/> </a>
                    </div>
                    <button type="button" id="login-button" class="btn btn-primary py-3 w-100 mb-4"><fmt:message bundle="${bundle}"
                                                                                                                 key="login.button"/></button>


                    <p class="text-center mb-0"><fmt:message bundle="${bundle}"  key="login.no-account"/> <a
                            href="signup.jsp"><fmt:message bundle="${bundle}"  key="login.now"/></a></p>
                    <div class="block social-login--facebooks">
                        <p class="title-sg" style="    margin-left: 80px;
                            margin-right: 80px;
                        ">
                            <span style="font-size: medium;"><fmt:message  bundle="${bundle}" key="login.or"/></span>
                        </p>
                        <div style="display:flex;justify-content: center">
                            <a href="javascript:void(0)" class="social-login--facebook" onclick="loginFacebook()"><img
                                    width="129px" height="37px" alt="facebook-login-button"
                                    src="//bizweb.dktcdn.net/assets/admin/images/login/fb-btn.svg"></a>
                            <a href="javascript:void(0)" class="social-login--google" onclick="loginGoogle()"><img
                                    width="129px" height="37px" alt="google-login-button"
                                    src="//bizweb.dktcdn.net/assets/admin/images/login/gp-btn.svg"></a>
                        </div>
                    </div>

                </form>
                <div class="custom-notifications" style="z-index: 999;"></div>

                <div class="custom-buttons">
                    <button id="custom-success">Success</button>
                    <button id="custom-error">Error</button>
                    <button id="custom-warning">Warning</button>
                    <button id="custom-info">Info</button>
                </div>

                <script>
                    document.getElementById('custom-success').style.display = 'none';
                    document.getElementById('custom-error').style.display = 'none';
                    document.getElementById('custom-warning').style.display = 'none';
                    document.getElementById('custom-info').style.display = 'none';

                    let notifications = document.querySelector('.custom-notifications');

                </script>

                <div class="right-col">
                    <h4>
                        <fmt:message bundle="${bundle}"  key="right-col.benefits"/>
                    </h4>
                    <div>
                        <p><fmt:message bundle="${bundle}"  key="right-col.shipping"/></p>
                        <p><fmt:message bundle="${bundle}"  key="right-col.variety"/></p>
                        <p><fmt:message bundle="${bundle}"  key="right-col.easy-return"/></p>
                        <p><fmt:message bundle="${bundle}"  key="right-col.reward"/></p>
                        <p><fmt:message bundle="${bundle}"  key="right-col.register"/></p>

                    </div>
                    <a href="./signup.jsp" class="btn-register-default"><fmt:message bundle="${bundle}"  key="right-col.register"/></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Sign In End -->
    <!-- Footer Section Begin -->
    <jsp:include page="footer.jsp"></jsp:include>
</div>
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
<script>
    document.getElementById('login-button').addEventListener('click', function () {
        const email = document.getElementById('floatingInput').value.trim();
        const password = document.getElementById('floatingPassword').value.trim();

        // Kiểm tra nếu email hoặc mật khẩu trống
        if (!email || !password) {
            let newToast = document.createElement('div');
            newToast.classList.add('custom-toast', 'custom-warning');
            newToast.innerHTML = `
            <i class="fa-solid fa-circle-exclamation"></i>
            <div class="custom-content">
                <div class="custom-title"><fmt:message bundle="${bundle}" key="popup.warming"/></div>
                <span><fmt:message bundle="${bundle}" key="popup.failwrongcondition"/></span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        `;
            newToast.querySelector('.fa-xmark').onclick = function () {
                clearTimeout(newToast.timeOut);
                newToast.remove();
            };
            document.querySelector('.custom-notifications').appendChild(newToast);
            setTimeout(() => newToast.remove(), 5000);
            return;
        }

        // Kiểm tra email hợp lệ
        if (!email.includes('@')) {
            let newToast = document.createElement('div');
            newToast.classList.add('custom-toast', 'custom-error');
            newToast.innerHTML = `
            <i class="fa-solid fa-circle-exclamation"></i>
            <div class="custom-content">
                <div class="custom-title"><fmt:message  bundle="${bundle}" key="popup.fail"/></div>
                <span><fmt:message bundle="${bundle}"  key="popup.failEmail"/></span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        `;
            document.querySelector('.custom-notifications').appendChild(newToast);
            setTimeout(() => newToast.remove(), 5000);
            return;
        }

        // Kiểm tra mật khẩu có ít nhất 6 ký tự
        if (password.length < 6) {
            let newToast = document.createElement('div');
            newToast.classList.add('custom-toast', 'custom-error');
            newToast.innerHTML = `
            <i class="fa-solid fa-circle-exclamation"></i>
            <div class="custom-content">
                <div class="custom-title"><fmt:message bundle="${bundle}" key="popup.warming"/></div>
                <span><fmt:message bundle="${bundle}"  key="popup.failengouh"/></span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        `;
            document.querySelector('.custom-notifications').appendChild(newToast);
            setTimeout(() => newToast.remove(), 5000);
            return;
        }

        // Nếu tất cả đều hợp lệ, gửi form
        document.getElementById('login-form').submit();
    });

</script>
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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Template Javascript -->
<script src="admin/js/main.js"></script>
<script src="js/main.js"></script>


</body>

</html>

<header>
    <link href="./admin/css/style.css" rel="stylesheet">
    <link href="./admin/css/style.css" rel="stylesheet">
</header>
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


<script>
    // Success toast
    document.getElementById('custom-success').onclick = function () {
        let newToast = document.createElement('div');
        newToast.classList.add('custom-toast', 'custom-success');
        newToast.innerHTML = `
            <i class="fa-solid fa-check-circle"></i>
            <div class="custom-content">
                <div class="custom-title">Thành công</div>
                <span>Đây là thông báo thành công.</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        `;
        notifications.appendChild(newToast);

        // Remove after 5 seconds
        setTimeout(() => newToast.remove(), 5000);
    };

    // Error toast
    document.getElementById('custom-error').onclick = function () {
        let newToast = document.createElement('div');
        newToast.classList.add('custom-toast', 'custom-error');
        newToast.innerHTML = `
            <i class="fa-solid fa-circle-exclamation"></i>
            <div class="custom-content">
                <div class="custom-title">Lỗi</div>
                <span>Đây là thông báo lỗi.</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        `;
        notifications.appendChild(newToast);

        // Remove after 5 seconds
        setTimeout(() => newToast.remove(), 5000);
    };

    // Warning toast
    document.getElementById('custom-warning').onclick = function () {
        let newToast = document.createElement('div');
        newToast.classList.add('custom-toast', 'custom-warning');
        newToast.innerHTML = `
            <i class="fa-solid fa-triangle-exclamation"></i>
            <div class="custom-content">
                <div class="custom-title">Cảnh báo</div>
                <span>Đây là thông báo cảnh báo.</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        `;
        notifications.appendChild(newToast);

        // Remove after 5 seconds
        setTimeout(() => newToast.remove(), 5000);
    };

    // Info toast
    document.getElementById('custom-info').onclick = function () {
        let newToast = document.createElement('div');
        newToast.classList.add('custom-toast', 'custom-info');
        newToast.innerHTML = `
            <i class="fa-solid fa-circle-info"></i>
            <div class="custom-content">
                <div class="custom-title">Thông tin</div>
                <span>Đây là thông báo thông tin.</span>
            </div>
            <i class="fa-solid fa-xmark" onclick="(this.parentElement).remove()"></i>
        `;
        notifications.appendChild(newToast);

        // Remove after 5 seconds
        setTimeout(() => newToast.remove(), 5000);
    };
</script>