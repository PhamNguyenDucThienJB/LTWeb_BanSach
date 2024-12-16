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
    <title>Manager User | Admin</title>
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
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Profile Datatable</h4>
                        <button type="button" class="btn btn-rounded btn-info"><span
                                class="btn-icon-left text-info"><i class="fa fa-plus color-info"></i>
								</span>Add Category
                        </button>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="example3" class="display" style="min-width: 845px">
                                <thead>
                                <tr>
                                    <th>Num</th>
                                    <th>Num ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>Phone</th>
                                    <th>Role</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${listUser}" varStatus="num">
                                    <tr>
                                        <td>${num.index + 1}</td>
                                        <td>${user.MAKH}</td>
                                        <td>${user.TENKH}</td>
                                        <td>${user.EMAIL}</td>
                                        <td>${user.DIACHI}</td>
                                        <td><a href="javascript:void(0);"><strong>${user.SDT}</strong></a></td>
                                        <td><a href="javascript:void(0);"><strong>${user.role}</strong></a></td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="#" class="btn btn-primary shadow btn-xs sharp mr-1"><i class="fa fa-pencil"></i></a>
                                                <a href="javascript:void(0);" class="btn btn-danger shadow btn-xs sharp btn-delete" data-id="${user.MATAIKHOAN}">
                                                    <i class="fa fa-trash"></i>
                                                </a>
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
<%--        <div class="row">--%>
<%--            <div class="col-lg-3">--%>
<%--                <div class="card">--%>
<%--                    <div class="card-body">--%>
<%--                        <h4 class="card-title">Sweet Confirm</h4>--%>
<%--                        <div class="card-content">--%>
<%--                            <div class="sweetalert mt-5">--%>
<%--                                <button class="btn btn-warning btn sweet-confirm">Sweet Confirm</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <!-- /# card -->--%>
<%--            </div>--%>
<%--        </div>--%>

    </div>
    <!-- Modal Popup -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <h2>Are you sure?</h2>
            <p>Do you want to delete this user?</p>
            <div class="modal-actions">
                <button id="confirmDelete" class="btn btn-danger">Delete</button>
                <button id="cancelDelete" class="btn btn-secondary">Cancel</button>
            </div>
        </div>
    </div>
<style>
    .modal {
        display: none; /* Ẩn modal mặc định */
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 30%;
        text-align: center;
        border-radius: 8px;
    }

    .close-btn {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close-btn:hover,
    .close-btn:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-actions {
        margin-top: 20px;
    }

    .modal-actions .btn {
        margin: 5px;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .btn-danger {
        background-color: #d33;
        color: white;
    }

    .btn-secondary {
        background-color: #aaa;
        color: white;
    }

</style>
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
<%--    <script>--%>
<%--        document.addEventListener('DOMContentLoaded', function () {--%>
<%--            const deleteButtons = document.querySelectorAll('.btn-delete');--%>

<%--            deleteButtons.forEach(button => {--%>
<%--                button.addEventListener('click', function (e) {--%>
<%--                    e.preventDefault();--%>

<%--                    const userId = this.getAttribute('data-id'); // Lấy ID người dùng từ thuộc tính data-id--%>

<%--                    Swal.fire({--%>
<%--                        title: 'Are you sure?',--%>
<%--                        text: "Do you want to delete this user?",--%>
<%--                        icon: 'warning',--%>
<%--                        showCancelButton: true,--%>
<%--                        confirmButtonColor: '#3085d6',--%>
<%--                        cancelButtonColor: '#d33',--%>
<%--                        confirmButtonText: 'Yes, delete it!'--%>
<%--                    }).then((result) => {--%>
<%--                        if (result.isConfirmed) {--%>
<%--                            // Gửi yêu cầu xóa đến server--%>
<%--                            fetch(`/DeleteUserManager?idUser=${userId}`, {--%>
<%--                                method: 'GET',--%>
<%--                            })--%>
<%--                                .then(response => response.json()) // Xử lý phản hồi JSON--%>
<%--                                .then(data => {--%>
<%--                                    if (data.success) {--%>
<%--                                        Swal.fire(--%>
<%--                                            'Deleted!',--%>
<%--                                            data.message,--%>
<%--                                            'success'--%>
<%--                                        );--%>
<%--                                        // Xóa dòng tương ứng trong bảng HTML--%>
<%--                                        button.closest('tr').remove();--%>
<%--                                    } else {--%>
<%--                                        Swal.fire(--%>
<%--                                            'Error!',--%>
<%--                                            data.message,--%>
<%--                                            'error'--%>
<%--                                        );--%>
<%--                                    }--%>
<%--                                })--%>
<%--                                .catch(err => {--%>
<%--                                    Swal.fire(--%>
<%--                                        'Error!',--%>
<%--                                        'An error occurred while deleting the user.',--%>
<%--                                        'error'--%>
<%--                                    );--%>
<%--                                    console.error(err);--%>
<%--                                });--%>
<%--                        }--%>
<%--                    });--%>
<%--                });--%>
<%--            });--%>
<%--        });--%>

<%--    </script>--%>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const deleteButtons = document.querySelectorAll('.btn-delete');
            const modal = document.getElementById('deleteModal');
            const closeModal = document.querySelector('.close-btn');
            const confirmDelete = document.getElementById('confirmDelete');
            const cancelDelete = document.getElementById('cancelDelete');
            let userIdToDelete = null; // Biến lưu trữ ID người dùng

            // Hiển thị modal khi nhấn nút xóa
            deleteButtons.forEach(button => {
                button.addEventListener('click', function (e) {
                    e.preventDefault();
                    userIdToDelete = this.getAttribute('data-id'); // Lưu ID người dùng
                    modal.style.display = 'block'; // Hiển thị modal
                });
            });

            // Đóng modal khi nhấn nút "x"
            closeModal.addEventListener('click', function () {
                modal.style.display = 'none';
            });

            // Đóng modal khi nhấn "Cancel"
            cancelDelete.addEventListener('click', function () {
                modal.style.display = 'none';
            });

            // Xử lý xác nhận xóa
            confirmDelete.addEventListener('click', function () {
                if (userIdToDelete) {
                    console.log("User ID to delete:", userIdToDelete); // In ra ID người dùng trước khi gửi yêu cầu
                    fetch(`/DeleteUserManager?idUser=${userIdToDelete}`, {
                        method: 'GET',
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert('User has been deleted');
                                document.querySelector(`.btn-delete[data-id="${userIdToDelete}"]`).closest('tr').remove();
                            } else {
                                alert('Failed to delete user');
                            }
                        })
                        .catch(err => {
                            alert('An error occurred while deleting the user: '+userIdToDelete);
                            console.error(err);
                        })
                        .finally(() => {
                            modal.style.display = 'none';
                        });
                }
            });



            // Đóng modal khi nhấn ngoài vùng modal
            window.addEventListener('click', function (event) {
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            });
        });

    </script>
</body>
</html>
