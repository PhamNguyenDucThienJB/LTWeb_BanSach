<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: John Pham
  Date: 11/25/2024
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>--%>
<!-- Google Font -->
<c:choose>
    <c:when test="${not empty param.lang}">
        <!-- Nếu có tham số lang trong URL, cập nhật session -->
        <fmt:setLocale value="${param.lang}" scope="session"/>
        <c:set var="lang" value="${param.lang}" scope="session"/>
    </c:when>
    <c:otherwise>
        <!-- Nếu không có tham số lang, kiểm tra session -->
        <c:choose>
            <c:when test="${empty sessionScope.lang}">
                <!-- Nếu session lang trống, mặc định tiếng Anh -->
                <fmt:setLocale value="en_US" scope="session"/>
                <c:set var="lang" value="en_US" scope="session"/>
            </c:when>
            <c:otherwise>
                <!-- Nếu session lang đã tồn tại, sử dụng nó -->
                <fmt:setLocale value="${sessionScope.lang}" scope="session"/>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>

<fmt:setBundle basename="lang.lang" var="bundle" scope="session"/>

<img src="https://pos.nvncdn.com/fd5775-40602/bn/20240321_J5bpFnuw.gif" alt="Banner header">
<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="#"><img src="img/logo_web.jpg" alt=""></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="./favorites.html"><i class="fa fa-heart"></i> <span>1</span></a></li>
            <li><a href="shoping-cart.jsp"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__auth">
            <c:if test="${auth != null}">
                <div class="header__top__right__auth__dropdown">
                    <a href="/" class="dropdown-item">Đơn hàng của tôi</a>
                    <a href="/page_profile.jsp" class="dropdown-item">Hồ sơ của tôi</a>
                    <a class="dropdown-item">Đặt lại mật khẩu</a>
                    <c:if test="${auth.checkRole(1)}">
                        <a href="/" class="dropdown-item">Vào trang quản lí</a>
                    </c:if>
                    <a href="/" class="dropdown-item">Đăng xuất</a>
                </div>
            </c:if>

        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li class="active"><a href="./index.jsp">Trang chủ</a></li>
            <li><a href="about.jsp">Giới thiệu</a></li>
            <li><a href="./shop-product.html">Sản phẩm</a>

            </li>
            <li><a href="blog.jsp">Tin tức</a></li>
            <li><a href="contact.jsp">Liên hệ</a></li>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
    <div class="header__top__right__social">
        <a target="blank"><i class="fa fa-facebook"></i></a>
        <a href="#" target="blank"><i class="fa fa-comment"></i></a>
        <a href="#" target="blank"><i class="fa fa-instagram"></i></a>
    </div>
    <div class="humberger__menu__contact">
        <ul>
            <li><i class="fa fa-envelope"></i>ho</li>
            <li></li>
        </ul>
    </div>
</div>
<!-- Humberger End -->


<!-- Header Section Begin -->
<header class="header">
    <!-- rang cua -->


    <!-- rang cua -->
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6" style="display: inline-flex;">
                    <div class="header__top__left">
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <a href="tel:0987654321" class="fa fa-phone cursor"></a>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+84 987654321</h5>
                                <span><fmt:message bundle="${bundle}" key="menu.search.time"/>8h - 22h</span>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-lg-4 col-md-6"
                     style="display: inline-flex; justify-content: center; align-items: center;">
                    <div class="header__top__center">
                        <div style="display: flex">
                                <span>
                                    <a class="language" style="margin-left: 5px;" href="?lang=vi_VN">
                                        <fmt:message bundle="${bundle}" key="menu.language.vi"/>
                                    </a>
                                </span>
                            <span> | </span>
                                                <span>
                                    <a class="language" style="margin-left: 5px;" href="?lang=en_US">
                                        <fmt:message bundle="${bundle}" key="menu.language.en"/>
                                    </a>
                                </span>
                            <span> | </span>
                                                <span>
                                    <a class="language" style="margin-left: 5px;" href="?lang=ja_JP">
                                        <fmt:message bundle="${bundle}" key="menu.language.ja"/>
                                    </a>
                                </span>
                        </div>
                    </div>
                </div>


                <div class="col-lg-4 col-md-6">
                    <div class="header__top__right" style="margin-top: 12px;    display: flex;
                                                                margin-top: 12px;
                                                                justify-content: flex-end;">

                        <div class="header__top__right__social">
                            <a href="./favorites.html"><i class="fa fa-heart"></i> <span style="color: white;">1</span></a>

                            <a href="shoping-cart.jsp"><i class="fa fa-shopping-bag"></i> <span

                                    style="color: white;">3</span></a>
                            <!-- <a href="https://www.instagram.com/maizecorn1542/" target="blank"><i class="fa fa-instagram"></i></a> -->
                        </div>
                        <div class="header__top__right__auth">

                            <c:choose>

                                <c:when test="${auth != null}">
                                    <span><fmt:message bundle="${bundle}"
                                                       key="menu.welcomeMessage"/> ${auth.tentk} <fmt:message
                                            bundle="${bundle}" key="menu.welcomeMessage_san"/></span>
                                    <div class="header__top__right__auth__dropdown">
                                        <a href="/shoping-cart.jsp" class="dropdown-item"><fmt:message bundle="${bundle}"
                                                                                       key="menu.myOrders"/></a>
                                        <a href="/page_profile.jsp" class="dropdown-item"><fmt:message
                                                bundle="${bundle}" key="menu.myProfile"/></a>
                                        <a class="dropdown-item"><fmt:message bundle="${bundle}"
                                                                              key="menu.resetPassword"/></a>

                                        <c:if test="${auth.checkRole(1)}">
                                            <a href="/AdminIndexSL" class="dropdown-item"><fmt:message
                                                    bundle="${bundle}" key="menu.managePage"/></a>
                                        </c:if>

                                        <a href="/LogoutServlet" class="dropdown-item"><fmt:message bundle="${bundle}"
                                                                                                    key="menu.logout"/></a>
                                    </div>
                                </c:when>


                                <c:otherwise>

                                    <a href="/signin.jsp" class="dropdown-item"><i class="fa fa-user"></i><fmt:message
                                            bundle="${bundle}" key="menu.login"/></a>


                                </c:otherwise>
                            </c:choose>
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
            <div class="col-lg-7">
                <nav class="header__menu">
                    <ul>

                        <li class="menu-item">
                            <a href="./IndexServlet" ><fmt:message bundle="${bundle}" key="menu.home"/></a>
                        </li>
                        <li class="menu-item">
                            <a href="about.jsp" ><fmt:message bundle="${bundle}" key="menu.about"/></a>
                        </li>
                        <li class="menu-item">
                            <a href="./shop-product.html" ><fmt:message bundle="${bundle}" key="menu.products"/></a>
                        </li>
                        <li class="menu-item">
                            <a href="blog.jsp" ><fmt:message bundle="${bundle}" key="menu.news"/></a>
                        </li>
                        <li class="menu-item">
                            <a href="contact.jsp" ><fmt:message bundle="${bundle}" key="menu.contact"/></a>
                        </li>

                    </ul>
                </nav>
            </div>




        </div>

        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form ">
                        <form action="#">

                            <input type="text"
                                   placeholder="<fmt:message bundle="${bundle}"  key='menu.search.placeholder'/>">
                            <button type="submit" class="site-btn"><i class="fa fa-search"></i> <span
                                    class="text_search"><fmt:message bundle="${bundle}"
                                                                     key="menu.search.button"/></span></button>

                        </form>
                    </div>


                </div>
            </div>
        </div>

    </div>
    <link rel="icon" href="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/favicon.png?1730705463447"
          type="image/x-icon">
</header>

<style>
    /*.header {*/
    /*    position: sticky;*/
    /*    top: 0; !* Cố định header tại đỉnh *!*/
    /*    z-index: 1000; !* Đảm bảo header nằm trên các thành phần khác *!*/
    /*    background-color: white; !* Đặt màu nền nếu cần *!*/
    /*    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); !* Tạo hiệu ứng đổ bóng *!*/
    /*}*/
    /* CSS cho liên kết được chọn */
    .selected {
        color: #fd7e14; /* Màu sắc bạn muốn hiển thị */
        font-weight: bold; /* Nếu cần làm nổi bật */
    }

</style>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Kiểm tra nếu có giá trị ngôn ngữ đã lưu trong localStorage
        const storedLang = localStorage.getItem('selectedLang');

        // Lấy tham số lang từ URL
        const urlParams = new URLSearchParams(window.location.search);
        const lang = urlParams.get('lang');

        // Nếu có tham số lang trong URL, lưu nó vào localStorage
        if (lang) {
            localStorage.setItem('selectedLang', lang);
        }

        // Nếu không có tham số lang trong URL, sử dụng ngôn ngữ đã lưu trong localStorage (nếu có)
        const currentLang = storedLang || lang || 'en_US'; // Mặc định là vi_VN nếu không có gì

        // Lấy tất cả các liên kết ngôn ngữ
        const languageLinks = document.querySelectorAll('.language');

        // Lặp qua tất cả các liên kết và kiểm tra nếu nó khớp với ngôn ngữ hiện tại
        languageLinks.forEach(link => {
            const linkLang = link.getAttribute('href').split('=')[1];  // Lấy giá trị lang từ URL

            // Nếu ngôn ngữ trong liên kết khớp với ngôn ngữ hiện tại, thay đổi màu
            if (linkLang === currentLang) {
                link.style.color = 'white';  // Màu của ngôn ngữ đang được chọn
            } else {
                link.style.color = 'black'; // Màu của các ngôn ngữ còn lại
            }
        });
    });



</script>



</header></header>

