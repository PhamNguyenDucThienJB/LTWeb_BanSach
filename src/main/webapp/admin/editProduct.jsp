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
    <title>Edit Product | Admin</title>
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
        <%-- Hiển thị thông báo từ request --%>
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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">List Project </a></li>
                        <li class=" active"><a href="javascript:void(0)"> > Edit Project</a></li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Form Add Project</h4>
                        </div>
                        <div class="card-body">
                            <div class="form-validation">
                                <form class="form-valide" action="/admin/EditProduct" method="post">
                                    <div class="row">
                                        <div class="col-xl-6">
                                            <div class="input-group mb-3">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">Upload</span>
                                                </div>
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input">
                                                    <label class="custom-file-label">Choose file</label>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="id">ID <span
                                                        class="text-danger">*</span></label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="id" name="id"
                                                           value="${listProduct.id}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="name">Name <span
                                                        class="text-danger">*</span></label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="name" name="name"
                                                           value="${listProduct.name}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="kind">Kind <span
                                                        class="text-danger">*</span></label>
                                                <div class="col-lg-6">
                                                    <select class="form-control" id="kind" name="kind">
                                                        <option value="${listProduct.kind}" disabled selected>
                                                            -- ${listProduct.kind} --
                                                        </option>
                                                        <option value="type1">Type 1</option>
                                                        <option value="type2">Type 2</option>
                                                        <option value="type3">Type 3</option>

                                                    </select>
                                                </div>
                                            </div>


                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="size">Size <span
                                                        class="text-danger">*</span></label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="size" name="size"
                                                           value="${listProduct.sizeBook}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="description">Description
                                                    <span class="text-danger">*</span></label>
                                                <div class="col-lg-6">
                                                    <textarea class="form-control" id="description" name="description"
                                                              rows="3">${listProduct.descrip}</textarea>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="content">Content <span
                                                        class="text-danger">*</span></label>
                                                <div class="col-lg-6">
                                                    <textarea class="form-control" id="content" name="content"
                                                              rows="3">${listProduct.content}</textarea>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="author">Author <span
                                                        class="text-danger">*</span></label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="author" name="author"
                                                           value="${listProduct.author}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="price">Price <span
                                                        class="text-danger">*</span></label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="price" name="price"
                                                           value="${listProduct.price}">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <div class="col-lg-8 ml-auto">
                                                    <!-- Nút Add (Thêm) thường có màu xanh lá thể hiện hành động thành công -->
                                                    <button type="submit" class="btn btn-success">Update</button>

                                                    <!-- Nút Reset thường có màu vàng/cam để nhấn mạnh sự cẩn trọng -->
                                                    <button type="reset" class="btn btn-warning">Reset</button>

                                                    <!-- Nút Back (Quay lại) thường có màu xám hoặc màu trung tính -->
                                                    <button type="button" class="btn btn-secondary">
                                                        <a href="/admin/ListProductServlet"
                                                           style="text-decoration: none; color: white;">Back</a>
                                                    </button>
                                                </div>
                                            </div>


                                        </div>

                                    </div>
                                </form>
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


</body>
</html>
