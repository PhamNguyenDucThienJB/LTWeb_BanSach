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
                int productId = Integer.parseInt(request.getParameter("id"));
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    conn = DBConnection.getConnection();
                    String sql = "SELECT * FROM Books WHERE id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, productId);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        String title = rs.getString("title");
                        String author = rs.getString("author");
                        String description = rs.getString("description");
                        String imageUrl = rs.getString("imageUrl");
                        double price = rs.getDouble("price");

                        Product product = new Product(title, author, description, imageUrl, price);
                        request.setAttribute("product", product);
                    } else {
                        request.setAttribute("error", "Không tìm thấy sản phẩm.");
                    }
                } catch (Exception e) {
                    request.setAttribute("error", e.getMessage());
                    e.printStackTrace();  // Log exception
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>

            <c:choose>
                <c:when test="${not empty product}">
                    <div class="col-lg-6">
                        <div class="product__details__pic">
                            <img src="${product.imageUrl}" alt="${product.title}" class="img-fluid">
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="product__details__text">
                            <h3>${product.title}</h3>
                            <div class="product__details__price mb-3">
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

                        <%--thu gon thong tin--%>
                            <script>
                                document.addEventListener("DOMContentLoaded", function () {
                                    const description = document.getElementById("description");
                                    const toggleButton = document.getElementById("toggleDescription");

                                    // Kiểm tra phần tử
                                    if (description && toggleButton) {
                                        const originalText = description.textContent.trim(); // Nội dung đầy đủ
                                        const shortText = originalText.substring(0, 200) + "..."; // Nội dung rút gọn, 200 ký tự đầu

                                        // Hiển thị nội dung rút gọn ban đầu
                                        description.textContent = shortText;

                                        // Gắn sự kiện cho nút
                                        toggleButton.addEventListener("click", function () {
                                            if (description.textContent === shortText) {
                                                // Hiển thị nội dung đầy đủ
                                                description.textContent = originalText;
                                                toggleButton.textContent = "Xem bớt";
                                            } else {
                                                // Hiển thị nội dung rút gọn
                                                description.textContent = shortText;
                                                toggleButton.textContent = "Xem thêm";
                                            }
                                        });
                                    } else {
                                        console.error("Không tìm thấy phần tử #description hoặc #toggleDescription.");
                                    }
                                });
                            </script>

                        </div>


                        <!-- Các nút xếp đều cạnh nhau -->
                            <div class="d-flex justify-content-around mt-3">
                                <!-- Nút Quay lại -->
                                <a href="shop-product.jsp" class="btn btn-primary">Quay lại</a>
                                <a href="shop-product.jsp" class="btn btn-primary">Quay lại</a>
                                <a href="shop-product.jsp" class="btn btn-primary">Quay lại</a>
                            </div>

                        </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <p>${error}</p> <!-- In ra lỗi nếu không có sản phẩm -->
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
