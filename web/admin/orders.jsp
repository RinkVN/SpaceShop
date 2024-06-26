<%-- 
    Document   : orders
    Created on : Mar 15, 2024, 7:57:31 AM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Apex Admin</title>
        <link rel="shortcut icon" href="https://d24ouiz0dt1p4y.cloudfront.net/images/logo-mb.png" type="image/png" />
        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
            rel="stylesheet"
            />
        <!-- BOXICONS -->
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/js/bootstrap/bootstrap.min.js" />

        <link
            rel="stylesheet"
            href="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css"
            />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link
            rel="preload"
            href="https://d24ouiz0dt1p4y.cloudfront.net/assets/css/theme.css"
            data-hs-appearance="default"
            as="style"
            />

        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="css/theme.min.css" />

        <link
            rel="stylesheet"
            href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/css/tom-select.bootstrap5.css"
            />
        <link
            rel="stylesheet"
            href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/quill/dist/quill.snow.css"
            />

        <link href="https://cdn.quilljs.com/1.3.7/quill.snow.css" rel="stylesheet">
        <script src="https://cdn.quilljs.com/1.3.7/quill.js"></script>

    </head>

    <body>
        <%@ include file="sidebar.jsp"%>

        <main id="content" role="main" class="main">
            <!-- Content -->
            <div class="content @@layoutBuilder.header.containerMode">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="row align-items-center mb-3">
                        <div class="col-sm">
                            <h1 class="page-header-title">Orders <span class="badge bg-soft-dark text-dark ms-2">106,905</span></h1>


                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->

                    <!-- Nav Scroller -->
                    <div class="js-nav-scroller hs-nav-scroller-horizontal">

                        <!-- Nav -->
                        <ul class="nav nav-tabs page-header-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">All products</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Open</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Unfulfilled</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Unpaid</a>
                            </li>
                        </ul>
                        <!-- End Nav -->
                    </div>
                    <!-- End Nav Scroller -->
                </div>
                <!-- End Page Header -->

                <div class="row justify-content-end mb-3">
                    <div class="col-lg">
                        <!-- Datatable Info -->
                        <div id="datatableCounterInfo" style="display: ">
                            <div class="d-sm-flex justify-content-lg-end align-items-sm-center">
                                <span class="d-block d-sm-inline-block fs-5 me-3 mb-2 mb-sm-0">
                                    <span id="datatableCounter">0</span>
                                    Selected
                                </span>
                                <a class="btn btn-outline-danger btn-sm mb-2 mb-sm-0 me-2" href="javascript:;">
                                    <i class="bi-trash"></i> Delete
                                </a>
                                <a class="btn btn-white btn-sm mb-2 mb-sm-0 me-2" href="javascript:;">
                                    <i class="bi-archive"></i> Archive
                                </a>
                                <a class="btn btn-white btn-sm mb-2 mb-sm-0 me-2" href="javascript:;">
                                    <i class="bi-upload"></i> Publish
                                </a>
                                <a class="btn btn-white btn-sm mb-2 mb-sm-0" href="javascript:;">
                                    <i class="bi-x-lg"></i> Unpublish
                                </a>
                            </div>
                        </div>
                        <!-- End Datatable Info -->
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->

                <!-- Card -->
                <div class="card">
                    <!-- Header -->
                    <div class="card-header card-header-content-md-between">
                        <div class="mb-2 mb-md-0">
                            <form>
                                <!-- Search -->
                                <div class="input-group input-group-merge input-group-flush">
                                    <div class="input-group-prepend input-group-text">
                                        <i class="bi-search"></i>
                                    </div>
                                    <input id="datatableSearch" type="search" class="form-control" placeholder="Search users" aria-label="Search users">
                                </div>
                                <!-- End Search -->
                            </form>
                        </div>

                        <div class="d-grid d-sm-flex gap-2">
                            <!-- Dropdown -->
                            <div class="dropdown">
                                <button type="button" class="btn btn-white btn-sm dropdown-toggle w-100" id="usersExportDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="bi-download me-2"></i> Export
                                </button>

                                <div class="dropdown-menu dropdown-menu-sm-end" aria-labelledby="usersExportDropdown">
                                    <span class="dropdown-header">Options</span>
                                    <a id="export-copy" class="dropdown-item" href="javascript:;">
                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                        Copy
                                    </a>
                                    <a id="export-print" class="dropdown-item" href="javascript:;">
                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                        Print
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <span class="dropdown-header">Download options</span>
                                    <a id="export-excel" class="dropdown-item" href="javascript:;">
                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                        Excel
                                    </a>
                                    <a id="export-csv" class="dropdown-item" href="javascript:;">
                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                        .CSV
                                    </a>
                                    <a id="export-pdf" class="dropdown-item" href="javascript:;">
                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                        PDF
                                    </a>
                                </div>
                            </div>
                            <!-- End Dropdown -->

                            <!-- Dropdown -->
                            <div class="dropdown">
                                <button type="button" class="btn btn-white btn-sm w-100" id="showHideDropdown" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                                    <i class="bi-table me-1"></i> Columns <span class="badge bg-soft-dark text-dark rounded-circle ms-1">7</span>
                                </button>

                                <div class="dropdown-menu dropdown-menu-end dropdown-card" aria-labelledby="showHideDropdown" style="width: 15rem;">
                                    <div class="card card-sm">
                                        <div class="card-body">
                                            <div class="d-grid gap-3">
                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_order">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Order</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_order" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_date">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Date</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_date" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_customer">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Customer</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_customer" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_payment_status">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Payment status</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_payment_status" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_fulfillment_status">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Fulfillment status</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_fulfillment_status" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_payment_method">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Payment method</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_payment_method" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_total">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Total</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_total">
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->

                                                <!-- Form Switch -->
                                                <label class="row form-check form-switch" for="toggleColumn_actions">
                                                    <span class="col-8 col-sm-9 ms-0">
                                                        <span class="me-2">Actions</span>
                                                    </span>
                                                    <span class="col-4 col-sm-3 text-end">
                                                        <input type="checkbox" class="form-check-input" id="toggleColumn_actions" checked>
                                                    </span>
                                                </label>
                                                <!-- End Form Switch -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Dropdown -->
                        </div>
                    </div>
                    <!-- End Header -->

                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <table id="datatable" class="table table-hover table-borderless table-thead-bordered table-nowrap table-align-middle card-table" style="width: 100%"
                               data-hs-datatables-options='{
                               "columnDefs": [{
                               "targets": [0],
                               "orderable": false
                               }],
                               "order": [],
                               "info": {
                               "totalQty": "#datatableWithPaginationInfoTotalQty"
                               },
                               "search": "#datatableSearch",
                               "entries": "#datatableEntries",
                               "pageLength": 12,
                               "isResponsive": false,
                               "isShowPaging": false,
                               "pagination": "datatablePagination"
                               }'>
                            <thead class="thead-light">
                                <tr>
                                    <th class="table-column-pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="datatableCheckAll">
                                            <label class="form-check-label" for="datatableCheckAll"></label>
                                        </div>
                                    </th>
                                    <th class="table-column-ps-0">Order</th>
                                    <th>Date</th>
                                    <th>Customer</th>
                                    <th>Payment status</th>
                                    <th>Fulfillment status</th>
                                    <th>Payment method</th>
                                    <th>Total</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck1">
                                            <label class="form-check-label" for="ordersCheck1"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#35463</a>
                                    </td>
                                    <td>Aug 17, 2020, 5:48 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Jase Marley</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 4242</span>
                                        </div>
                                    </td>
                                    <td>$256.39</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown1" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown1">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck2">
                                            <label class="form-check-label" for="ordersCheck2"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#23513</a>
                                    </td>
                                    <td>Aug 17, 2020, 2:01 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Mathew Gustaffson</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 2390</span>
                                        </div>
                                    </td>
                                    <td>$2,125.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown2" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown2">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck3">
                                            <label class="form-check-label" for="ordersCheck3"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#62311</a>
                                    </td>
                                    <td>Aug 17, 2020, 1:55 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Mathew Gustaffson</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td>$532.99</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown3" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown3">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck4">
                                            <label class="form-check-label" for="ordersCheck4"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#12453</a>
                                    </td>
                                    <td>Aug 17, 2020, 1:54 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Nicky Olvsson</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-warning text-warning">
                                            <span class="legend-indicator bg-warning"></span>Pending
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 3535</span>
                                        </div>
                                    </td>
                                    <td>$1,035.02</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown4" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown4">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck5">
                                            <label class="form-check-label" for="ordersCheck5"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#84223</a>
                                    </td>
                                    <td>Aug 17, 2020, 1:04 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">David Nunez</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td>$68.53</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown5" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown5">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck6">
                                            <label class="form-check-label" for="ordersCheck6"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#46542</a>
                                    </td>
                                    <td>Aug 17, 2020, 1:01 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Brian Jackson</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td>$100.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown6" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown6">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck7">
                                            <label class="form-check-label" for="ordersCheck7"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="text-danger" href="order-details.jsp">#35378</a>
                                        <i class="bi-exclamation-diamond-fill text-warning"></i>
                                    </td>
                                    <td>Aug 17, 2020, 12:56 (ET)</td>
                                    <td class="text-danger">No customer</td>
                                    <td>
                                        <span class="badge bg-soft-warning text-warning">
                                            <span class="legend-indicator bg-warning"></span>Pending
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 9901</span>
                                        </div>
                                    </td>
                                    <td class="text-danger">$89.46</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown7" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown7">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck8">
                                            <label class="form-check-label" for="ordersCheck8"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="text-danger" href="order-details.jsp">#24562</a>
                                        <i class="bi-exclamation-diamond-fill text-warning"></i>
                                    </td>
                                    <td>Aug 17, 2020, 12:54 (ET)</td>
                                    <td class="text-danger">No customer</td>
                                    <td>
                                        <span class="badge bg-soft-warning text-warning">
                                            <span class="legend-indicator bg-warning"></span>Pending
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 2278</span>
                                        </div>
                                    </td>
                                    <td class="text-danger">$3,535.46</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown8" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown8">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck9">
                                            <label class="form-check-label" for="ordersCheck9"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#78531</a>
                                    </td>
                                    <td>Aug 17, 2020, 12:48 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Mathew Gustaffson</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td>$23.89</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown9" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown9">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck10">
                                            <label class="form-check-label" for="ordersCheck10"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#34634</a>
                                    </td>
                                    <td>Aug 17, 2020, 12:41 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Jase Marley</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td>$77.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown10" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown10">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck11">
                                            <label class="form-check-label" for="ordersCheck11"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="text-danger" href="order-details.jsp">#93817</a>
                                        <i class="bi-exclamation-diamond-fill text-warning"></i>
                                    </td>
                                    <td>Aug 17, 2020, 12:36 (ET)</td>
                                    <td><a class="text-danger" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Jase Marley</a></td>
                                    <td>
                                        <span class="badge bg-soft-warning text-warning">
                                            <span class="legend-indicator bg-warning"></span>Pending
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td class="text-danger">$77.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown11" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown11">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck12">
                                            <label class="form-check-label" for="ordersCheck12"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#43113</a>
                                    </td>
                                    <td>Aug 17, 2020, 12:25 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Jacky Ferguson</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 5533</span>
                                        </div>
                                    </td>
                                    <td>$1,421.47</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown12" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown12">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck13">
                                            <label class="form-check-label" for="ordersCheck13"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#12412</a>
                                    </td>
                                    <td>Aug 16, 2020, 4:31 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Brian Jackson</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 4440</span>
                                        </div>
                                    </td>
                                    <td>$45.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown13" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown13">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck14">
                                            <label class="form-check-label" for="ordersCheck14"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="text-danger" href="order-details.jsp">#92271</a>
                                        <i class="bi-exclamation-diamond-fill text-warning"></i>
                                    </td>
                                    <td>Aug 16, 2020, 3:26 (ET)</td>
                                    <td><a class="text-danger" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Kamilia Williams</a></td>
                                    <td>
                                        <span class="badge bg-soft-warning text-warning">
                                            <span class="legend-indicator bg-warning"></span>Pending
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 6182</span>
                                        </div>
                                    </td>
                                    <td class="text-danger">$2,577.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown14" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown14">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck15">
                                            <label class="form-check-label" for="ordersCheck15"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a class="text-danger" href="order-details.jsp">#62555</a>
                                        <i class="bi-exclamation-diamond-fill text-warning"></i>
                                    </td>
                                    <td>Aug 16, 2020, 2:54 (ET)</td>
                                    <td class="text-danger">No customer</td>
                                    <td>
                                        <span class="badge bg-soft-warning text-warning">
                                            <span class="legend-indicator bg-warning"></span>Pending
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td class="text-danger">$63.46</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown15" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown15">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck16">
                                            <label class="form-check-label" for="ordersCheck16"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#35331</a>
                                    </td>
                                    <td>Aug 16, 2020, 2:48 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Victoria Vicky</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td>$4,639.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown16" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown16">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck17">
                                            <label class="form-check-label" for="ordersCheck17"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#45321</a>
                                    </td>
                                    <td>Aug 16, 2020, 2:40 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Anna Alexsandrova</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/paypal-icon.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull;@gmail.com</span>
                                        </div>
                                    </td>
                                    <td>$5,253.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown17" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown17">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck18">
                                            <label class="form-check-label" for="ordersCheck18"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#23541</a>
                                    </td>
                                    <td>Aug 16, 2020, 1:59 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Max Norway</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 3091</span>
                                        </div>
                                    </td>
                                    <td>$499.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown18" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown18">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck19">
                                            <label class="form-check-label" for="ordersCheck19"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#68681</a>
                                    </td>
                                    <td>Aug 16, 2020, 1:55 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Williams Tonston</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-success text-success">
                                            <span class="legend-indicator bg-success"></span>Paid
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-info text-info">
                                            <span class="legend-indicator bg-info"></span>Fulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 8837</span>
                                        </div>
                                    </td>
                                    <td>$171.00</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown19" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown19">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="ordersCheck20">
                                            <label class="form-check-label" for="ordersCheck20"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <a href="order-details.jsp">#78323</a>
                                    </td>
                                    <td>Aug 16, 2020, 1:15 (ET)</td>
                                    <td>
                                        <a class="text-body" href="https://d24ouiz0dt1p4y.cloudfront.net/ecommerce-customer-details.html">Victor Martinov</a>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-warning text-warning">
                                            <span class="legend-indicator bg-warning"></span>Pending
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge bg-soft-dark text-dark">
                                            <span class="legend-indicator bg-dark"></span>Unfulfilled
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/mastercard.svg" alt="Image Description">
                                            <span class="text-dark">&bull;&bull;&bull;&bull; 3566</span>
                                        </div>
                                    </td>
                                    <td>$348.55</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a class="btn btn-white btn-sm" href="order-details.jsp">
                                                <i class="bi-eye"></i> View
                                            </a>

                                            <!-- Button Group -->
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-white btn-icon btn-sm dropdown-toggle dropdown-toggle-empty" id="ordersExportDropdown20" data-bs-toggle="dropdown" aria-expanded="false"></button>

                                                <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="ordersExportDropdown20">
                                                    <span class="dropdown-header">Options</span>
                                                    <a class="js-export-copy dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/copy-icon.svg" alt="Image Description">
                                                        Copy
                                                    </a>
                                                    <a class="js-export-print dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/print-icon.svg" alt="Image Description">
                                                        Print
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <span class="dropdown-header">Download options</span>
                                                    <a class="js-export-excel dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                        Excel
                                                    </a>
                                                    <a class="js-export-csv dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/placeholder-csv-format.svg" alt="Image Description">
                                                        .CSV
                                                    </a>
                                                    <a class="js-export-pdf dropdown-item" href="javascript:;">
                                                        <img class="avatar avatar-xss avatar-4x3 me-2" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/pdf-icon.svg" alt="Image Description">
                                                        PDF
                                                    </a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="javascript:;">
                                                        <i class="bi-trash dropdown-item-icon"></i> Delete
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- End Unfold -->
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- End Table -->

                    <!-- Footer -->
                    <div class="card-footer">
                        <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                            <div class="col-sm mb-2 mb-sm-0">
                                <div class="d-flex justify-content-center justify-content-sm-start align-items-center">
                                    <span class="me-2">Showing:</span>

                                    <!-- Select -->
                                    <div class="tom-select-custom">
                                        <select id="datatableEntries" class="js-select form-select form-select-borderless w-auto" autocomplete="off"
                                                data-hs-tom-select-options='{
                                                "searchInDropdown": false,
                                                "hideSearch": true
                                                }'>
                                            <option value="12" selected>12</option>
                                            <option value="14">14</option>
                                            <option value="16">16</option>
                                            <option value="18">18</option>
                                        </select>
                                    </div>
                                    <!-- End Select -->

                                    <span class="text-secondary me-2">of</span>

                                    <!-- Pagination Quantity -->
                                    <span id="datatableWithPaginationInfoTotalQty"></span>
                                </div>
                            </div>
                            <!-- End Col -->

                            <div class="col-sm-auto">
                                <div class="d-flex justify-content-center justify-content-sm-end">
                                    <!-- Pagination -->
                                    <nav id="datatablePagination" aria-label="Activity pagination"></nav>
                                </div>
                            </div>
                            <!-- End Col -->
                            <!-- End Col -->
                        </div>
                        <!-- End Row -->
                    </div>
                    <!-- End Footer -->
                </div>
                <!-- End Card -->
            </div>

        </main>

        <!-- JS Global Compulsory @@deleteLine:build -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery/dist/jquery.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery-migrate/dist/jquery-migrate.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JS Implementing Plugins -->
        <!-- bundlejs:vendor [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-navbar-vertical-aside/dist/hs-navbar-vertical-aside.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-form-search/dist/hs-form-search.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-nav-scroller/dist/hs-nav-scroller.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/js/tom-select.complete.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/datatables.net.extensions/select/select.min.js"></script>

        <!-- JS Front -->
        <!-- bundlejs:theme [https://d24ouiz0dt1p4y.cloudfront.net] -->
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.core.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.bs-dropdown.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.tom-select.js"></script>
        <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/hs.datatables.js"></script>


        <!-- JS Plugins Init. -->
        <script>
            $(document).on('ready', function () {
                // INITIALIZATION OF DATATABLES
                // =======================================================
                HSCore.components.HSDatatables.init($('#datatable'), {
                    select: {
                        style: 'multi',
                        selector: 'td:first-child input[type="checkbox"]',
                        classMap: {
                            checkAll: '#datatableCheckAll',
                            counter: '#datatableCounter',
                            counterInfo: '#datatableCounterInfo'
                        }
                    },
                    language: {
                        zeroRecords: `<div class="text-center p-4">
                    <img class="mb-3" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-error.svg" alt="Image Description" style="width: 10rem;" data-hs-theme-appearance="default">
                    <img class="mb-3" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations-light/oc-error.svg" alt="Image Description" style="width: 10rem;" data-hs-theme-appearance="dark">
                  <p class="mb-0">No data to show</p>
                  </div>`
                    }
                });

                const datatable = HSCore.components.HSDatatables.getItem('datatable')

                $('.js-datatable-filter').on('change', function () {
                    var $this = $(this),
                            elVal = $this.val(),
                            targetColumnIndex = $this.data('target-column-index');

                    datatable.column(targetColumnIndex).search(elVal).draw();
                });

                $('#datatableSearch').on('mouseup', function (e) {
                    var $input = $(this),
                            oldValue = $input.val();

                    if (oldValue == "")
                        return;

                    setTimeout(function () {
                        var newValue = $input.val();

                        if (newValue == "") {
                            // Gotcha
                            datatable.search('').draw();
                        }
                    }, 1);
                });

                $('#toggleColumn_order').change(function (e) {
                    datatable.columns(1).visible(e.target.checked)
                })

                $('#toggleColumn_date').change(function (e) {
                    datatable.columns(2).visible(e.target.checked)
                })

                $('#toggleColumn_customer').change(function (e) {
                    datatable.columns(3).visible(e.target.checked)
                })

                $('#toggleColumn_payment_status').change(function (e) {
                    datatable.columns(4).visible(e.target.checked)
                })

                $('#toggleColumn_fulfillment_status').change(function (e) {
                    datatable.columns(5).visible(e.target.checked)
                })

                $('#toggleColumn_payment_method').change(function (e) {
                    datatable.columns(6).visible(e.target.checked)
                })

                datatable.columns(7).visible(false)

                $('#toggleColumn_total').change(function (e) {
                    datatable.columns(7).visible(e.target.checked)
                })

                $('#toggleColumn_actions').change(function (e) {
                    datatable.columns(8).visible(e.target.checked)
                })
            });
        </script>

        <!-- JS Plugins Init. -->
        <script>
            (function () {
                window.onload = function () {
                    @@if (layoutBuilder.header.layoutMode !== 'default') {
                        // INITIALIZATION OF MEGA MENU
                        // =======================================================
                        new HSMegaMenu('.js-mega-menu', {
                            desktop: {
                                position: 'left'
                            }
                        })
                    }

                    // INITIALIZATION OF NAVBAR VERTICAL ASIDE
                    // =======================================================
                    new HSSideNav('.js-navbar-vertical-aside').init()


                    // INITIALIZATION OF FORM SEARCH
                    // =======================================================
                    new HSFormSearch('.js-form-search')


                    // INITIALIZATION OF BOOTSTRAP DROPDOWN
                    // =======================================================
                    HSBsDropdown.init()


                    // INITIALIZATION OF SELECT
                    // =======================================================
                    HSCore.components.HSTomSelect.init('.js-select')


                    // INITIALIZATION OF NAV SCROLLER
                    // =======================================================
                    new HsNavScroller('.js-nav-scroller')
                }
            })()
        </script>

    </body>
</html>
