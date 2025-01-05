<%@ page import="java.sql.*" %>
<%@ page import="vn.hcmuaf.edu.fit.dto.DBConnection" %>
<%@ page import="vn.hcmuaf.edu.fit.model.Product" %>
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
            <%
                String maSP = request.getParameter("MaSP");

                if (maSP != null && !maSP.isEmpty()) {
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        conn = DBConnection.getConnection();
                        String sql = "SELECT * FROM sanpham WHERE MaSP = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, maSP);
                        rs = stmt.executeQuery();

                        if (rs.next()) {
                            // Lấy thông tin sản phẩm
                            String id = rs.getString("MaSP");
                            String name = rs.getString("TenSP");
                            String author = rs.getString("author");
                            String imageUrl = rs.getString("imageUrl");
                            String descrip = rs.getString("MoTa");
                            double price = rs.getDouble("Gia");

                            Product product = new Product(id, name, null, author, imageUrl, descrip, null, price);
                            request.setAttribute("product", product);
                        } else {
                            request.setAttribute("error", "Không tìm thấy sản phẩm với mã: " + maSP);
                        }
                    } catch (Exception e) {
                        request.setAttribute("error", "Lỗi khi xử lý: " + e.getMessage());
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                } else {
                    request.setAttribute("error", "Mã sản phẩm không hợp lệ.");
                }
            %>


            <c:choose>
                <c:when test="${not empty product}">
                    <div class="col-lg-6">
                        <div class="product__details__pic">
                            <img src="${product.imageUrl}" alt="${product.name}" class="img-fluid">
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
                                        ${product.descrip}
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
                            <a href="shop-product.jsp" class="btn btn-primary">Quay lại</a>
                            <a href="shop-product.jsp" class="btn btn-primary">Thích</a>
                            <a href="shop-product.jsp" class="btn btn-primary">Thêm giỏ hàng</a>
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
