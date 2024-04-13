<%-- 
    Document   : reset-password
    Created on : Mar 6, 2024, 12:12:11 AM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>Dashtreme - Multipurpose Bootstrap4 Admin Template</title>
        <!-- loader-->
        <link href="css-ex/pace.min.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pace/1.2.4/pace.min.js" integrity="sha512-2cbsQGdowNDPcKuoBd2bCcsJky87Mv0LEtD/nunJUgk6MOYTgVMGihS/xCEghNf04DPhNiJ4DZw5BxDd1uyOdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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

        <!-- Start wrapper-->
        <div id="wrapper">

            <div class="height-100v d-flex align-items-center justify-content-center">
                <div class="card card-authentication1 mb-0">
                    <div class="card-body">
                        <div class="card-content p-2">
                            <div class="card-title text-uppercase pb-2">Reset Password</div>
                            <p class="pb-2">Please enter your email address. You will receive a link to create a new password via email.</p>
                            <form>
                                <div class="form-group">
                                    <label for="exampleInputEmailAddress" class="">Email Address</label>
                                    <div class="position-relative has-icon-right">
                                        <input type="text" id="exampleInputEmailAddress" class="form-control input-shadow" placeholder="Email Address">
                                        <div class="form-control-position">
                                            <i class="icon-envelope-open"></i>
                                        </div>
                                    </div>
                                </div>

                                <button type="button" class="btn btn-light btn-block mt-3">Reset Password</button>
                            </form>
                        </div>
                    </div>
                    <div class="card-footer text-center py-3">
                        <p class="text-warning mb-0">Return to the <a href="login.jsp"> Sign In</a></p>
                    </div>
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
