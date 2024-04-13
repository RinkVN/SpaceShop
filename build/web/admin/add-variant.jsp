<%-- 
    Document   : add-variant
    Created on : Apr 8, 2024, 10:52:24 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <<head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Thêm Sản Phẩm</title>
        <link rel="shortcut icon" href="https://d24ouiz0dt1p4y.cloudfront.net/images/logo-mb.png" type="image/png" />
        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet" />
        <!-- BOXICONS -->
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/js/bootstrap/bootstrap.min.js" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="preload" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/css/theme.css" data-hs-appearance="default" as="style" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="css/theme.min.css" />
        <link rel="stylesheet" href="css/browers-file.css" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/css/tom-select.bootstrap5.css" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/quill/dist/quill.snow.css" />
        <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
        <script src="https://cdn.quilljs.com/1.3.7/quill.js"></script>
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/daterangepicker/daterangepicker.css">
        <link href="css/flowbite.css" rel="stylesheet"/>

    </head>
    <body>
        <%@ include file="sidebar.jsp"%>
        <!-- ========== MAIN CONTENT ========== -->

        <!--Block access to admin/add_books.jsp-->
        <c:if test="${empty userobj}">
            <c:redirect url="../login.jsp"/>
        </c:if>
        <c:if test="${not userobj.email eq 'admin@gmail.com'}">
            <c:redirect url="../login.jsp"/>
        </c:if>

        <main id="content" role="main" class="main">
            <!-- Content -->
            <div class="content @@layoutBuilder.header.containerMode">
                <form action="../addvariant" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-8 mb-3 mb-lg-0">
                            <div class="card mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header">
                                    <h4 class="card-header-title">Phân Loại</h4>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
<%
                                        ProductDAOimpl d = new ProductDAOimpl(DBContext.getConn());
                                        List<ProductInfo> list = d.getAllProduct();
                                        for (ProductInfo b : list) {
                                    %>
                                    <input 
                                        type="hidden" 
                                        name="ProductID" 
                                        value="<%= b.getProductID() %>"
                                        >
                                    <%
                                        }
                                    %>
                                   
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- Form -->
                                            <div class="mb-4">
                                                <label for="SizeLabel" class="form-label">Size</label>

                                                <input 
                                                    type="text" 
                                                    class="form-control" 
                                                    name="size" id="SKULabel" 
                                                    placeholder="39,40,41,..." 
                                                    aria-label="39,40,41,..."
                                                    >
                                            </div>
                                            <!-- End Form -->
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-sm-6">
                                            <!-- Form -->
                                            <div class="mb-4">
                                                <label for="materialLabel" class="form-label">Chất liệu</label>

                                                <div class="input-group">
                                                    <input
                                                        name="material"
                                                        type="text"
                                                        class="form-control"
                                                        id="exampleInputEmail1"
                                                        aria-describedby="emailHelp"
                                                        >
                                                </div>

                                                <!--<small class="form-text">Used to calculate shipping rates at checkout and label prices during fulfillment.</small>-->
                                            </div>
                                            <!-- End Form -->
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="productNameLabel" class="form-label">Màu sắc 
                                            <i class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Book's Name."></i></label>
                                        <input
                                            name="color"
                                            type="text"
                                            class="form-control"
                                            id="exampleInputEmail1"
                                            aria-describedby="emailHelp"
                                            >
                                    </div>
                                    <!-- End Form -->
                                </div>
                                <!-- Body -->
                            </div>

                            <!-- End Col -->
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" >
                        Add Books
                    </button>
                </form>
            </div>


    </body>
</html>
