<%-- 
    Document   : product-details
    Created on : Apr 10, 2024, 1:05:22 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html data-navigation-type="default" data-navbar-horizontal-shape="default" lang="en-US" dir="ltr">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>Sản phẩm</title>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
              integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        
        <!-- ===============================================-->
        <!--    Stylesheets-->
        <!-- ===============================================-->
        
        <link href="https://vendor.bacshop.s3.ap-southeast-2.amazonaws.com/vendors/dropzone/dropzone.min.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
        <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
        <link href="./assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    </head>

    <body>

        <%@include file="header.jsp" %>

        <!-- ===============================================-->
        <!--    Main Content-->
        <!-- ===============================================-->
        <%
              User user = (User)session.getAttribute("userobj");
        %>

        <%
                   int pid = Integer.parseInt(request.getParameter("pid"));
                   ProductDAOimpl dao = new ProductDAOimpl(DBContext.getConn());
                   ProductInfo p = dao.getProductById(pid);
        %>

        <main class="main" id="top">

            <div class="mobile-search">
                <div class="container">
                    <div class="search-box">
                        <form action="" class="search">
                            <span class="icon-large"><i class="ri-search-line"></i></span>
                            <input type="search" placeholder="Tìm kiếm sản phẩm...">
                            <button type="submit">Tìm kiếm</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- <section> begin ============================-->
            <section class="py-0">
                <div class="container-small">
                    <div class="row g-5 mb-5 mb-lg-8" data-product-details="data-product-details">
                        <div class="col-12 col-lg-6">
                            <div class="row g-3 mb-3">


                                <div class="col-12 col-md-10 col-lg-12 col-xl-12">
                                    <div class="d-flex align-items-center border border-translucent rounded-3 text-center p-5 h-100">
                                        <!-- Ảnh to -->

                                        <div class="swiper swiper-container theme-slider">
                                            <swiper-container style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff;
                                                              --swiper-navigation-size: 25px;" class="mySwiper" thumbs-swiper=".mySwiper2" space-between="10"
                                                              navigation="true">
                                                <swiper-slide>
                                                    <video controls muted autoplay loop webkit-playsinline playsinline
                                                           src="../../assets/images/products/dep1 (1).mp4" type="video/mp4">
                                                </swiper-slide>
                                                <swiper-slide>
                                                    <img src="<%= p.getProductPhoto() %>" />
                                                </swiper-slide>
                                            </swiper-container>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-12">
                                <swiper-container class="mySwiper2" space-between="10" slides-per-view="6" free-mode="true"
                                                  watch-slides-progress="true">
                                    <swiper-slide>
                                        <video src="../../assets/images/products/dep1 (1).mp4" />
                                    </swiper-slide>
                                    <swiper-slide>
                                        <img src="<%= p.getProductPhoto() %>" />
                                    </swiper-slide>

                                </swiper-container>
                            </div>




                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="d-flex flex-column justify-content-between">
                                <div>
                                    <div class="d-flex flex-wrap">
                                        <div class="me-2">
                                            <span class="fa fa-star text-warning"></span>
                                            <span class="fa fa-star text-warning"></span>
                                            <span class="fa fa-star text-warning"></span>
                                            <span class="fa fa-star text-warning"></span>
                                            <span class="fa fa-star text-warning"></span>
                                        </div>
                                        <p class="text-primary fw-semibold mb-2">6548 Người đánh giá </p>
                                    </div>
                                    <h3 class="mb-3 lh-sm"><%= p.getProductName() %></h3>
                                    <div class="d-flex flex-wrap align-items-start mb-3"><span
                                            class="badge text-bg-success fs-9 rounded-pill me-2 fw-semibold">#1 Best seller</span><a
                                            class="fw-semibold" href="#!"></a></div>
                                    <div class="d-flex flex-wrap align-items-center">
                                        <h1 class="me-3"><%= p.getPrice() %>₫</h1>
                                        <p class="text-body-quaternary text-decoration-line-through fs-6 mb-0 me-3">₫40.000</p>
                                        <p class="text-warning fw-bolder fs-6 mb-0">41% GIẢM</p>
                                    </div>
                                    <p class="text-success fw-semibold fs-7 mb-2">Miễn phí vận chuyển</p>

                                    <p class="text-danger-dark fw-bold mb-5 mb-lg-0">Giảm giá hết hạn trong: 23:00:45</p>
                                </div>
                                <div>
                                    <div class="mb-3">
                                        <p class="fw-semibold mb-2 text-body">Màu sắc : 
                                            <span class="text-body-emphasis">Blue</span>
                                        </p>
                                        <div class="d-flex product-color-variants" data-product-color-variants="data-product-color-variants">
                                            <div class="rounded-1 border border-translucent me-2">

                                            </div>
                                            <swiper-container class="mySwiper2" space-between="10" slides-per-view="6" free-mode="true"
                                                              watch-slides-progress="true">

                                                <swiper-slide>
                                                    <img src="../../assets/images/products/dep1 (3).jpg" />
                                                </swiper-slide>
                                                <swiper-slide>
                                                    <img src="../../assets/images/products/dep1 (4).jpg" />
                                                </swiper-slide>
                                                <swiper-slide>
                                                    <img src="../../assets/images/products/dep1 (5).jpg" />
                                                </swiper-slide>
                                                <swiper-slide>
                                                    <img src="../../assets/images/products/dep1 (6).jpg" />
                                                </swiper-slide>
                                                <swiper-slide>
                                                    <img src="../../assets/images/products/dep1 (7).jpg" />
                                                </swiper-slide>
                                                <swiper-slide>
                                                    <img src="../../assets/images/products/dep1 (8).jpg" />
                                                </swiper-slide>
                                                <swiper-slide>
                                                    <img src="../../assets/images/products/dep1 (9).jpg" />
                                                </swiper-slide>
                                            </swiper-container>
                                        </div>
                                    </div>
                                    <div class="row g-3 g-sm-5 align-items-end">
                                        <div class="col-12 col-sm-auto">
                                            <p class="fw-semibold mb-2 text-body">Size : </p>
                                            <div class="d-flex align-items-center"><select class="form-select w-auto">
                                                    <option value="44">44</option>
                                                    <option value="22">22</option>
                                                    <option value="18">18</option>
                                                </select><a class="ms-2 fs-9 fw-semibold" href="#!">Bảng Size</a></div>
                                        </div>
                                        <div class="col-12 col-sm">
                                            <p class="fw-semibold mb-2 text-body">Số lượng : </p>
                                            <div class="d-flex justify-content-between align-items-end">
                                                <div class="d-flex flex-between-center">
                                                    <button class="btn btn-phoenix-primary px-3" data-type="minus">
                                                        <span class="fas fa-minus"></span>
                                                    </button>
                                                    <input class="form-control text-center input-spin-none bg-transparent border-0 outline-none"
                                                           style="width:50px;" type="number" min="1" value="2" />
                                                    <button class="btn btn-phoenix-primary px-3" data-type="plus">
                                                        <span class="fas fa-plus"></span>
                                                    </button>
                                                </div>
                                                <button class="btn btn-phoenix-primary px-3 border-0">
                                                    <span class="fas fa-share-alt fs-7"></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%
                                if (u == null) {
                            %>
                            <div class="d-flex btn-add">
                                <div class="add-cart">
                                    <a href="../../login.jsp">
                                        <button class="btn btn-lg btn-outline-warning rounded-pill w-100 me-3 px-2 px-sm-4 fs-9 fs-sm-8">
                                            <span class="me-2 far fa-heart"></span><p>Yêu thích</p>
                                        </button>
                                    </a>
                                </div>
                                <div class="add-cart">
                                    <a href="../../login.jsp" class="add-cart">
                                        <button class="btn btn-lg btn-warning rounded-pill w-100 fs-9 fs-sm-8">
                                            <span class="fas fa-shopping-cart me-2"></span><p>Mua ngay</p>
                                        </button>
                                    </a>
                                </div>
                            </div>
                            <% } else { %>
                            <div class="d-flex btn-add">
                                <div class="add-cart">
                                    <a href="../../login.jsp">
                                        <button class="btn btn-lg btn-outline-warning rounded-pill w-100 me-3 px-2 px-sm-4 fs-9 fs-sm-8">
                                            <span class="me-2 far fa-heart"></span><p>Yêu thích</p>
                                        </button>
                                    </a>
                                </div>
                                <div class="add-cart">
                                    <a href="../../addcart?ProductID=<%= p.getProductID() %>&&userID=<%= u.getId() %>" class="add-cart">
                                        <button class="btn btn-lg btn-warning rounded-pill w-100 fs-9 fs-sm-8">
                                            <span class="fas fa-shopping-cart me-2"></span><p>Mua ngay</p>
                                        </button>
                                    </a>
                                </div>
                            </div>
                            <%
                              }
                            %>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section><!-- <section> close ============================-->
            <!-- ============================================-->


            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="py-0">
                <div class="container-small">
                    <ul class="nav nav-underline fs-9 mb-4" id="productTab" role="tablist">
                        <li class="nav-item"><a class="nav-link active" id="description-tab" data-bs-toggle="tab"
                                                href="#tab-description" role="tab" aria-controls="tab-description" aria-selected="true">Mô tả</a>
                        </li>

                        <li class="nav-item"><a class="nav-link" id="reviews-tab" data-bs-toggle="tab" href="#tab-reviews" role="tab"
                                                aria-controls="tab-reviews" aria-selected="false">Đánh giá &amp; Reviews</a></li>
                    </ul>
                    <div class="row gx-3 gy-7">
                        <div class="col-12 col-lg-7 col-xl-8">
                            <div class="tab-content" id="productTabContent">
                                <div class="tab-pane pe-lg-6 pe-xl-12 fade show active text-body-emphasis" id="tab-description"
                                     role="tabpanel" aria-labelledby="description-tab">
                                    <p class="mb-5">
                                        <%= p.getDescription() %>
                                    </p><a href="./assets/img/products/23.png"
                                           data-gallery="gallery-description"><img class="img-fluid mb-5 rounded-3"
                                                                            src="./assets/img/products/23.png" alt=""></a>
                                    <p class="mb-0">The new iMac joins Apple's fantastic M1-powered Mac family, which includes the MacBook
                                        Air, 13-inch MacBook Pro, and Mac mini, and represents yet another step ahead in the company's shift
                                        to Apple silicon. Customers may order iMac starting Friday, April 30. It's the most personal,
                                        powerful, capable, and enjoyable it's ever been. In the second half of May, the iMac will be
                                        available."M1 is a huge step forward for the Mac," said Greg Joswiak, Apple's senior vice president
                                        of Worldwide Marketing. "Today, we're delighted to present the all-new iMac, the first Mac developed
                                        around the groundbreaking M1 processor." "The new iMac takes everything people love about iMac to an
                                        entirely new level, with its beautiful design in seven breathtaking colors, its immersive 4.5K
                                        Retina display, the greatest camera, mics, and speakers ever in a Mac, and Touch ID, combined with
                                        M1's incredible performance and macOS Big Sur's power."</p>
                                </div>

                                <div class="tab-pane fade" id="tab-reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                    <div class="bg-body-emphasis rounded-3 p-4 border border-translucent">
                                        <div class="row g-3 justify-content-between mb-4">
                                            <div class="col-auto">
                                                <div class="d-flex align-items-center flex-wrap">
                                                    <h2 class="fw-bolder me-3">4.9<span class="fs-8 text-body-quaternary fw-bold">/5</span></h2>
                                                    <div class="me-3"><span class="fa fa-star text-warning fs-6"></span><span
                                                            class="fa fa-star text-warning fs-6"></span><span
                                                            class="fa fa-star text-warning fs-6"></span><span
                                                            class="fa fa-star text-warning fs-6"></span><span
                                                            class="fa fa-star-half-alt star-icon text-warning fs-6"></span></div>
                                                    <p class="text-body mb-0 fw-semibold fs-7">6548 ratings and 567 reviews</p>
                                                </div>
                                            </div>
                                            <div class="col-auto"><button class="btn btn-primary rounded-pill" data-bs-toggle="modal"
                                                                          data-bs-target="#reviewModal">Rate this product</button>
                                                <div class="modal fade" id="reviewModal" tabindex="-1" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content p-4">
                                                            <div class="d-flex flex-between-center mb-2">
                                                                <h5 class="modal-title fs-8 mb-0">Your rating</h5><button
                                                                    class="btn p-0 fs-10">Clear</button>
                                                            </div>
                                                            <div class="mb-3" data-rater='{"starSize":32,"step":0.5}'></div>
                                                            <div class="mb-3">
                                                                <h5 class="text-body-highlight mb-3">Your review</h5><textarea class="form-control"
                                                                                                                               id="reviewTextarea" rows="5" placeholder="Write your review"> </textarea>
                                                            </div>
                                                            <div class="dropzone dropzone-multiple p-0 mb-3" id="my-awesome-dropzone" data-dropzone>
                                                                <div class="fallback"><input name="file" type="file" multiple></div>
                                                                <div class="dz-preview d-flex flex-wrap">
                                                                    <div
                                                                        class="border border-translucent bg-body-emphasis rounded-3 d-flex flex-center position-relative me-2 mb-2"
                                                                        style="height:80px;width:80px;"><img class="dz-image"
                                                                                                         src="./assets/img/products/23.png" alt="..." data-dz-thumbnail><a
                                                                                                         class="dz-remove text-body-quaternary" href="#!" data-dz-remove><span
                                                                                data-feather="x"></span></a></div>
                                                                </div>
                                                                <div class="dz-message text-body-tertiary text-opacity-85 fw-bold fs-9 p-4"
                                                                     data-dz-message> Drag your photo here <span class="text-body-secondary">or
                                                                    </span><button class="btn btn-link p-0">Browse from device </button><br><img
                                                                        class="mt-3 me-2" src="./assets/img/icons/image-icon.png" width="24" alt=""></div>
                                                            </div>
                                                            <div class="d-sm-flex flex-between-center">
                                                                <div class="form-check flex-1"><input class="form-check-input" id="reviewAnonymously"
                                                                                                      type="checkbox" value="" checked=""><label
                                                                                                      class="form-check-label mb-0 text-body-emphasis fw-semibold"
                                                                                                      for="reviewAnonymously">Review anonymously</label></div><button class="btn ps-0"
                                                                                                                                data-bs-dismiss="modal">Close</button><button
                                                                                                                                class="btn btn-primary rounded-pill">Submit</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-4 hover-actions-trigger btn-reveal-trigger">
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-2"><span class="fa fa-star text-warning"></span><span
                                                        class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                                        class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                                        class="text-body-secondary ms-1"> by</span> Zingko Kudobum</h5>
                                                <div class="btn-reveal-trigger position-static"><button
                                                        class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
                                                        type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true"
                                                        aria-expanded="false" data-bs-reference="parent"><span
                                                            class="fas fa-ellipsis-h fs-10"></span></button>
                                                    <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">View</a><a
                                                            class="dropdown-item" href="#!">Export</a>
                                                        <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="text-body-tertiary fs-9 mb-1">35 mins ago</p>
                                            <p class="text-body-highlight mb-3">100% satisfied</p>
                                            <div class="row g-2 mb-2">
                                                <div class="col-auto"><a href="./assets/img/e-commerce/review-11.jpg"
                                                                         data-gallery="gallery-0"><img src="./assets/img/e-commerce/review-11.jpg" alt=""
                                                                                  height="164" /></a></div>
                                                <div class="col-auto"><a href="./assets/img/e-commerce/review-12.jpg"
                                                                         data-gallery="gallery-0"><img src="./assets/img/e-commerce/review-12.jpg" alt=""
                                                                                  height="164" /></a></div>
                                                <div class="col-auto"><a href="./assets/img/e-commerce/review-13.jpg"
                                                                         data-gallery="gallery-0"><img src="./assets/img/e-commerce/review-13.jpg" alt=""
                                                                                  height="164" /></a></div>
                                            </div>
                                            <div class="d-flex"><span class="fas fa-reply fa-rotate-180 me-2"></span>
                                                <div>
                                                    <h5>Respond from store<span class="text-body-tertiary fs-9 ms-2">5 mins ago</span></h5>
                                                    <p class="text-body-highlight mb-0">Thank you for your valuable feedback</p>
                                                </div>
                                            </div>
                                            <div class="hover-actions top-0"><button class="btn btn-sm btn-phoenix-secondary me-2"><span
                                                        class="fas fa-thumbs-up"></span></button><button
                                                    class="btn btn-sm btn-phoenix-secondary me-1"><span class="fas fa-thumbs-down"></span></button>
                                            </div>
                                        </div>
                                        <div class="mb-4 hover-actions-trigger btn-reveal-trigger">
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-2"><span class="fa fa-star text-warning"></span><span
                                                        class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                                        class="fa fa-star text-warning"></span><span
                                                        class="fa-regular fa-star text-warning-light"></span><span class="text-body-secondary ms-1">
                                                        by</span> Piere Auguste Renoir</h5>
                                                <div class="btn-reveal-trigger position-static"><button
                                                        class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
                                                        type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true"
                                                        aria-expanded="false" data-bs-reference="parent"><span
                                                            class="fas fa-ellipsis-h fs-10"></span></button>
                                                    <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">View</a><a
                                                            class="dropdown-item" href="#!">Export</a>
                                                        <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="text-body-tertiary fs-9 mb-1">23 Oct, 12:09 PM</p>
                                            <p class="text-body-highlight mb-1">Since the spring loaded event, I've been wanting an iMac, and
                                                it's exceeded my expectations. The screen is clear, the colors are vibrant (I got the blue one!
                                                ), and the performance is more than adequate for my needs as a college student. That's how good
                                                it is.</p>
                                            <div class="hover-actions top-0"><button class="btn btn-sm btn-phoenix-secondary me-2"><span
                                                        class="fas fa-thumbs-up"></span></button><button
                                                    class="btn btn-sm btn-phoenix-secondary me-1"><span class="fas fa-thumbs-down"></span></button>
                                            </div>
                                        </div>
                                        <div class="mb-4 hover-actions-trigger btn-reveal-trigger">
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-2"><span class="fa fa-star text-warning"></span><span
                                                        class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                                        class="fa fa-star-half-alt star-icon text-warning"></span><span
                                                        class="fa-regular fa-star text-warning-light"></span><span class="text-body-secondary ms-1">
                                                        by</span> Abel Kablmann </h5>
                                                <div class="btn-reveal-trigger position-static"><button
                                                        class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
                                                        type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true"
                                                        aria-expanded="false" data-bs-reference="parent"><span
                                                            class="fas fa-ellipsis-h fs-10"></span></button>
                                                    <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">View</a><a
                                                            class="dropdown-item" href="#!">Export</a>
                                                        <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="text-body-tertiary fs-9 mb-1">21 Oct, 12:00 PM</p>
                                            <p class="text-body-highlight mb-1">Over the years, I've preferred Apple products. My job has
                                                allowed me to use Windows products on laptops and PCs. I've owned Windows laptops and desktops
                                                for home use in the past and will never use them again.</p>
                                            <div class="hover-actions top-0"><button class="btn btn-sm btn-phoenix-secondary me-2"><span
                                                        class="fas fa-thumbs-up"></span></button><button
                                                    class="btn btn-sm btn-phoenix-secondary me-1"><span class="fas fa-thumbs-down"></span></button>
                                            </div>
                                        </div>
                                        <div class="mb-4 hover-actions-trigger btn-reveal-trigger">
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-2"><span class="fa fa-star text-warning"></span><span
                                                        class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                                        class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                                        class="text-body-secondary ms-1"> by</span> Pennywise Alfred</h5>
                                                <div class="btn-reveal-trigger position-static"><button
                                                        class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal"
                                                        type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true"
                                                        aria-expanded="false" data-bs-reference="parent"><span
                                                            class="fas fa-ellipsis-h fs-10"></span></button>
                                                    <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="#!">View</a><a
                                                            class="dropdown-item" href="#!">Export</a>
                                                        <div class="dropdown-divider"></div><a class="dropdown-item text-danger" href="#!">Remove</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="text-body-tertiary fs-9 mb-1">35 mins ago</p>
                                            <p class="text-body-highlight mb-3">Nice and beautiful product.</p>
                                            <div class="row g-2 mb-2">
                                                <div class="col-auto"><a href="./assets/img/e-commerce/review-14.jpg"
                                                                         data-gallery="gallery-3"><img src="./assets/img/e-commerce/review-14.jpg" alt=""
                                                                                  height="164" /></a></div>
                                                <div class="col-auto"><a href="./assets/img/e-commerce/review-15.jpg"
                                                                         data-gallery="gallery-3"><img src="./assets/img/e-commerce/review-15.jpg" alt=""
                                                                                  height="164" /></a></div>
                                                <div class="col-auto"><a href="./assets/img/e-commerce/review-16.jpg"
                                                                         data-gallery="gallery-3"><img src="./assets/img/e-commerce/review-16.jpg" alt=""
                                                                                  height="164" /></a></div>
                                            </div>
                                            <div class="hover-actions top-0"><button class="btn btn-sm btn-phoenix-secondary me-2"><span
                                                        class="fas fa-thumbs-up"></span></button><button
                                                    class="btn btn-sm btn-phoenix-secondary me-1"><span class="fas fa-thumbs-down"></span></button>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <nav>
                                                <ul class="pagination mb-0">
                                                    <li class="page-item"><a class="page-link" href="#!"><span class="fas fa-chevron-left">
                                                            </span></a></li>
                                                    <li class="page-item"><a class="page-link" href="#!">1</a></li>
                                                    <li class="page-item"><a class="page-link" href="#!">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#!">3</a></li>
                                                    <li class="page-item active"><a class="page-link" href="#!">4</a></li>
                                                    <li class="page-item"><a class="page-link" href="#!">5</a></li>
                                                    <li class="page-item"><a class="page-link" href="#!"><span
                                                                class="fas fa-chevron-right"></span></a></li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-5 col-xl-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="text-body-emphasis">Thường được mua chung với</h5>
                                    <div class="w-75">
                                        <p class="text-body-tertiary fs-9 fw-bold line-clamp-1">with 24" iMac® with Retina 4.5K display -
                                            Apple M1 8GB Memory - 256GB SSD - w/Touch ID (Latest Model) - Blue</p>
                                    </div>
                                    <div class="border-dashed border-y border-translucent py-4">
                                        <div class="d-flex align-items-center mb-5">
                                            <div class="form-check mb-0"><input class="form-check-input" type="checkbox"
                                                                                checked="checked" /><label class="form-check-label"></label></div><a
                                                href="./apps/e-commerce/landing/product-details.html"> <img
                                                    class="border border-translucent rounded" src="./assets/img/products/2.png" width="53"
                                                    alt="" /></a>
                                            <div class="ms-2"><a class="fs-9 fw-bold line-clamp-2 mb-2"
                                                                 href="./apps/e-commerce/landing/product-details.html"> iPhone 13 pro max-Pacific Blue-
                                                    128GB</a>
                                                <h5>$899.99</h5>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center mb-5">
                                            <div class="form-check mb-0"><input class="form-check-input" type="checkbox"
                                                                                checked="checked" /><label class="form-check-label"></label></div><a
                                                href="./apps/e-commerce/landing/product-details.html"> <img
                                                    class="border border-translucent rounded" src="./assets/img/products/16.png" width="53"
                                                    alt="" /></a>
                                            <div class="ms-2"><a class="fs-9 fw-bold line-clamp-2 mb-2"
                                                                 href="./apps/e-commerce/landing/product-details.html">Apple AirPods Pro</a>
                                                <h5>$59.00</h5>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center mb-0">
                                            <div class="form-check mb-0"><input class="form-check-input" type="checkbox" /><label
                                                    class="form-check-label"></label></div><a href="./apps/e-commerce/landing/product-details.html">
                                                <img class="border border-translucent rounded" src="./assets/img/products/10.png" width="53"
                                                     alt="" /></a>
                                            <div class="ms-2"><a class="fs-9 fw-bold line-clamp-2 mb-2"
                                                                 href="./apps/e-commerce/landing/product-details.html">Apple Magic Mouse (Wireless,
                                                    Rechargable) - Silver, Worst mouse ever</a>
                                                <h5>$89.00</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-end justify-content-between pt-3">
                                        <div>
                                            <h5 class="mb-2 text-body-tertiary text-opacity-85">Total</h5>
                                            <h4 class="mb-0 text-body-emphasis">$958.99</h4>
                                        </div>
                                        <div class="btn btn-outline-warning">Add 3 items to cart<span
                                                class="fas fa-shopping-cart ms-2"></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->
            </section><!-- <section> close ============================-->
            <!-- ============================================-->

        </div>

        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="py-0 mb-9">
            <div class="container">
                <div class="d-flex flex-between-center mb-3">
                    <div>
                        <h3>Sản phẩm tương tự</h3>
                        <p class="mb-0 text-body-tertiary fw-semibold">Essential for a better life</p>
                    </div><button class="btn btn-sm btn-phoenix-primary">Xem tất cả</button>
                </div>

                <div class="similar-product">
                    <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                            <div class="d-flex flex-column justify-content-between h-100">
                                <div>
                                    <div class="border border-1 border-translucent rounded-3 position-relative mb-3">
                                        <button
                                            class="btn rounded-circle p-0 d-flex flex-center btn-wish z-2 d-toggle-container btn-outline-primary"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist">
                                            <span class="fas fa-heart d-block-hover"></span>
                                            <span class="far fa-heart d-none-hover"></span>
                                        </button>
                                        <img class="img-fluid" src="./assets/img/products/1.png" alt="" />
                                    </div>
                                    <a class="stretched-link" href="./apps/e-commerce/landing/product-details.html">
                                        <h6 class="mb-2 lh-sm line-clamp-3 product-name">Fitbit Sense Advanced Smartwatch with Tools for
                                            Heart Health, Stress Management &amp;amp; Skin Temperature Trends Carbon/Graphite, One Size (S
                                            &amp; L Bands)</h6>
                                    </a>
                                    <p class="fs-9"><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="text-body-quaternary fw-semibold ms-1">(59 people rated)</span></p>
                                </div>
                                <div>
                                    <div class="d-flex align-items-center mb-1">
                                        <p class="me-2 text-body text-decoration-line-through mb-0">$49.99</p>
                                        <h3 class="text-body-emphasis mb-0">$34.99</h3>
                                    </div>
                                    <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                            <div class="d-flex flex-column justify-content-between h-100">
                                <div>
                                    <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button
                                            class="btn rounded-circle p-0 d-flex flex-center btn-wish z-2 d-toggle-container btn-outline-primary"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span
                                                class="fas fa-heart d-block-hover"></span><span
                                                class="far fa-heart d-none-hover"></span></button><img class="img-fluid"
                                                                                               src="./assets/img/products/3.png" alt="" /></div><a class="stretched-link"
                                                                                        href="./apps/e-commerce/landing/product-details.html">
                                        <h6 class="mb-2 lh-sm line-clamp-3 product-name">Apple MacBook Pro 13 inch-M1-8/256GB-Space Gray
                                        </h6>
                                    </a>
                                    <p class="fs-9"><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="text-body-quaternary fw-semibold ms-1">(13 people rated)</span></p>
                                </div>
                                <div>
                                    <p class="fs-9 text-body-highlight fw-bold mb-2">Apple care included</p>
                                    <div class="d-flex align-items-center mb-1">
                                        <p class="me-2 text-body text-decoration-line-through mb-0">$1299.00</p>
                                        <h3 class="text-body-emphasis mb-0">$1149.00</h3>
                                    </div>
                                    <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                            <div class="d-flex flex-column justify-content-between h-100">
                                <div>
                                    <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button
                                            class="btn rounded-circle p-0 d-flex flex-center btn-wish z-2 d-toggle-container btn-outline-primary"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span
                                                class="fas fa-heart d-block-hover"></span><span
                                                class="far fa-heart d-none-hover"></span></button><img class="img-fluid"
                                                                                               src="./assets/img/products/5.png" alt="" /></div><a class="stretched-link"
                                                                                        href="./apps/e-commerce/landing/product-details.html">
                                        <h6 class="mb-2 lh-sm line-clamp-3 product-name">Razer Kraken v3 x Wired 7.1 Surroung Sound
                                            Gaming headset</h6>
                                    </a>
                                    <p class="fs-9"><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="text-body-quaternary fw-semibold ms-1">(64 people rated)</span></p>
                                </div>
                                <div>
                                    <h3 class="text-body-emphasis">$59.00</h3>
                                    <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">1 colors</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                            <div class="d-flex flex-column justify-content-between h-100">
                                <div>
                                    <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button
                                            class="btn rounded-circle p-0 d-flex flex-center btn-wish z-2 d-toggle-container btn-outline-primary"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span
                                                class="fas fa-heart d-block-hover"></span><span
                                                class="far fa-heart d-none-hover"></span></button><img class="img-fluid"
                                                                                               src="./assets/img/products/2.png" alt="" /><span
                                                                                               class="badge text-bg-success fs-10 product-verified-badge">Verified<span
                                                class="fas fa-check ms-1"></span></span></div><a class="stretched-link"
                                                                                     href="./apps/e-commerce/landing/product-details.html">
                                        <h6 class="mb-2 lh-sm line-clamp-3 product-name">iPhone 13 pro max-Pacific Blue, 128GB storage
                                        </h6>
                                    </a>
                                    <p class="fs-9"><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="text-body-quaternary fw-semibold ms-1">(32 people rated)</span></p>
                                </div>
                                <div>
                                    <p class="fs-9 text-body-highlight fw-bold mb-2">Stock limited</p>
                                    <div class="d-flex align-items-center mb-1">
                                        <p class="me-2 text-body text-decoration-line-through mb-0">$899.99</p>
                                        <h3 class="text-body-emphasis mb-0">$855.00</h3>
                                    </div>
                                    <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">5 colors</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                            <div class="d-flex flex-column justify-content-between h-100">
                                <div>
                                    <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button
                                            class="btn rounded-circle p-0 d-flex flex-center btn-wish z-2 d-toggle-container btn-outline-primary"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span
                                                class="fas fa-heart d-block-hover"></span><span
                                                class="far fa-heart d-none-hover"></span></button><img class="img-fluid"
                                                                                               src="./assets/img/products/16.png" alt="" /></div><a class="stretched-link"
                                                                                         href="./apps/e-commerce/landing/product-details.html">
                                        <h6 class="mb-2 lh-sm line-clamp-3 product-name">Apple AirPods Pro</h6>
                                    </a>
                                    <p class="fs-9"><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="text-body-quaternary fw-semibold ms-1">(39 people rated)</span></p>
                                </div>
                                <div>
                                    <p class="fs-9 text-body-highlight fw-bold mb-1">free with iPhone 5s</p>
                                    <p class="fs-9 text-body-tertiary mb-2">Ships to Canada</p>
                                    <h3 class="text-body-emphasis">$59.00</h3>
                                    <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">3 colors</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                            <div class="d-flex flex-column justify-content-between h-100">
                                <div>
                                    <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button
                                            class="btn rounded-circle p-0 d-flex flex-center btn-wish z-2 d-toggle-container btn-outline-primary"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span
                                                class="fas fa-heart d-block-hover"></span><span
                                                class="far fa-heart d-none-hover"></span></button><img class="img-fluid"
                                                                                               src="./assets/img/products/10.png" alt="" /></div><a class="stretched-link"
                                                                                         href="./apps/e-commerce/landing/product-details.html">
                                        <h6 class="mb-2 lh-sm line-clamp-3 product-name">Apple Magic Mouse (Wireless, Rechargable) -
                                            Silver</h6>
                                    </a>
                                    <p class="fs-9"><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="text-body-quaternary fw-semibold ms-1">(6 people rated)</span></p>
                                </div>
                                <div>
                                    <p class="fs-9 text-body-highlight fw-bold mb-1">Bundle availabe</p>
                                    <p class="fs-9 text-body-tertiary mb-2">Charger not included</p>
                                    <h3 class="text-body-emphasis">$89.00</h3>
                                    <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="position-relative text-decoration-none product-card h-100">
                            <div class="d-flex flex-column justify-content-between h-100">
                                <div>
                                    <div class="border border-1 border-translucent rounded-3 position-relative mb-3"><button
                                            class="btn rounded-circle p-0 d-flex flex-center btn-wish z-2 d-toggle-container btn-outline-primary"
                                            data-bs-toggle="tooltip" data-bs-placement="top" title="Add to wishlist"><span
                                                class="fas fa-heart d-block-hover"></span><span
                                                class="far fa-heart d-none-hover"></span></button><img class="img-fluid"
                                                                                               src="./assets/img/products/6.png" alt="" /></div><a class="stretched-link"
                                                                                        href="./apps/e-commerce/landing/product-details.html">
                                        <h6 class="mb-2 lh-sm line-clamp-3 product-name">PlayStation 5 DualSense Wireless Controller
                                        </h6>
                                    </a>
                                    <p class="fs-9"><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="fa fa-star text-warning"></span><span class="fa fa-star text-warning"></span><span
                                            class="text-body-quaternary fw-semibold ms-1">(67 people rated)</span></p>
                                </div>
                                <div>
                                    <div class="d-flex align-items-center mb-1">
                                        <p class="me-2 text-body text-decoration-line-through mb-0">$125.00</p>
                                        <h3 class="text-body-emphasis mb-0">$89.00</h3>
                                    </div>
                                    <p class="text-body-tertiary fw-semibold fs-9 lh-1 mb-0">2 colors</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div><!-- end of .container-->
        </section><!-- <section> close ============================-->
        <!-- ============================================-->

        <div class="support-chat-container">
            <div class="container-fluid support-chat">
                <div class="card bg-body-emphasis">
                    <div class="card-header d-flex flex-between-center px-4 py-3 border-bottom border-translucent">
                        <h5 class="mb-0 d-flex align-items-center gap-2">Demo widget<span
                                class="fa-solid fa-circle text-success fs-11"></span></h5>
                        <div class="btn-reveal-trigger"><button
                                class="btn btn-link p-0 dropdown-toggle dropdown-caret-none transition-none d-flex" type="button"
                                id="support-chat-dropdown" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true"
                                aria-expanded="false" data-bs-reference="parent"><span
                                    class="fas fa-ellipsis-h text-body"></span></button>
                            <div class="dropdown-menu dropdown-menu-end py-2" aria-labelledby="support-chat-dropdown"><a
                                    class="dropdown-item" href="#!">Request a callback</a><a class="dropdown-item" href="#!">Search in
                                    chat</a><a class="dropdown-item" href="#!">Show history</a><a class="dropdown-item" href="#!">Report
                                    to Admin</a><a class="dropdown-item btn-support-chat" href="#!">Close Support</a></div>
                        </div>
                    </div>
                    <div class="card-body chat p-0">
                        <div class="d-flex flex-column-reverse scrollbar h-100 p-3">
                            <div class="text-end mt-6"><a
                                    class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
                                    href="#!">
                                    <p class="mb-0 fw-semibold fs-9">I need help with something</p><span
                                        class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
                                </a><a
                                    class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
                                    href="#!">
                                    <p class="mb-0 fw-semibold fs-9">I can’t reorder a product I previously ordered</p><span
                                        class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
                                </a><a
                                    class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
                                    href="#!">
                                    <p class="mb-0 fw-semibold fs-9">How do I place an order?</p><span
                                        class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
                                </a><a
                                    class="false d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
                                    href="#!">
                                    <p class="mb-0 fw-semibold fs-9">My payment method not working</p><span
                                        class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
                                </a></div>
                            <div class="text-center mt-auto">
                                <div class="avatar avatar-3xl status-online"><img
                                        class="rounded-circle border border-3 border-light-subtle" src="./assets/img/team/30.webp" alt="" />
                                </div>
                                <h5 class="mt-2 mb-3">Eric</h5>
                                <p class="text-center text-body-emphasis mb-0">Ask us anything – we’ll get back to you here or by email
                                    within 24 hours.</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer d-flex align-items-center gap-2 border-top border-translucent ps-3 pe-4 py-3">
                        <div class="d-flex align-items-center flex-1 gap-3 border border-translucent rounded-pill px-4"><input
                                class="form-control outline-none border-0 flex-1 fs-9 px-0" type="text"
                                placeholder="Write message" /><label class="btn btn-link d-flex p-0 text-body-quaternary fs-9 border-0"
                                for="supportChatPhotos"><span class="fa-solid fa-image"></span></label><input class="d-none" type="file"
                                                                                                          accept="image/*" id="supportChatPhotos" /><label
                                                                                                          class="btn btn-link d-flex p-0 text-body-quaternary fs-9 border-0" for="supportChatAttachment"> <span
                                    class="fa-solid fa-paperclip"></span></label><input class="d-none" type="file"
                                                                                id="supportChatAttachment" /></div><button class="btn p-0 border-0 send-btn"><span
                                class="fa-solid fa-paper-plane fs-9"></span></button>
                    </div>
                </div>
            </div><button class="btn p-0 border border-translucent btn-support-chat"><span
                    class="fs-8 btn-text text-primary text-nowrap">Chat demo</span><span
                    class="fa-solid fa-circle text-success fs-9 ms-2"></span><span
                    class="fa-solid fa-chevron-down text-primary fs-7"></span></button>
        </div>

        <!-- ============================================-->
        <!-- <section> begin ============================-->
        <section class="bg-body-highlight dark__bg-gray-1100 py-9">
            <div class="container-small">
                <div class="row justify-content-between gy-4">
                    <div class="col-12 col-lg-4">
                        <div class="d-flex align-items-center mb-3"><img src="./assets/img/icons/logo.png" alt="phoenix"
                                                                         width="27" />
                            <p class="logo-text ms-2">SHOP</p>
                        </div>
                        <p class="text-body-tertiary mb-1 fw-semibold lh-sm fs-9"></p>
                    </div>
                    <div class="col-6 col-md-auto">
                        <h5 class="fw-bolder mb-3">About SHOP</h5>
                        <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Careers</a><a
                                class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Affiliate Program</a><a
                                class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Privacy Policy</a><a
                                class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Terms & Conditions</a></div>
                    </div>
                    <div class="col-6 col-md-auto">
                        <h5 class="fw-bolder mb-3">Stay Connected</h5>
                        <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Blogs</a><a
                                class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span
                                    class="fab fa-facebook-square text-primary me-2 fs-8"></span><span
                                    class="text-body-secondary">Facebook</span></a><a class="mb-1 fw-semibold fs-9 d-flex" href="#!"><span
                                    class="fab fa-twitter-square text-info me-2 fs-8"></span><span
                                    class="text-body-secondary">Twitter</span></a></div>
                    </div>
                    <div class="col-6 col-md-auto">
                        <h5 class="fw-bolder mb-3">Customer Service</h5>
                        <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Help
                                Desk</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Support, 24/7</a><a
                                class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Community of SHOP</a></div>
                    </div>
                    <div class="col-6 col-md-auto">
                        <h5 class="fw-bolder mb-3">Payment Method</h5>
                        <div class="d-flex flex-column"><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Cash on
                                Delivery</a><a class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Online Payment</a><a
                                class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">PayPal</a><a
                                class="text-body-tertiary fw-semibold fs-9 mb-1" href="#!">Installment</a></div>
                    </div>
                </div>
            </div><!-- end of .container-->
        </section><!-- <section> close ============================-->
        <!-- ============================================-->

        <footer class="footer position-relative">
            <div class="row g-0 justify-content-between align-items-center h-100">
                <div class="col-12 col-sm-auto text-center">
                    <p class="mb-0 mt-2 mt-sm-0 text-body">Thank you for creating with SHOP<span
                            class="d-none d-sm-inline-block"></span><span class="d-none d-sm-inline-block mx-1">|</span><br
                            class="d-sm-none" />2024 &copy;<a class="mx-1" href="https://themewagon.com">Tiến Đạt</a></p>
                </div>
                <div class="col-12 col-sm-auto text-center">
                    <p class="mb-0 text-body-tertiary text-opacity-85">v1.0</p>
                </div>
            </div>
        </footer>
    </main><!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->

    <div class="offcanvas offcanvas-end settings-panel border-0" id="settings-offcanvas" tabindex="-1"
         aria-labelledby="settings-offcanvas">
        <div class="offcanvas-header align-items-start border-bottom flex-column border-translucent">
            <div class="pt-1 w-100 mb-6 d-flex justify-content-between align-items-start">
                <div>
                    <h5 class="mb-2 me-2 lh-sm"><span class="fas fa-palette me-2 fs-8"></span>Theme Customizer</h5>
                    <p class="mb-0 fs-9">Explore different styles according to your preferences</p>
                </div><button class="btn p-1 fw-bolder" type="button" data-bs-dismiss="offcanvas" aria-label="Close"><span
                        class="fas fa-times fs-8"> </span></button>
            </div><button class="btn btn-phoenix-secondary w-100" data-theme-control="reset"><span
                    class="fas fa-arrows-rotate me-2 fs-10"></span>Reset to default</button>
        </div>
        <div class="offcanvas-body scrollbar px-card" id="themeController">
            <div class="setting-panel-item mt-0">
                <h5 class="setting-panel-item-title">Color Scheme</h5>
                <div class="row gx-2">
                    <div class="col-4"><input class="btn-check" id="themeSwitcherLight" name="theme-color" type="radio"
                                              value="light" data-theme-control="phoenixTheme" /><label class="btn d-inline-block btn-navbar-style fs-9"
                                              for="themeSwitcherLight"> <span class="mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0"
                                                                                          src="./assets/img/generic/default-light.png" alt="" /></span><span
                                class="label-text">Light</span></label></div>
                    <div class="col-4"><input class="btn-check" id="themeSwitcherDark" name="theme-color" type="radio"
                                              value="dark" data-theme-control="phoenixTheme" /><label class="btn d-inline-block btn-navbar-style fs-9"
                                              for="themeSwitcherDark"> <span class="mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0"
                                                                                         src="./assets/img/generic/default-dark.png" alt="" /></span><span class="label-text">
                                Dark</span></label></div>
                    <div class="col-4"><input class="btn-check" id="themeSwitcherAuto" name="theme-color" type="radio"
                                              value="auto" data-theme-control="phoenixTheme" /><label class="btn d-inline-block btn-navbar-style fs-9"
                                              for="themeSwitcherAuto"> <span class="mb-2 rounded d-block"><img class="img-fluid img-prototype mb-0"
                                                                                         src="./assets/img/generic/auto.png" alt="" /></span><span class="label-text"> Auto</span></label>
                    </div>
                </div>
            </div>
            <div class="border border-translucent rounded-3 p-4 setting-panel-item bg-body-emphasis">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="setting-panel-item-title mb-1">RTL </h5>
                    <div class="form-check form-switch mb-0"><input class="form-check-input ms-auto" type="checkbox"
                                                                    data-theme-control="phoenixIsRTL" /></div>
                </div>
                <p class="mb-0 text-body-tertiary">Change text direction</p>
            </div>
            <div class="border border-translucent rounded-3 p-4 setting-panel-item bg-body-emphasis">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="setting-panel-item-title mb-1">Support Chat </h5>
                    <div class="form-check form-switch mb-0"><input class="form-check-input ms-auto" type="checkbox"
                                                                    data-theme-control="phoenixSupportChat" /></div>
                </div>
                <p class="mb-0 text-body-tertiary">Toggle support chat</p>
            </div>
            <div class="setting-panel-item">
                <h5 class="setting-panel-item-title">Navigation Type</h5>
                <div class="row gx-2">
                    <div class="col-6"><input class="btn-check" id="navbarPositionVertical" name="navigation-type" type="radio"
                                              value="vertical" data-theme-control="phoenixNavbarPosition" disabled="disabled" /><label
                                              class="btn d-inline-block btn-navbar-style fs-9" for="navbarPositionVertical"> <span
                                class="mb-2 rounded d-block"><img class="img-fluid img-prototype d-dark-none"
                                                              src="./assets/img/generic/default-light.png" alt="" /><img
                                                              class="img-fluid img-prototype d-light-none" src="./assets/img/generic/default-dark.png"
                                                              alt="" /></span><span class="label-text">Vertical</span></label></div>
                    <div class="col-6"><input class="btn-check" id="navbarPositionHorizontal" name="navigation-type" type="radio"
                                              value="horizontal" data-theme-control="phoenixNavbarPosition" disabled="disabled" /><label
                                              class="btn d-inline-block btn-navbar-style fs-9" for="navbarPositionHorizontal"> <span
                                class="mb-2 rounded d-block"><img class="img-fluid img-prototype d-dark-none"
                                                              src="./assets/img/generic/top-default.png" alt="" /><img class="img-fluid img-prototype d-light-none"
                                                              src="./assets/img/generic/top-default-dark.png" alt="" /></span><span class="label-text">
                                Horizontal</span></label></div>
                    <div class="col-6"><input class="btn-check" id="navbarPositionCombo" name="navigation-type" type="radio"
                                              value="combo" data-theme-control="phoenixNavbarPosition" disabled="disabled" /><label
                                              class="btn d-inline-block btn-navbar-style fs-9" for="navbarPositionCombo"> <span
                                class="mb-2 rounded d-block"><img class="img-fluid img-prototype d-dark-none"
                                                              src="./assets/img/generic/nav-combo-light.png" alt="" /><img
                                                              class="img-fluid img-prototype d-light-none" src="./assets/img/generic/nav-combo-dark.png"
                                                              alt="" /></span><span class="label-text"> Combo</span></label></div>
                    <div class="col-6"><input class="btn-check" id="navbarPositionTopDouble" name="navigation-type" type="radio"
                                              value="dual-nav" data-theme-control="phoenixNavbarPosition" disabled="disabled" /><label
                                              class="btn d-inline-block btn-navbar-style fs-9" for="navbarPositionTopDouble"> <span
                                class="mb-2 rounded d-block"><img class="img-fluid img-prototype d-dark-none"
                                                              src="./assets/img/generic/dual-light.png" alt="" /><img class="img-fluid img-prototype d-light-none"
                                                              src="./assets/img/generic/dual-dark.png" alt="" /></span><span class="label-text"> Dual
                                nav</span></label></div>
                </div>
                <p class="text-warning-dark font-medium"> <span
                        class="fa-solid fa-triangle-exclamation me-2 text-warning"></span>You can't update navigation type in this
                    page</p>
            </div>
            <div class="setting-panel-item">
                <h5 class="setting-panel-item-title">Vertical Navbar Appearance</h5>
                <div class="row gx-2">
                    <div class="col-6"><input class="btn-check" id="navbar-style-default" type="radio" name="config.name"
                                              value="default" data-theme-control="phoenixNavbarVerticalStyle" disabled="disabled" /><label
                                              class="btn d-block w-100 btn-navbar-style fs-9" for="navbar-style-default"> <img
                                class="img-fluid img-prototype d-dark-none" src="./assets/img/generic/default-light.png" alt="" /><img
                                class="img-fluid img-prototype d-light-none" src="./assets/img/generic/default-dark.png" alt="" /><span
                                class="label-text d-dark-none"> Default</span><span
                                class="label-text d-light-none">Default</span></label></div>
                    <div class="col-6"><input class="btn-check" id="navbar-style-dark" type="radio" name="config.name"
                                              value="darker" data-theme-control="phoenixNavbarVerticalStyle" disabled="disabled" /><label
                                              class="btn d-block w-100 btn-navbar-style fs-9" for="navbar-style-dark"> <img
                                class="img-fluid img-prototype d-dark-none" src="./assets/img/generic/vertical-darker.png" alt="" /><img
                                class="img-fluid img-prototype d-light-none" src="./assets/img/generic/vertical-lighter.png"
                                alt="" /><span class="label-text d-dark-none"> Darker</span><span
                                class="label-text d-light-none">Lighter</span></label></div>
                </div>
                <p class="text-warning-dark font-medium"> <span
                        class="fa-solid fa-triangle-exclamation me-2 text-warning"></span>You can't update vertical navbar
                    appearance in this page</p>
            </div>
            <div class="setting-panel-item">
                <h5 class="setting-panel-item-title">Horizontal Navbar Shape</h5>
                <div class="row gx-2">
                    <div class="col-6"><input class="btn-check" id="navbarShapeDefault" name="navbar-shape" type="radio"
                                              value="default" data-theme-control="phoenixNavbarTopShape" disabled="disabled" /><label
                                              class="btn d-inline-block btn-navbar-style fs-9" for="navbarShapeDefault"> <span
                                class="mb-2 rounded d-block"><img class="img-fluid img-prototype d-dark-none mb-0"
                                                              src="./assets/img/generic/top-default.png" alt="" /><img
                                                              class="img-fluid img-prototype d-light-none mb-0" src="./assets/img/generic/top-default-dark.png"
                                                              alt="" /></span><span class="label-text">Default</span></label></div>
                    <div class="col-6"><input class="btn-check" id="navbarShapeSlim" name="navbar-shape" type="radio" value="slim"
                                              data-theme-control="phoenixNavbarTopShape" disabled="disabled" /><label
                                              class="btn d-inline-block btn-navbar-style fs-9" for="navbarShapeSlim"> <span
                                class="mb-2 rounded d-block"><img class="img-fluid img-prototype d-dark-none mb-0"
                                                              src="./assets/img/generic/top-slim.png" alt="" /><img
                                                              class="img-fluid img-prototype d-light-none mb-0" src="./assets/img/generic/top-slim-dark.png"
                                                              alt="" /></span><span class="label-text"> Slim</span></label></div>
                </div>
                <p class="text-warning-dark font-medium"> <span
                        class="fa-solid fa-triangle-exclamation me-2 text-warning"></span>You can't update horizontal navbar shape
                    in this page</p>
            </div>
            <div class="setting-panel-item">
                <h5 class="setting-panel-item-title">Horizontal Navbar Appearance</h5>
                <div class="row gx-2">
                    <div class="col-6"><input class="btn-check" id="navbarTopDefault" name="navbar-top-style" type="radio"
                                              value="default" data-theme-control="phoenixNavbarTopStyle" disabled="disabled" /><label
                                              class="btn d-inline-block btn-navbar-style fs-9" for="navbarTopDefault"> <span
                                class="mb-2 rounded d-block"><img class="img-fluid img-prototype d-dark-none mb-0"
                                                              src="./assets/img/generic/top-default.png" alt="" /><img
                                                              class="img-fluid img-prototype d-light-none mb-0" src="./assets/img/generic/top-style-darker.png"
                                                              alt="" /></span><span class="label-text">Default</span></label></div>
                    <div class="col-6"><input class="btn-check" id="navbarTopDarker" name="navbar-top-style" type="radio"
                                              value="darker" data-theme-control="phoenixNavbarTopStyle" disabled="disabled" /><label
                                              class="btn d-inline-block btn-navbar-style fs-9" for="navbarTopDarker"> <span
                                class="mb-2 rounded d-block"><img class="img-fluid img-prototype d-dark-none mb-0"
                                                              src="./assets/img/generic/navbar-top-style-light.png" alt="" /><img
                                                              class="img-fluid img-prototype d-light-none mb-0" src="./assets/img/generic/top-style-lighter.png"
                                                              alt="" /></span><span class="label-text d-dark-none">Darker</span><span
                                class="label-text d-light-none">Lighter</span></label></div>
                </div>
                <p class="text-warning-dark font-medium"> <span
                        class="fa-solid fa-triangle-exclamation me-2 text-warning"></span>You can't update horizontal navbar
                    appearance in this page</p>
            </div><a class="bun btn-primary d-grid mb-3 text-white mt-5 btn btn-primary"
                     href="https://themes.getbootstrap.com/product/phoenix-admin-dashboard-webapp-template/" target="_blank">Purchase
                template</a>
        </div>
    </div>

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