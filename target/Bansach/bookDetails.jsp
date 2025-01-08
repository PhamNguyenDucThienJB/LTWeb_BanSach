<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chi Tiết Sản Phẩm</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>


<div class="product-details spad">
    <div class="container">
        <div class="row">
            <c:choose>
                <c:when test="${not empty product}">
                    <div class="col-lg-6">
                        <div class="product__details__pic">
                            <c:forEach var="image" items="${product.listImg}">
                                <img src="${image}" alt="${product.name}" class="img-fluid">
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product__details__text">
                            <h3>${product.name}</h3>
                            <div class="product__details__price mb-3">
                                <span>Giá: </span>
                                <fmt:formatNumber value="${product.price}" type="number" minFractionDigits="0" maxFractionDigits="2" />
                                <span> VND</span>
                            </div>

                            <div class="product__details__author mb-3">
                                <strong class="text-primary">Tác giả:</strong> <span>${product.author}</span>
                            </div>
                            <div class="product__details__desc">
                                <h5 class="text-secondary">Thông tin:</h5>
                                <p id="description" class="text-justify" style="line-height: 1.8; color: #555;">
                                        ${product.description}
                                </p>
                                <button id="toggleDescription" class="btn btn-link p-0">Xem thêm</button>
                            </div>

                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    const description = document.querySelector("#description");
                                    const toggleButton = document.querySelector("#toggleDescription");

                                    if (description && toggleButton) {
                                        const originalText = description.textContent.trim();
                                        const shortText = originalText.length > 200 ? originalText.substring(0, 200) + "..." : originalText;

                                        description.textContent = shortText;

                                        toggleButton.addEventListener("click", function () {
                                            const isShortened = description.textContent === shortText;
                                            description.textContent = isShortened ? originalText : shortText;
                                            toggleButton.textContent = isShortened ? "Xem bớt" : "Xem thêm";
                                        });
                                    }
                                });
                            </script>
                        </div>
                        <div class="d-flex justify-content-around mt-3">
                            <a href="./shop-product" class="btn btn-primary">Quay lại</a>
                            <a href="./shop-product" class="btn btn-primary">Thích</a>
                            <form action="addToCart" method="post" target="cartFrame">
                                <input type="hidden" name="id" value="${product.id}" />
                                <input type="hidden" name="name" value="${product.name}" />
                                <input type="hidden" name="author" value="${product.author}" />
                                <input type="hidden" name="price" value="${product.price}" />
                                <input type="hidden" name="image" value="${product.listImg[0]}" />
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-cart-plus"></i> Thêm vào giỏ hàng
                                </button>
                            </form>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <p>${error}</p>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
