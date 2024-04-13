<%-- 
    Document   : cart
    Created on : Apr 11, 2024, 10:00:16 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@page import="java.util.List" %>

<!DOCTYPE html>
<html data-navigation-type="default" data-navbar-horizontal-shape="default" lang="en-US" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sản phẩm</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/dropzone/dropzone.min.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
        <link href="./assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    </head>

    <body>

        <%@include file="header.jsp" %>

        <main class="main" id="top">
            <section class="pt-5 pb-9">
                <div class="container-small cart">
                    <h2 class="mb-6">Giỏ Hàng</h2>
                    <div class="row g-5">
                        <div class="col-12 col-lg-8">
                            <div id="cartTable" data-list='{"valueNames":["products","color","size","price","quantity","total"],"page":10}'>
                                <div class="table-responsive scrollbar mx-n1 px-1">
                                    <table class="table fs-9 mb-0 border-top border-translucent">
                                        <thead>
                                            <tr>
                                                <th class="sort white-space-nowrap align-middle fs-10" scope="col"></th>
                                                <th class="sort white-space-nowrap align-middle" scope="col" style="min-width:160px;">SẢN PHẨM</th>
                                                <th class="sort align-middle " scope="col" style="width:80px;">MÀU SẮC</th>
                                                <th class="sort align-middle" scope="col" style="width:150px;">SIZE</th>
                                                <th class="sort align-middle text-end" scope="col" style="width:300px;">GIÁ</th>
                                                <th class="sort align-middle ps-5" scope="col" style="width:200px;">SỐ LƯỢNG</th>
                                                <th class="sort align-middle text-end" scope="col" style="width:250px;">TỔNG</th>
                                                <th class="sort text-end align-middle pe-0" scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody class="list" id="cart-table-body">
                                            <%
                                                User user = (User) session.getAttribute("userobj");

                                                CartDAOimpl dao = new CartDAOimpl(DBContext.getConn());
                                                List<Cart> cart = dao.getProductByUser(user.getId());
                                                Float totalPrice = (float) 0.0;
                                                for (Cart c : cart) {
                                                    totalPrice = c.getTotalPrice();
                                            %>
                                            <tr class="cart-table-row btn-reveal-trigger">
                                                <td class="align-middle white-space-nowrap py-0">
                                                    <a class="d-block border border-translucent rounded-2 cart-table-body-img" href="product-details.jsp?pid=<%= c.getProductID() %>">
                                                        <img src="<%= c.getProductPhoto() %>" alt="" />
                                                    </a>
                                                </td>
                                                <td class="products align-middle">
                                                    <a class="fw-semibold mb-0 line-clamp-2" href="product-details.jsp?pid=<%= c.getProductID() %>">
                                                        <%= c.getProductName() %>
                                                    </a>
                                                </td>
                                                <td class="color align-middle white-space-nowrap fs-9 text-body">Glossy black</td>
                                                <td class="size align-middle white-space-nowrap text-body-tertiary fs-9 fw-semibold">XL</td>
                                                <td class="price align-middle text-body fs-9 fw-semibold text-end"><%= c.getPrice() %>₫</td>
                                                <td class="quantity align-middle fs-8 ps-5">
                                                    <div class="input-group input-group-sm flex-nowrap" data-quantity="data-quantity">
                                                        <button class="btn btn-sm px-2" data-type="minus">
                                                            -
                                                        </button>
                                                        <input class="form-control text-center input-spin-none bg-transparent border-0 px-0" type="number" min="1" value="2" aria-label="Amount (to the nearest dollar)"/>
                                                        <button class="btn btn-sm px-2" data-type="plus">
                                                            +
                                                        </button>
                                                    </div>
                                                </td>
                                                <td class="total align-middle fw-bold text-body-highlight text-end">$398</td>
                                                <td class="align-middle white-space-nowrap text-end pe-0 ps-3">
                                                    <button class="btn btn-sm text-body-tertiary text-opacity-85 text-body-tertiary-hover me-2">
                                                        <span class="fas fa-trash"></span>
                                                    </button>
                                                </td>
                                            </tr>
                                            <% 
                                                 } 
                                            %>

                                            <tr class="cart-table-row btn-reveal-trigger">
                                                <td class="text-body-emphasis fw-semibold ps-0 fs-8" colspan="6">Tổng giá trị :</td>
                                                <td class="text-body-emphasis fw-bold text-end fs-8"><%=totalPrice%>₫</td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-between-center mb-3">
                                        <h3 class="card-title mb-0">Tóm tắt</h3>
                                    </div>
                                    <select class="form-select mb-3" aria-label="delivery type">
                                        <option value="cod">
                                            <p>Thanh toán khi nhận hàng</p>
                                        </option>
                                        <option value="card" selected="">
                                            <p>Thanh toán bằng thẻ ngân hàng (QR Code)</p>
                                        </option>
                                        <option value="paypal">
                                            <p>Thanh toán bằng Paypal</p>
                                        </option>
                                    </select>
                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <p class="text-body fw-semibold">Tổng giá trị :</p>
                                            <p class="text-body-emphasis fw-semibold"><%=totalPrice%>₫</p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <p class="text-body fw-semibold">Giảm giá :</p>
                                            <p class="text-danger fw-semibold">-$59</p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <p class="text-body fw-semibold">Thuế :</p>
                                            <p class="text-body-emphasis fw-semibold">$126.20</p>
                                        </div>
                                        <!--                                        <div class="d-flex justify-content-between">
                                                                                    <p class="text-body fw-semibold">Subtotal :</p>
                                                                                    <p class="text-body-emphasis fw-semibold">$665</p>
                                                                                </div>-->
                                        <div class="d-flex justify-content-between">
                                            <p class="text-body fw-semibold">Phí Shipping :</p>
                                            <p class="text-body-emphasis fw-semibold">$30</p>
                                        </div>
                                    </div>
                                    <div class="input-group mb-3"><input class="form-control" type="text" placeholder="Voucher" /><button class="btn btn-phoenix-primary px-5">Apply</button></div>
                                    <div class="d-flex justify-content-between border-y border-dashed py-3 mb-4">
                                        <h4 class="mb-0">Tổng :</h4>
                                        <h4 class="mb-">$695.20</h4>
                                    </div><button class="btn btn-primary w-100">Thông tin nhận hàng và Thanh toán<span class="fas fa-chevron-right ms-1 fs-10"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->

            <div class="support-chat-container">
                <div class="container-fluid support-chat">
                    <div class="card bg-body-emphasis">
                        <div class="card-header d-flex flex-between-center px-4 py-3 border-bottom border-translucent">
                            <h5 class="mb-0 d-flex align-items-center gap-2">Demo widget<span class="fa-solid fa-circle text-success fs-11"></span></h5>
                            <div class="btn-reveal-trigger"><button class="btn btn-link p-0 dropdown-toggle dropdown-caret-none transition-none d-flex" type="button" id="support-chat-dropdown" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h text-body"></span></button>
                                <div class="dropdown-menu dropdown-menu-end py-2" aria-labelledby="support-chat-dropdown"><a class="dropdown-item" href="#!">Request a callback</a><a class="dropdown-item" href="#!">Search in chat</a><a class="dropdown-item" href="#!">Show history</a><a class="dropdown-item" href="#!">Report to Admin</a><a class="dropdown-item btn-support-chat"
                                                                                                                                                                                                        href="#!">Close Support</a></div>
                            </div>
                        </div>
                        <div class="card-body chat p-0">
                            <div class="d-flex flex-column-reverse scrollbar h-100 p-3">
                                <div class="text-end mt-6">
                                    <a class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3" href="#!">
                                        <p class="mb-0 fw-semibold fs-9">I need help with something</p><span class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
                                    </a>
                                    <a class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3" href="#!">
                                        <p class="mb-0 fw-semibold fs-9">I can’t reorder a product I previously ordered</p><span class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
                                    </a>
                                    <a class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3" href="#!">
                                        <p class="mb-0 fw-semibold fs-9">How do I place an order?</p><span class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
                                    </a>
                                    <a class="false d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3" href="#!">
                                        <p class="mb-0 fw-semibold fs-9">My payment method not working</p><span class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
                                    </a>
                                </div>
                                <div class="text-center mt-auto">
                                    <div class="avatar avatar-3xl status-online"><img class="rounded-circle border border-3 border-light-subtle" src="../../../assets/img/team/30.webp" alt="" /></div>
                                    <h5 class="mt-2 mb-3">Eric</h5>
                                    <p class="text-center text-body-emphasis mb-0">Ask us anything – we’ll get back to you here or by email within 24 hours.</p>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer d-flex align-items-center gap-2 border-top border-translucent ps-3 pe-4 py-3">
                            <div class="d-flex align-items-center flex-1 gap-3 border border-translucent rounded-pill px-4"><input class="form-control outline-none border-0 flex-1 fs-9 px-0" type="text" placeholder="Write message" /><label class="btn btn-link d-flex p-0 text-body-quaternary fs-9 border-0" for="supportChatPhotos"><span class="fa-solid fa-image"></span></label><input
                                    class="d-none" type="file" accept="image/*" id="supportChatPhotos" /><label class="btn btn-link d-flex p-0 text-body-quaternary fs-9 border-0" for="supportChatAttachment"> <span class="fa-solid fa-paperclip"></span></label><input
                                    class="d-none" type="file" id="supportChatAttachment" /></div><button class="btn p-0 border-0 send-btn"><span class="fa-solid fa-paper-plane fs-9"></span></button>
                        </div>
                    </div>
                </div><button class="btn p-0 border border-translucent btn-support-chat"><span class="fs-8 btn-text text-primary text-nowrap">Chat demo</span><span class="fa-solid fa-circle text-success fs-9 ms-2"></span><span class="fa-solid fa-chevron-down text-primary fs-7"></span></button>
            </div>

            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="bg-body-highlight dark__bg-gray-1100 py-9">
                <div class="container-small">
                    <div class="row justify-content-between gy-4">
                        <div class="col-12 col-lg-4">
                            <div class="d-flex align-items-center mb-3"><img src="../../../assets/img/icons/logo.png" alt="phoenix" width="27" />
                                <p class="logo-text ms-2">phoenix</p>
                            </div>
                            <p class="text-body-tertiary mb-1 fw-semibold lh-sm fs-9">Phoenix is an admin dashboard template with fascinating features and amazing layout. The template is responsive to all major browsers and is compatible with all available devices and screen sizes.</p>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">About Phoenix</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Careers</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Affiliate Program</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Privacy Policy</a>
                                <a
                                    class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Terms & Conditions</a>
                            </div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Stay Connected</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Blogs</a><a class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span class="fab fa-facebook-square text-primary me-2 fs-8"></span><span class="text-body-secondary">Facebook</span></a>
                                <a
                                    class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span class="fab fa-twitter-square text-info me-2 fs-8"></span><span class="text-body-secondary">Twitter</span></a>
                            </div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Customer Service</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Help Desk</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Support, 24/7</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Community of Phoenix</a></div>
                        </div>
                        <div class="col-6 col-md-auto">
                            <h5 class="fw-bolder mb-3">Payment Method</h5>
                            <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Cash on Delivery</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Online Payment</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">PayPal</a>
                                <a
                                    class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Installment</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of .container-->
            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->

            <footer class="footer position-relative">
                <div class="row g-0 justify-content-between align-items-center h-100">
                    <div class="col-12 col-sm-auto text-center">
                        <p class="mb-0 mt-2 mt-sm-0 text-body">Thank you for creating with Phoenix<span class="d-none d-sm-inline-block"></span><span class="d-none d-sm-inline-block mx-1">|</span><br class="d-sm-none" />2023 &copy;<a class="mx-1" href="https://themewagon.com">Themewagon</a></p>
                    </div>
                    <div class="col-12 col-sm-auto text-center">
                        <p class="mb-0 text-body-tertiary text-opacity-85">v1.14.0</p>
                    </div>
                </div>
            </footer>
        </main>



        <!-- ===============================================-->
        <!--    JavaScripts-->
        <!-- ===============================================-->
        <script src="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/popper/popper.min.js"></script>
        <script src="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/bootstrap/bootstrap.min.js"></script>
        <script src="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/fontawesome/all.min.js"></script>
        <script src="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/swiper/swiper-bundle.min.js"></script>
        <script src="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/dropzone/dropzone.min.js"></script>
        <script src="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/rater-js/index.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
        <script src="./assets/js/phoenix.js"></script>
    </body>

</html>
