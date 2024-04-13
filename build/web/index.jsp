<%-- 
    Document   : index
    Created on : Apr 6, 2024, 11:32:52 AM
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
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shop</title>
        <link rel="stylesheet" href="style.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <!--
        - favicon
        -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
        
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


    </head>

    <body>


        <div id="page" class="site page-home">

            <aside class="site-off desktop-hide">
                <div class="off-canvas">
                    <div class="canvas-head flexitem">
                        <div class="logo">
                            <a href="/">
                                <span class="circle"></span>Shop
                            </a>
                        </div>
                        <a href="#" class="t-close flexcenter"><i class="ri-close-line"></i></a>
                    </div>
                    <div class="departments"></div>
                    <nav></nav>
                    <div class="thetop-nav"></div>
                </div>
            </aside>

            <%@include file="header.jsp" %>

            <main>

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


                <div class="slider">
                    <div class="container">
                        <div class="wrapper">
                            <div class="myslider swiper">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <a href="./product-detail/v1.14.0/product-details.html">
                                                    <img src="assets/slider/01_HD_WEB_BANNER.jpg" alt="">
                                                </a>
                                            </div>
                                            <!-- <div class="text-content flexcol">
                                                <h4>Thời Trang Nữ</h4>
                                                <h2><span>Hãy đến và mua ngay!</span><br><span>HOT SALE 60%</span></h2>
                                                <a href="./product-detail/v1.14.0/product-details.html" class="primary-button">Mua ngay</a>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <img src="assets/slider/1010BANNER.jpg" alt="">
                                            </div>
                                            <!-- <div class="text-content flexcol">
                                                <h4>Thời trang</h4>
                                                <h2><span>Phù hợp với tủ đồ của bạn</span><br><span>mẫu mới nhất</span>
                                                </h2>
                                                <a href="./product-detail/v1.14.0/product-details.html" class="primary-button">Mua ngay</a>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <img src="assets/slider/BANNER-SUMMER-SALE-50-OFF.jpg" alt="">
                                            </div>
                                            <!-- <div class="text-content flexcol">
                                                <h4>Ưu đãi ngập tràn</h4>
                                                <h2><span>Phù hợp với mọi kiểu dáng</span><br><span>Mua ngay để nhận
                                                        ưu đãi</span></h2>
                                                <a href="./product-detail/v1.14.0/product-details.html" class="primary-button">Mua ngay</a>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <img src="assets/slider/PODIUM_purple_HD_BANNER.jpg" alt="">
                                            </div>
                                            <!-- <div class="text-content flexcol">
                                                <h4>Thiết kế mới</h4>
                                                <h2><span>Hợp thời đại</span><br><span>Let's Get It</span></h2>
                                                <a href="./product-detail/v1.14.0/product-details.html" class="primary-button">Mua ngay</a>
                                            </div> -->
                                        </div>
                                    </div>
                                    <div class="swiper-slide">
                                        <div class="item">
                                            <div class="image object-cover">
                                                <img src="assets/slider/PODIUM_purple_HD_BANNER.jpg" alt="">
                                            </div>
                                            <!-- <div class="text-content flexcol">
                                                <h4>Thiết kế mới</h4>
                                                <h2><span>Hợp thời đại</span><br><span>Let's Get It</span></h2>
                                                <a href="./product-detail/v1.14.0/product-details.html" class="primary-button">Mua ngay</a>
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Slider -->


                <div class="mobile-categories">
                    <div class="container">
                        <div class="categories-grid">
                            <a href="#">
                                <div class="categories-card">
                                    <div class="categories-img">
                                        <img src="assets/categories/dress.png" alt="">
                                    </div>
                                    <div class="categories-title">
                                        <p>Thời Trang Nữ</p>
                                    </div>
                                </div>
                            </a>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/ao nam.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>Thời Trang Nam</p>
                                </div>
                            </div>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/kinh.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>Phụ Kiện Thời Trang</p>
                                </div>
                            </div>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/son.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>Làm đẹp</p>
                                </div>
                            </div>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/noi com.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>Đồ gia dụng điện tử</p>
                                </div>
                            </div>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/cui.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>Mẹ và bé</p>
                                </div>
                            </div>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/do choi.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>Đồ chơi trẻ em</p>
                                </div>
                            </div>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/ta.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>chăm sóc sức khỏe</p>
                                </div>
                            </div>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/chao.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>Đồ làm bếp</p>
                                </div>
                            </div>
                            <div class="categories-card">
                                <div class="categories-img">
                                    <img src="assets/categories/tai.png" alt="">
                                </div>
                                <div class="categories-title">
                                    <p>Phụ kiện công nghệ</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="flash-sale">
                    <div class="container">

                        <div class="flash-sale-time">
                            <div class="sale-time">
                                <div class="sale-img">
                                </div>
                                <div class="countdown">

                                    <div class="container-segment">
                                        <div class="segment">
                                            <div class="flip-card" data-hours-tens>
                                                <div class="top">2</div>
                                                <div class="bottom">2</div>
                                            </div>
                                            <div class="flip-card" data-hours-ones>
                                                <div class="top">4</div>
                                                <div class="bottom">4</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-segment">
                                        <div class="segment">
                                            <div class="flip-card" data-minutes-tens>
                                                <div class="top">0</div>
                                                <div class="bottom">0</div>
                                            </div>
                                            <div class="flip-card" data-minutes-ones>
                                                <div class="top">0</div>
                                                <div class="bottom">0</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-segment">
                                        <div class="segment">
                                            <div class="flip-card" data-seconds-tens>
                                                <div class="top">0</div>
                                                <div class="bottom">0</div>
                                            </div>
                                            <div class="flip-card" data-seconds-ones>
                                                <div class="top">0</div>
                                                <div class="bottom">0</div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <a class="view-all" href="page-category.html">Xem tất cả ></a>
                        </div>

                        <div class="image-carousel ">
                            <div class="product-list has-scrollbar" style="overflow: auto hidden;">
                                <%
                                    ProductDAOimpl dao = new ProductDAOimpl(DBContext.getConn());
                                    List<ProductInfo> list = dao.getAllProduct();
                                    for (ProductInfo p : list) {
                                %>
                                <div class="showcase gradient-border">
                                    <div class="showcase-banner">

                                        <a href="./product-detail/v1.14.0/product-details.jsp?pid=<%= p.getProductID() %>">
                                            <img src="<%= p.getProductPhoto() %>"
                                                 alt="<%= p.getProductName() %>" class="product-img default"
                                                 style="cursor: pointer;">
                                        </a>
                                        <p class="showcase-badge">15%</p>

                                        <div class="showcase-actions">

                                            <button class="btn-action active">
                                                <ion-icon name="heart-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="eye-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="repeat-outline"></ion-icon>
                                            </button>

                                            <button class="btn-action">
                                                <ion-icon name="bag-add-outline"></ion-icon>
                                            </button>

                                        </div>

                                    </div>

                                    <div class="showcase-content">

                                        <a href="#" class="showcase-category"><%= p.getNewCategory() %></a>

                                        <a href="./product-detail/v1.14.0/product-details.jsp?pid=<%= p.getProductID() %>">
                                            <h3 class="showcase-title">
                                                <a href="product-details.jsp?pid=<%= p.getProductID() %>"><%= p.getProductName() %>
                                                </a>
                                            </h3>
                                        </a>

                                        <div class="price-box">
                                            <p class="price"><%= p.getPrice() %>₫</p>
                                            <del>500.000₫</del>
                                        </div>

                                    </div>

                                </div>
                                <%
                                    }
                                %>

                            </div>
                        </div>

                    </div>
                </div>
                <!-- Brands -->
                <container>
                    <div class="banner-sale">
                        <img src="img/banner/3.jpg" alt="alt" style="border-radius: 10px" />
                    </div>
                </container>

                <div class="popular-product flash-sale">
                    <div class="container">

                        <div class="flash-sale-time">
                            <div class="sale-time">
                                <div class="viral_product_text">
                                    <h2>Sản phẩm nổi bật</h3>
                                </div>
                            </div>
                            <a class="view-all" href="page-category.html">Xem tất cả ></a>
                        </div>

                        <div class="image-carousel ">
                            <div class="has-scrollbar">
                                <div class="product-list ">
                                    <div class="showcase">
                                        <div class="showcase-banner">

                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/jacket-3.jpg"
                                                     alt="Mens Winter Leathers Jackets" class="product-img default"
                                                     style="cursor: pointer;">
                                            </a>
                                            <p class="showcase-badge">15%</p>

                                            <div class="showcase-actions">

                                                <button class="btn-action active">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>

                                            </div>

                                        </div>

                                        <div class="showcase-content">

                                            <a href="#" class="showcase-category">jacket</a>

                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <h3 class="showcase-title">Mens Winter Leathers Jackets</h3>
                                            </a>

                                            <div class="price-box">
                                                <p class="price">$48.00</p>
                                                <del>$75.00</del>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="showcase">
                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/jacket-3.jpg" style="cursor: pointer;"
                                                     alt="Mens Winter Leathers Jackets" class="product-img default">
                                            </a>

                                            <p class="showcase-badge">15%</p>

                                            <div class="showcase-actions">

                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>

                                            </div>

                                        </div>

                                        <div class="showcase-content">

                                            <a href="" class="showcase-category">jacket</a>

                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <h3 class="showcase-title">Mens Winter Leathers Jackets</h3>
                                            </a>

                                            <div class="price-box">
                                                <p class="price">$48.00</p>
                                                <del>$75.00</del>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="showcase">
                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/jacket-3.jpg" style="cursor: pointer;"
                                                     alt="Mens Winter Leathers Jackets" class="product-img default">
                                            </a>
                                            <p class="showcase-badge">15%</p>

                                            <div class="showcase-actions">

                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>

                                            </div>

                                        </div>

                                        <div class="showcase-content">

                                            <a href="#" class="showcase-category">jacket</a>

                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <h3 class="showcase-title">Mens Winter Leathers Jackets</h3>
                                            </a>

                                            <div class="price-box">
                                                <p class="price">$48.00</p>
                                                <del>$75.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/party-wear-1.jpg"
                                                     style="cursor: pointer;" alt="Womens Party Wear Shoes"
                                                     class="product-img default" width="300">
                                            </a>

                                            <p class="showcase-badge angle black">sale</p>

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">party wear</a>

                                            <h3>
                                                <a href="./product-detail/v1.14.0/product-details.html"
                                                   class="showcase-title">Womens Party Wear
                                                    Shoes</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$25.00</p>
                                                <del>$30.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/jacket-1.jpg" style="cursor: pointer;"
                                                     alt="Mens Winter Leathers Jackets" class="product-img default"
                                                     width="300">
                                            </a>
                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">jacket</a>

                                            <h3>
                                                <a href="./product-detail/v1.14.0/product-details.html"
                                                   class="showcase-title">Mens Winter Leathers
                                                    Jackets</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$32.00</p>
                                                <del>$45.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/products/sports-2.jpg"
                                                 alt="Trekking & Running Shoes - black" class="product-img default"
                                                 width="300">
                                            <img src="./assets/images/products/sports-4.jpg"
                                                 alt="Trekking & Running Shoes - black" class="product-img hover"
                                                 width="300">

                                            <p class="showcase-badge angle black">sale</p>

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">sports</a>

                                            <h3>
                                                <a href="#" class="showcase-title">Trekking & Running Shoes -
                                                    black</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$58.00</p>
                                                <del>$64.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/products/shoe-1.jpg"
                                                 alt="Men's Leather Formal Wear shoes" class="product-img default"
                                                 width="300">
                                            <img src="./assets/images/products/shoe-1_1.jpg"
                                                 alt="Men's Leather Formal Wear shoes" class="product-img hover" width="300">

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">formal</a>

                                            <h3>
                                                <a href="#" class="showcase-title">Men's Leather Formal Wear
                                                    shoes</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$50.00</p>
                                                <del>$65.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/products/shorts-1.jpg"
                                                 alt="Better Basics French Terry Sweatshorts" class="product-img default"
                                                 width="300">
                                            <img src="./assets/images/products/shorts-2.jpg"
                                                 alt="Better Basics French Terry Sweatshorts" class="product-img hover"
                                                 width="300">

                                            <p class="showcase-badge angle black">sale</p>

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">shorts</a>

                                            <h3>
                                                <a href="#" class="showcase-title">Better Basics French Terry
                                                    Sweatshorts</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$78.00</p>
                                                <del>$85.00</del>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                                <div class="product-list ">
                                    <div class="showcase">
                                        <div class="showcase-banner">

                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/jacket-3.jpg"
                                                     alt="Mens Winter Leathers Jackets" class="product-img default"
                                                     style="cursor: pointer;">
                                            </a>
                                            <p class="showcase-badge">15%</p>

                                            <div class="showcase-actions">

                                                <button class="btn-action active">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>

                                            </div>

                                        </div>

                                        <div class="showcase-content">

                                            <a href="#" class="showcase-category">jacket</a>

                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <h3 class="showcase-title">Mens Winter Leathers Jackets</h3>
                                            </a>

                                            <div class="price-box">
                                                <p class="price">$48.00</p>
                                                <del>$75.00</del>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="showcase">
                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/jacket-3.jpg" style="cursor: pointer;"
                                                     alt="Mens Winter Leathers Jackets" class="product-img default">
                                            </a>

                                            <p class="showcase-badge">15%</p>

                                            <div class="showcase-actions">

                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>

                                            </div>

                                        </div>

                                        <div class="showcase-content">

                                            <a href="" class="showcase-category">jacket</a>

                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <h3 class="showcase-title">Mens Winter Leathers Jackets</h3>
                                            </a>

                                            <div class="price-box">
                                                <p class="price">$48.00</p>
                                                <del>$75.00</del>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="showcase">
                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/jacket-3.jpg" style="cursor: pointer;"
                                                     alt="Mens Winter Leathers Jackets" class="product-img default">
                                            </a>
                                            <p class="showcase-badge">15%</p>

                                            <div class="showcase-actions">

                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>

                                            </div>

                                        </div>

                                        <div class="showcase-content">

                                            <a href="#" class="showcase-category">jacket</a>

                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <h3 class="showcase-title">Mens Winter Leathers Jackets</h3>
                                            </a>

                                            <div class="price-box">
                                                <p class="price">$48.00</p>
                                                <del>$75.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/party-wear-1.jpg"
                                                     style="cursor: pointer;" alt="Womens Party Wear Shoes"
                                                     class="product-img default" width="300">
                                            </a>

                                            <p class="showcase-badge angle black">sale</p>

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">party wear</a>

                                            <h3>
                                                <a href="./product-detail/v1.14.0/product-details.html"
                                                   class="showcase-title">Womens Party Wear
                                                    Shoes</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$25.00</p>
                                                <del>$30.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.html">
                                                <img src="./assets/images/products/jacket-1.jpg" style="cursor: pointer;"
                                                     alt="Mens Winter Leathers Jackets" class="product-img default"
                                                     width="300">
                                            </a>
                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">jacket</a>

                                            <h3>
                                                <a href="./product-detail/v1.14.0/product-details.html"
                                                   class="showcase-title">Mens Winter Leathers
                                                    Jackets</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$32.00</p>
                                                <del>$45.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/products/sports-2.jpg"
                                                 alt="Trekking & Running Shoes - black" class="product-img default"
                                                 width="300">
                                            <img src="./assets/images/products/sports-4.jpg"
                                                 alt="Trekking & Running Shoes - black" class="product-img hover"
                                                 width="300">

                                            <p class="showcase-badge angle black">sale</p>

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">sports</a>

                                            <h3>
                                                <a href="#" class="showcase-title">Trekking & Running Shoes -
                                                    black</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$58.00</p>
                                                <del>$64.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/products/shoe-1.jpg"
                                                 alt="Men's Leather Formal Wear shoes" class="product-img default"
                                                 width="300">
                                            <img src="./assets/images/products/shoe-1_1.jpg"
                                                 alt="Men's Leather Formal Wear shoes" class="product-img hover" width="300">

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">formal</a>

                                            <h3>
                                                <a href="#" class="showcase-title">Men's Leather Formal Wear
                                                    shoes</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$50.00</p>
                                                <del>$65.00</del>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="showcase">

                                        <div class="showcase-banner">
                                            <img src="./assets/images/products/shorts-1.jpg"
                                                 alt="Better Basics French Terry Sweatshorts" class="product-img default"
                                                 width="300">
                                            <img src="./assets/images/products/shorts-2.jpg"
                                                 alt="Better Basics French Terry Sweatshorts" class="product-img hover"
                                                 width="300">

                                            <p class="showcase-badge angle black">sale</p>

                                            <div class="showcase-actions">
                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>
                                            </div>
                                        </div>

                                        <div class="showcase-content">
                                            <a href="#" class="showcase-category">shorts</a>

                                            <h3>
                                                <a href="#" class="showcase-title">Better Basics French Terry
                                                    Sweatshorts</a>
                                            </h3>

                                            <div class="price-box">
                                                <p class="price">$78.00</p>
                                                <del>$85.00</del>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="image-carousel">
                            <div class="image-carousel__item-wrapper">
                                <ul class="image-carousel__item-list"
                                    style="width: 266.667%; transform: translate(0px, 0px);">
                                    <li class="image-carousel__item" style="padding: 0px; width: 16.6667%;">

                                    </li>
                                </ul>

                            </div>

                        </div>
                    </div>
                </div>

                <container>
                    <div class="banner-sale">
                        <img src="img/banner/1.jpg" alt="alt" style="border-radius: 10px"/>
                    </div>
                </container>

                <div class="features">
                    <div class="container">
                        <div class="wrapper">
                            <div class="column">
                                <div class="sectop flexitem">
                                    <h2>Sản phẩm</h2>
                                    <div class="second-links">
                                        <a href="page-category.html" class="view-all">Xem tất cả
                                            <i class="ri-arrow-right-line"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="product-grid">
                                    <%
                                        ProductDAOimpl dao2 = new ProductDAOimpl(DBContext.getConn());
                                        List<ProductInfo> list2 = dao2.getAllProduct();
                                        for (ProductInfo p : list2) {
                                    %>
                                    <div class="showcase">
                                        <div class="showcase-banner">
                                            <a href="./product-detail/v1.14.0/product-details.jsp?pid=<%= p.getProductID() %>">
                                                <img src="<%= p.getProductPhoto() %>"
                                                     alt="<%= p.getProductName() %>" class="product-img default"
                                                     style="cursor: pointer;">
                                            </a>
                                            <p class="showcase-badge">15%</p>

                                            <div class="showcase-actions">

                                                <button class="btn-action">
                                                    <ion-icon name="heart-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="eye-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="repeat-outline"></ion-icon>
                                                </button>

                                                <button class="btn-action">
                                                    <ion-icon name="bag-add-outline"></ion-icon>
                                                </button>

                                            </div>

                                        </div>

                                        <div class="showcase-content">

                                            <a href="#" class="showcase-category"><%= p.getNewCategory() %></a>

                                            <a href="./product-detail/v1.14.0/product-details.jsp?pid=<%= p.getProductID() %>">
                                                <h3 class="showcase-title">
                                                    <a href="product-details.jsp?pid=<%= p.getProductID() %>"><%= p.getProductName() %>
                                                    </a>
                                                </h3>
                                            </a>

                                            <div class="showcase-rating">
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                                <ion-icon name="star-outline"></ion-icon>
                                            </div>

                                            <div class="price-box">
                                                <p class="price"><%= p.getPrice() %>₫</p>
                                                <del>500.000₫</del>
                                            </div>

                                        </div>

                                    </div>
                                    <%
                                                   }
                                    %>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Features Products -->

                <div class="view-more-btn">
                    <p>
                        <a href="#" class="primary-button">Xem Thêm
                        </a>
                    </p>
                </div>
                <!-- Banners -->


            </main>
            <!-- main-->
            <footer>
                <div class="newsletter">
                    <div class="container">
                        <div class="wrapper">
                            <div class="box">
                                <div class="content">
                                    <h3>Tham Gia Cùng Chúng Tôi</h3>
                                    <p>Nhận thông tin cập nhật qua email về sản phẩm mới nhất của chúng tôi và
                                        <strong>các ưu đãi đặc biệt</strong>
                                    </p>
                                </div>
                                <form action="" class="search">
                                    <span class="icon-large"><i class="ri-mail-line"></i></span>
                                    <input type="mail" placeholder="Địa chỉ Email của bạn" required>
                                    <button type="submit">Đăng Ký</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- News Letter -->

                <div class="widgets">
                    <div class="container">
                        <div class="wrapper">
                            <div class="flexwrap">
                                <div class="row">
                                    <div class="item mini-links">
                                        <h4>Help & Contact</h4>
                                        <ul class="flexcol">
                                            <li><a href="#">Your Account</a></li>
                                            <li><a href="#">You Orders</a></li>
                                            <li><a href="#">Shipping Rates</a></li>
                                            <li><a href="#">Returns</a></li>
                                            <li><a href="#">Assistant</a></li>
                                            <li><a href="#">Help</a></li>
                                            <li><a href="#">Contact</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="item mini-links">
                                        <h4>Product Categories</h4>
                                        <ul class="flexcol">
                                            <li><a href="#">Beauty</a></li>
                                            <li><a href="#">Electronic</a></li>
                                            <li><a href="#">Women's Fashion</a></li>
                                            <li><a href="#">Men's Fashion</a></li>
                                            <li><a href="#">Girl's Fashion</a></li>
                                            <li><a href="#">Boy's Fashion</a></li>
                                            <li><a href="#">Health & Household</a></li>
                                            <li><a href="#">Home & Kitchen</a></li>
                                            <li><a href="#">Pet Supplies</a></li>
                                            <li><a href="#">Sports</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="item mini-links">
                                        <h4>Payment Info</h4>
                                        <ul class="flexcol">
                                            <li><a href="#">Bussiness Card</a></li>
                                            <li><a href="#">Shop with Points</a></li>
                                            <li><a href="#">Reload Your Balance</a></li>
                                            <li><a href="#">Paypal</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="item mini-links">
                                        <h4>About Us</h4>
                                        <ul class="flexcol">
                                            <li><a href="#">Company Info</a></li>
                                            <li><a href="#">News</a></li>
                                            <li><a href="#">Investors</a></li>
                                            <li><a href="#">Careers</a></li>
                                            <li><a href="#">Policies</a></li>
                                            <li><a href="#">Customer Review</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Widgets -->

                <div class="footer-info">
                    <div class="container">
                        <div class="wrapper">
                            <div class="flexcol">
                                <div class="logo">
                                    <!-- <a href=""><span class="circle"></span>.Shop</a> -->
                                </div>
                                <div class="socials">
                                    <ul class="flexitem">
                                        <li><a href="https://www.facebook.com/" target="_blank"><i
                                                    class="ri-facebook-circle-fill"></i></a></li>
                                        <li><a href="https://www.facebook.com/messages/" target="_blank"><i
                                                    class="ri-messenger-fill"></i></a></li>
                                        <li><a href="https://www.instagram.com/" target="_blank"><i
                                                    class="ri-instagram-line"></i></a></li>
                                        <li><a href="https://www.tiktok.com/" target="_blank"><i
                                                    class="ri-tiktok-fill"></i></a></li>
                                        <li><a href="https://www.youtube.com/" target="_blank"><i
                                                    class="ri-youtube-line"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <p class="mini-text">@copyright 2024 © Tiến Đạt All right reserved</p>
                        </div>
                    </div>
                </div>

            </footer>
            <!-- footer-->

            <div class="menu-bottom desktop-hide">
                <div class="container">
                    <div class="wrapper">
                        <nav>
                            <ul class="flexitem">
                                <li>
                                    <a href="#">
                                        <i class="ri-bar-chart-line"></i>
                                        <span>Trending</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <i class="ri-shopping-cart-2-fill"></i></i>
                                        <span>Wishlist</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#0" class="t-search">
                                        <i class="ri-search-line"></i>
                                        <span>Search</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#0">
                                        <i class="ri-shopping-cart-line"></i>
                                        <span>Cart</span>
                                        <div class="fly-item">
                                            <span class="item-number">0</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="ri-user-6-line"></i>
                                        <span>Account</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Menu Bottom -->

            <div class="search-bottom desktop-hide">
                <div class="container">
                    <div class="wrapper">

                        <form action="" class="search">
                            <a href="#" class="t-close search-close flexcenter"><i class="ri-close-line"></i></a>
                            <span class="icon-large"><i class="ri-search-line"></i></span>
                            <input type="search" placeholder="Search everything here" required>
                            <button type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Search Button -->


            <div class="backtotop">
                <a href="#" class="flexcol">
                    <i class="ri-arrow-up-line"></i>
                    <span>Top</span>
                </a>
            </div>

            <div class="overlay"></div>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
        <script src="js/script.js"></script>
        <script src="js/countdown.js"></script>


        <!--
        - ionicon link
        -->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>

// slider
            const swiper = new Swiper('.swiper', {
                loop: true,
                pagination: {
                    el: '.swiper-pagination',
                },

                autoplay: {
                    delay: 3000,
                    pauseOnMouseEnter: true,
                    disableOnInteraction: false
                },
            });

        </script>
    </body>

</html>