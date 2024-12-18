<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Manager Category | Admin</title>
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
    <jsp:include page="admin_header.jsp"></jsp:include>
    <!--**********************************-->
    <%--      End Header--%>
    <!--**********************************
        Sidebar start
    ***********************************-->
    <jsp:include page="admin_sidebar.jsp"></jsp:include>

    <!--**********************************
        Sidebar end
    ***********************************-->

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <!-- row -->
        <div class="row">

            <div class="col-12">
                <c:if test="${not empty sessionScope.message}">
                    <div class="alert ${sessionScope.messageType == 'success' ? 'alert-success' : 'alert-danger'} alert-dismissible fade show"
                         role="alert">
                        <c:out value="${sessionScope.message}"/>
                        <!-- Nút đóng thông báo -->
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <!-- Xóa thông báo sau khi hiển thị -->
                    <c:remove var="message" scope="session"/>
                    <c:remove var="messageType" scope="session"/>
                </c:if>

                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">List Category </h4>
                        <a style="text-decoration: none; color: white" href="addKindCategory.jsp">
                            <button type="button" class="btn btn-rounded btn-info"><span
                                    class="btn-icon-left text-info"><i class="fa fa-plus color-info"></i>
								</span>Add Category
                            </button>
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="example3" class="display" style="min-width: 845px">
                                <thead>
                                <tr>
                                    <th>Num</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="listC" items="${listCategory}" varStatus="status">
                                    <tr>

                                        <td>${status.index + 1}</td> <!-- Hiển thị số thứ tự, bắt đầu từ 1 -->
                                        <td><a href="javascript:void(0);"><strong>${listC.id}</strong></a></td>
                                        <td><a href="javascript:void(0);"><strong>${listC.bookName}</strong></a></td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="/admin/EditCategory?idCategoryEdit=${listC.id}"
                                                   class="btn btn-primary shadow btn-xs sharp mr-1"><i
                                                        class="fa fa-pencil"></i></a>
                                                <a href="javascript:void(0)"
                                                   class=" btn btn-danger shadow btn-xs sharp"
                                                   onclick="showConfirmModal('${listC.id}')"><i
                                                        class="fa fa-trash"></i></a>
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
        <!--**********************************
            Content body end
        ***********************************-->
        <!-- Modal Xác nhận Xóa -->
        <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chắc chắn muốn xóa Category này không?
                    </div>
                    <div class="modal-footer">
                        <a href="#" id="confirmDeleteBtn" class="btn btn-danger">Xóa</a>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script>
        function showConfirmModal(categoryId) {
            const deleteBtn = document.getElementById('confirmDeleteBtn');

            // Lấy đường dẫn gốc của project từ JSP
            const contextPath = '<%= request.getContextPath() %>';

            // Cập nhật href để xóa tài khoản với id tương ứng
            deleteBtn.href = contextPath + '/admin/DeleteCategory?idCategory=' + categoryId;

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
