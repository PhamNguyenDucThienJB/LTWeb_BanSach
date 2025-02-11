<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Manager Order | Admin</title>
    <!-- Favicon icon -->
    <link rel="icon" href="//bizweb.dktcdn.net/100/197/269/themes/890698/assets/favicon.png?1730705463447"
          type="image/x-icon">
    <link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./vendor/chartist/css/chartist.min.css">
    <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="./vendor/css/style.css" rel="stylesheet">
    <link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Datatable -->
    <link rel="stylesheet" href="/admin/css/admin/css/style.css">
    <link href="./vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="./vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <link href="./vendor/css/style.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<!--*******************
     Preloader start
 ********************-->
<div id="preloader">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<!--*******************
    Preloader end
********************-->

<!--**********************************
    Main wrapper start
***********************************-->
<div id="main-wrapper">

    <!--**********************************
        Nav header start
    ***********************************-->

    <!--**********************************
        Nav header end
    ***********************************-->
    <%--            Header--%>
    <!--**********************************-->
    <jsp:include page="main_header_Admin.jsp"></jsp:include>
    <!--**********************************-->
    <%--      End Header--%>
    <!--**********************************
        Sidebar start
    ***********************************-->
    <jsp:include page="main_sidebar_Admin.jsp"></jsp:include>

    <!--**********************************
        Sidebar end
    ***********************************-->

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles mx-0">
                <div class="col-sm-6 p-md-0">
                    <div class="welcome-text">
                        <h4>Hi, welcome back!</h4>
                        <span>Datatable</span>
                    </div>
                </div>
                <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">List Order</a></li>
                        <li class="active"><a href="javascript:void(0)"> > Datatable Order</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->


            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">List Order</h4>
                            <button type="button" class="btn btn-rounded btn-info"><span
                                    class="btn-icon-left text-info"><i class="fa fa-plus color-info"></i>
								</span>Add Order
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="example5" class="display" style="min-width: 845px">
                                    <thead>
                                    <tr>
                                        <th>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="checkAll"
                                                       required="">
                                                <label class="custom-control-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th>Order ID</th>
                                        <th>Costumer ID</th>
                                        <th>Date Check Order</th>
                                        <%--                                        <th>Quantity</th>--%>
                                        <th>tele</th>
                                        <th>Address</th>
                                        <th>Total Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td>
                                                <div class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input"
                                                           id="customCheckBox${order.mahd}" required="">
                                                    <label class="custom-control-label"
                                                           for="customCheckBox${order.mahd}"></label>
                                                </div>
                                            </td>
                                            <td>${order.mahd}</td> <!-- Mã đơn hàng -->
                                            <td>${order.maKH}</td> <!-- Ngày đặt hàng -->
                                            <td>${order.date}</td>
                                                <%--                                            <td>${order.solg}</td>--%>
                                            <td>${order.tele}</td> <!-- Tên sản phẩm -->
                                            <td>${order.diachigiao}</td> <!-- Địa chỉ giao hàng -->
                                            <td><fmt:formatNumber value="${order.totalprice}" type="number"
                                                                  groupingUsed="true"/> VND
                                            </td> <!-- Số điện thoại -->
                                            <td>
                                                    <span class="badge light
                                                        <c:choose>
                                                            <c:when test="${order.status == 0}">badge-danger</c:when>
                                                            <c:when test="${order.status == 1}">badge-warning</c:when>
                                                            <c:when test="${order.status == 2}">badge-success</c:when>
                                                            <c:otherwise>badge-secondary</c:otherwise>
                                                        </c:choose>
                                                    ">
                                                        <i class="fa fa-circle
                                                            <c:choose>
                                                                <c:when test="${order.status == 0}">text-danger</c:when>
                                                                <c:when test="${order.status == 1}">text-warning</c:when>
                                                                <c:when test="${order.status == 2}">text-success</c:when>
                                                                <c:otherwise>text-secondary</c:otherwise>
                                                            </c:choose>
                                                            mr-1
                                                        "></i>
                                                        <c:choose>
                                                            <c:when test="${order.status == 0}">Chờ xác nhận</c:when>
                                                            <c:when test="${order.status == 1}">Đã xác nhận</c:when>
                                                            <c:when test="${order.status == 2}">Đang giao hàng</c:when>
                                                            <c:otherwise>Không xác định</c:otherwise>
                                                        </c:choose>
                                                    </span>
                                            </td>

                                            <td>
                                                <div class="dropdown ml-auto text-right">
                                                    <div class="btn-link" data-toggle="dropdown">
                                                        <svg width="24px" height="24px" viewBox="0 0 24 24"
                                                             version="1.1">
                                                            <g stroke="none" stroke-width="1" fill="none"
                                                               fill-rule="evenodd">
                                                                <rect x="0" y="0" width="24" height="24"></rect>
                                                                <circle fill="#000000" cx="5" cy="12"
                                                                        r="2"></circle>
                                                                <circle fill="#000000" cx="12" cy="12"
                                                                        r="2"></circle>
                                                                <circle fill="#000000" cx="19" cy="12"
                                                                        r="2"></circle>
                                                            </g>
                                                        </svg>
                                                    </div>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item"
                                                           href="/admin/UnAcceptOrder?id=${order.mahd}">Wait</a>
                                                        <a class="dropdown-item"
                                                           href="/admin/acceptOrder?id=${order.mahd}">Xác
                                                            nhận</a>
                                                        <a class="dropdown-item"
                                                           href="/admin/shippingOrder?id=${order.mahd}">Đã chuyển hàng
                                                        </a>
                                                        <a class="dropdown-item"
                                                           href="/admin/DeleteOrderAdmin?id=${order.mahd}">Xóa đơn
                                                            hàng</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="./vendor/global/global.min.js"></script>
    <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="./vendor/chart.js/Chart.bundle.min.js"></script>
    <script src="./js/custom.min.js"></script>
    <script src="./js/deznav-init.js"></script>

    <!-- Counter Up -->
    <script src="./vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>

    <!-- Apex Chart -->
    <script src="./vendor/apexchart/apexchart.js"></script>

    <!-- Chart piety plugin files -->
    <script src="./vendor/peity/jquery.peity.min.js"></script>

    <!-- Dashboard 1 -->
    <script src="./js/dashboard/dashboard-1.js"></script>

    <!-- Datatable -->
    <script src="./vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="./js/plugins-init/datatables.init.js"></script>

    <script src="./vendor/apexchart/apexchart.js"></script>


    <script src="./vendor/sweetalert2/dist/sweetalert2.min.js"></script>
    <script src="./js/plugins-init/sweetalert.init.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script>
        function showConfirmModal(userId) {
            const deleteBtn = document.getElementById('confirmDeleteBtn');

            // Lấy đường dẫn gốc của project từ JSP
            const contextPath = '<%= request.getContextPath() %>';

            // Cập nhật href để xóa tài khoản với id tương ứng
            deleteBtn.href = contextPath + '/DeleteUserManager?idUser=' + userId;

            // Hiển thị modal
            var myModal = new bootstrap.Modal(document.getElementById('confirmDeleteModal'));
            myModal.show();
        }

        document.querySelector('.btn-secondary').addEventListener('click', function () {
            // Xử lý khi nhấn "Hủy" nếu cần
            console.log('Modal đã bị đóng');
        });
    </script>

</body>
</html>
