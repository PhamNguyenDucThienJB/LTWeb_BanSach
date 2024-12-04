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


<fmt:setLocale value="vi_VN" />

<fmt:setBundle basename="lang.lang"></fmt:setBundle>
<%--<fmt:setLocale value="vi_VN"></fmt:setLocale>--%>
<%--<fmt:setLocale value="vi_VN"></fmt:setLocale>--%>

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
            <li><a href="./shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
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
            <li><a href="./blog.html">Tin tức</a></li>
            <li><a href="./contact.html">Liên hệ</a></li>
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
                                <span><fmt:message key="menu.search.time"/>8h - 22h</span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-4 col-md-6" style="display: inline-flex;
                                                    justify-content: center;
                                                    align-items: center;">
                    <div class="header__top__center">
                        <div style="display: flex">
                            <span><a style="margin-left: 5px;color: black" href=""> <fmt:message key="menu.language.vi" /> | </a></span>
                            <span><a style="margin-left: 5px;color: black" href=""> <fmt:message key="menu.language.en" /> | </a></span>
                            <span><a style="margin-left: 5px;color: black" href=""> <fmt:message key="menu.language.ja" /> </a></span>
                        </div>
                    </div>

                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="header__top__right" style="margin-top: 12px;    display: flex;
                                                                margin-top: 12px;
                                                                justify-content: flex-end;">

                        <div class="header__top__right__social">
                            <a href="./favorites.html"><i class="fa fa-heart"></i> <span style="color: white;">1</span></a>
                            <a href="./shoping-cart.html"><i class="fa fa-shopping-bag"></i> <span
                                    style="color: white;">3</span></a>
                            <!-- <a href="https://www.instagram.com/maizecorn1542/" target="blank"><i class="fa fa-instagram"></i></a> -->
                        </div>
                        <div class="header__top__right__auth">

                            <c:choose>

                                <c:when test="${auth != null}">
                                    <span><fmt:message key="menu.welcomeMessage"/> ${auth.tentk} <fmt:message key="menu.welcomeMessage_san"/></span>
                                    <div class="header__top__right__auth__dropdown">
                                        <a href="/" class="dropdown-item"><fmt:message key="menu.myOrders"/></a>
                                        <a href="/page_profile.jsp" class="dropdown-item"><fmt:message key="menu.myProfile"/></a>
                                        <a class="dropdown-item"><fmt:message key="menu.resetPassword"/></a>

                                        <c:if test="${auth.checkRole(1)}">
                                            <a href="/AdminIndexSL" class="dropdown-item"><fmt:message key="menu.managePage"/></a>
                                        </c:if>

                                        <a href="/LogoutServlet" class="dropdown-item"><fmt:message key="menu.logout"/></a>
                                    </div>
                                </c:when>


                                <c:otherwise>

                                    <a href="/signin.jsp" class="dropdown-item"><i class="fa fa-user"></i><fmt:message key="menu.login"/></a>


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
            <div class="col-lg-7 ">
                <nav class="header__menu">
                    <ul>
                        <li class="active">
                            <a href="./index.jsp"><fmt:message key="menu.home" /></a>
                        </li>
                        <li>
                            <a href="about.jsp"><fmt:message key="menu.about" /></a>
                        </li>
                        <li>
                            <a href="./shop-product.html"><fmt:message key="menu.products" /></a>
                        </li>
                        <li>
                            <a href="./blog.html"><fmt:message key="menu.news" /></a>
                        </li>
                        <li>
                            <a href="./contact.html"><fmt:message key="menu.contact" /></a>
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

                            <input type="text" placeholder="<fmt:message key='menu.search.placeholder'/>">
                            <button type="submit" class="site-btn"><i class="fa fa-search"></i> <span
                                    class="text_search"><fmt:message key="menu.search.button"/></span></button>
                        </form>
                    </div>


                </div>
            </div>
        </div>

    </div>

</header>