<%-- 
    Document   : login
    Created on : Apr 4, 2024, 11:09:59 PM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="css/Login and register CSS/style.css">
        <title>Login |</title>
    </head>

    
    <body>
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
            <div class="row border rounded-5 p-3 bg-white shadow box-area">
                <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"
                     style="background: #1087be;">
                    <div class="featured-image mb-3">
                        <img src="css/Login and register CSS/images/1.png" class="img-fluid" style="width: 250px;">
                    </div>
                    <p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">
                        Space Shop</p>
                    <small class="text-white text-wrap text-center"
                           style="width: 17rem;font-family: 'Courier New', Courier, monospace;">Thỏa sức mua sắm trong
                        </br>không gian của bạn.</small>
                </div>
                <div class="col-md-6 right-box">
                    <div class="row align-items-center">
                        <div class="header-text mb-4">
                            <h2>Đăng Nhập</h2>
                            <p>We are very happy to see you here.</p>

                            <c:if test="${not empty failMess}">
                                <h5 class="text-warning">${failMess}</h5>
                                <c:remove var="failMess" scope="session"/>
                            </c:if>

                        </div>
                        <form action="login" method="post">
                            <div class="input-group mb-4">
                                <input type="text" class="form-control form-control-lg bg-light fs-6"
                                       placeholder="Email Hoặc Số Điện Thoại"
                                       value="${email}"
                                       name="email">
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" class="form-control form-control-lg bg-light fs-6"
                                       placeholder="Mật khẩu"
                                       name="password">
                            </div>
                            <div class="input-group mb-4 d-flex justify-content-between">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="formCheck">
                                    <label for="formCheck" class="form-check-label text-secondary">
                                        <small>Ghi nhớ thông tin đăng nhập</small>
                                    </label>
                                </div>
                                <div class="forgot">
                                    <small><a href="#">Quên mật khẩu?</a></small>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <button type="submit" class="btn btn-lg btn-primary w-100 fs-6">Đăng Nhập</button>
                            </div>
                            <div class="input-group mb-3">
                                <button class="btn btn-lg btn-light w-100 fs-6"><img src="css/Login and register CSS/images/google.png" style="width:20px"
                                                                                     class="me-2"><small>Đăng nhập với Google</small></button>
                            </div>
                        </form>
                        <div class="row">
                            <small>Bạn chưa có tài khoản? <a href="register.jsp">Đăng ký ngay</a></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>