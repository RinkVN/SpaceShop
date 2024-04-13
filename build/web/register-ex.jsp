<%-- 
    Document   : register
    Created on : Mar 5, 2024, 11:49:54 PM
    Author     : datla
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>Book Store - Register</title>
        <!-- loader-->
        <link href="css-ex/pace.min.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pace/1.2.4/pace.min.js" integrity="sha512-2cbsQGdowNDPcKuoBd2bCcsJky87Mv0LEtD/nunJUgk6MOYTgVMGihS/xCEghNf04DPhNiJ4DZw5BxDd1uyOdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!--favicon-->
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <!-- Bootstrap core CSS-->
        <link href="css-ex/bootstrap.min.css" rel="stylesheet"/>
        <!-- animate CSS-->
        <link href="css-ex/animate.css" rel="stylesheet" type="text/css"/>
        <!-- Icons CSS-->
        <link href="css-ex/icons.css" rel="stylesheet" type="text/css"/>
        <!-- Custom Style-->
        <link href="css-ex/app-style.css" rel="stylesheet"/>

    </head>

    <body class="bg-theme bg-theme1">

        <!-- start loader -->
        <div id="pageloader-overlay" class="visible incoming"><div class="loader-wrapper-outer"><div class="loader-wrapper-inner" ><div class="loader"></div></div></div></div>
        <!-- end loader -->

        <!-- Start wrapper-->
        <div id="wrapper">

            <div class="card card-authentication1 mx-auto my-4">
                <div class="card-body">
                    <div class="card-content p-2">
                        <div class="text-center">
                            <img src="img/logo-icon.png" alt="logo icon">
                        </div>
                        <div class="card-title text-uppercase text-center py-3">Sign Up</div>

                        <c:if test="${not empty failMess}">
                            <p class="text-center text-warning">${failMess}</p>
                            <c:remove var="failMess" scope="session"/>
                        </c:if>

                        <form action="register" method="post">
                            <div class="form-group">
                                <label for="exampleInputName" class="sr-only">Enter Your Name</label>
                                <div class="position-relative has-icon-right">
                                    <input type="text" id="exampleInputName" class="form-control input-shadow" placeholder="Enter Your Name"
                                           required="required"
                                           name="name"
                                           value="${name}">
                                    <div class="form-control-position">
                                        <i class="icon-user"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword" class="sr-only">Enter Your Phone</label>
                                <div class="position-relative has-icon-right">
                                    <input type="text" id="exampleInputPhone" class="form-control input-shadow password-toggle" placeholder="Enter Your Phone"
                                           required="required"   
                                           name="phno"
                                           minlength="10" 
                                           maxlength="14"
                                           value="${phno}">
                                    <div class="form-control-position">
                                        <i class="icon-phone"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmailId" class="sr-only">Email Address</label>
                                <div class="position-relative has-icon-right">
                                    <input type="email" id="exampleInputEmailId" class="form-control input-shadow" placeholder="Enter Your Email Address"
                                           required="required"
                                           name="email"
                                           pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                                           value="${email}">
                                    <div class="form-control-position">
                                        <i class="icon-envelope-open"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword" class="sr-only">Password</label>
                                <div class="position-relative has-icon-right">
                                    <input type="password" id="InputPassword" class="form-control input-shadow password-toggle" placeholder="Enter Your Password"
                                           required="required"
                                           name="password"
                                           value="${password}"
                                           >
                                    <div class="form-control-position">
                                        <i onclick="myFunction()" style="cursor: pointer" class="icon-lock"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword" class="sr-only">Re-enter Your Password</label>
                                <div class="position-relative has-icon-right">
                                    <input type="password" id="InputRepassword" class="form-control input-shadow password-toggle" placeholder="Re-enter Your Password"
                                           required="required"   
                                           name="repassword"
                                           >
                                    <div class="form-control-position">
                                        <i onclick="myFunction2()" style="cursor: pointer" class="icon-lock"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="icheck-material-white">
                                    <input type="checkbox" id="user-checkbox" checked="" name="check" required/>
                                    <label for="user-checkbox">I Agree With Terms & Conditions</label>
                                </div>
                            </div>

                            <button type="Submit" class="btn btn-light btn-block waves-effect waves-light">Sign Up</button>
                            <div class="text-center mt-3">Sign Up With</div>

                            <div class="form-row mt-4">
                                <div class="form-group mb-0 col-6">
                                    <button type="button" class="btn btn-light btn-block"><i class="fa fa-facebook-square"></i> Facebook</button>
                                </div>
                                <div class="form-group mb-0 col-6 text-right">
                                    <button type="button" class="btn btn-light btn-block"><i class="fa fa-twitter-square"></i> Twitter</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="card-footer text-center py-3">
                    <p class="text-warning mb-0"">Already have an account? <a href="login.jsp" style="text-decoration: underline;"> Sign In here</a></p>
                </div>
            </div>

            <!--Start Back To Top Button-->
            <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
            <!--End Back To Top Button-->

            <!--start color switcher-->
            <div class="right-sidebar">
                <div class="switcher-icon">
                    <i class="zmdi zmdi-settings zmdi-hc-spin"></i>
                </div>
                <div class="right-sidebar-content">

                    <p class="mb-0">Gaussion Texture</p>
                    <hr>

                    <ul class="switcher">
                        <li id="theme1"></li>
                        <li id="theme2"></li>
                        <li id="theme3"></li>
                        <li id="theme4"></li>
                        <li id="theme5"></li>
                        <li id="theme6"></li>
                    </ul>

                    <p class="mb-0">Gradient Background</p>
                    <hr>

                    <ul class="switcher">
                        <li id="theme7"></li>
                        <li id="theme8"></li>
                        <li id="theme9"></li>
                        <li id="theme10"></li>
                        <li id="theme11"></li>
                        <li id="theme12"></li>
                        <li id="theme13"></li>
                        <li id="theme14"></li>
                        <li id="theme15"></li>
                    </ul>

                </div>
            </div>
            <!--end color switcher-->

        </div><!--wrapper-->

        <!--Show Password-->
        <script>
            function myFunction() {
                var x = document.getElementById("InputPassword");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }

            function myFunction2() {
                var x = document.getElementById("InputRepassword");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>

        <!-- Bootstrap core JavaScript-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" integrity="sha512-+NqPlbbtM1QqiK8ZAo4Yrj2c4lNQoGv8P79DPtKzj++l5jnN39rHA/xsqn8zE9l0uSoxaCdrOgFs6yjyfbBxSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <!-- sidebar-menu js -->
        <script src="js-ex/sidebar-menu.js"></script>
        <!-- Custom scripts -->
        <script src="js-ex/app-script.js"></script>

    </body>
</html>
