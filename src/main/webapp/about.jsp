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
    <title>Books | About</title>

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&family=Roboto:wght@100;300;400;500;700&display=swap"
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

</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Hero Section Begin -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="./img/banner/title.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><fmt:message key="breadcrumb.title" bundle="${bundle}"/></h2>
                    <div class="breadcrumb__option">
                        <a href="index.jsp"><fmt:message key="breadcrumb.home" bundle="${bundle}"/></a>
                        <span><fmt:message key="breadcrumb.introduction" bundle="${bundle}"/></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="about spad">
    <div class="container">
        <div class="row">
            <div class="about__text">
                <h4><fmt:message key="about.title" bundle="${bundle}"/></h4>
                <p><fmt:message key="about.content" bundle="${bundle}"/></p>
                <img data-thumb="original" original-height="1540" original-width="1231"
                     src="//bizweb.dktcdn.net/100/197/269/files/tho-ng-tin-web-05-25f0908f-34c2-4f42-be75-37c00ae74eed.png?v=1675679714483">
                <h4><fmt:message key="about.strength" bundle="${bundle}"/></h4>
                <p><fmt:message key="about.strength.content" bundle="${bundle}"/></p>
                <img data-thumb="original" original-height="1547" original-width="1239"
                     src="//bizweb.dktcdn.net/100/197/269/files/tho-ng-tin-web-15-f5bfe8cc-6f33-4532-8742-753cc3a69160.png?v=1675679741223">
            </div>
        </div>
    </div>
</section>

<!-- About Section End -->


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