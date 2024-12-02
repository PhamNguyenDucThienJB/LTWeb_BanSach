<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <div class="container-fluid bg_signin_signup">

        <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
            <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4" style="    display: contents;">
                <form id="login-form" action="/ForgetPassWorkServlet" style="border: solid;
    color: orange;" method="post" class="bg-pink rounded p-4 p-sm-5 my-4 mx-3">

                    <div>
                        <h2 class="title-sg">Trang Quên Mât Khẩu</h2>
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


                    <button type="submit" id="login-button" class="btn btn-primary py-3 w-100 mb-4">Đăng nhập</button>


                    <p class="text-center mb-0">Bạn chưa có tài khoản? <a href="signup.jsp">Đăng ký ngay</a></p>

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


            </div>
        </div>
    </div>
    <!-- Sign In End -->
    <!-- Footer Section Begin -->
    <jsp:include page="footer.jsp"></jsp:include>
</div>
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
                <div class="custom-title">Cảnh Báo</div>
                <span>Vui lòng nhập đầy đủ email và mật khẩu!</span>
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
                <div class="custom-title">Lỗi</div>
                <span>Email không hợp lệ!</span>
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
                <div class="custom-title">Cảnh Báo</div>
                <span>Mật khẩu phải có ít nhất 6 ký tự!</span>
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