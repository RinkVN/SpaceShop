<%-- 
    Document   : user-profile
    Created on : Mar 20, 2024, 6:11:27 AM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.DBContext" %>
<%@page import="controller.*" %>
<%@page import="model.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>

        <!-- GOOGLE FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet"/>
        <!-- BOXICONS -->
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/js/bootstrap/bootstrap.min.js" />
        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-mega-menu/dist/hs-mega-menu.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link rel="preload" href="https://d24ouiz0dt1p4y.cloudfront.net/assets/css/theme.css" data-hs-appearance="default" as="style" />  
        <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />

        <link rel="stylesheet" href="admin/css/theme.min.css" />

        <link rel="stylesheet" href="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/tom-select/dist/css/tom-select.bootstrap5.css" />
    </head>

</head>
<body>

    <main id="content" role="main" class="main">
        <!-- Content -->
        <div class="content container-fluid">
            <div class="row justify-content-lg-center">
                <div class="col-lg-10">
                    <!-- Profile Cover -->
                    <div class="profile-cover">
                        <div class="profile-cover-img-wrapper">
                            <img id="profileCoverImg" class="profile-cover-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/1920x400/img2.jpg" alt="Image Description">

                            <!-- Custom File Cover -->
                            <div class="profile-cover-content profile-cover-uploader p-3">
                                <input type="file" class="js-file-attach profile-cover-uploader-input" id="profileCoverUplaoder" data-hs-file-attach-options='{
                                       "textTarget": "#profileCoverImg",
                                       "mode": "image",
                                       "targetAttr": "src",
                                       "allowTypes": [".png", ".jpeg", ".jpg"]
                                       }'>
                                <label class="profile-cover-uploader-label btn btn-sm btn-white" for="profileCoverUplaoder">
                                    <i class="bi-camera-fill"></i>
                                    <span class="d-none d-sm-inline-block ms-1">Upload header</span>
                                </label>
                            </div>
                            <!-- End Custom File Cover -->
                        </div>
                    </div>
                    <!-- End Profile Cover -->

                    <!-- Profile Header -->
                    <div class="text-center mb-5">
                        <!-- Avatar -->
                        <label class="avatar avatar-xxl avatar-circle avatar-uploader profile-cover-avatar" for="editAvatarUploaderModal">
                            <img id="editAvatarImgModal" class="avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img6.jpg" alt="Image Description">

                            <input type="file" class="js-file-attach avatar-uploader-input" id="editAvatarUploaderModal" data-hs-file-attach-options='{
                                   "textTarget": "#editAvatarImgModal",
                                   "mode": "image",
                                   "targetAttr": "src",
                                   "allowTypes": [".png", ".jpeg", ".jpg"]
                                   }'>

                            <span class="avatar-uploader-trigger">
                                <i class="bi-pencil-fill avatar-uploader-icon shadow-sm"></i>
                            </span>
                        </label>
                        <!-- End Avatar -->

                        <h1 class="page-header-title">${userobj.name} <i class="bi-patch-check-fill fs-2 text-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Top endorsed"></i></h1>

                        <!-- List -->
                        <ul class="list-inline list-px-2">
                            <li class="list-inline-item">
                                <i class="bi-building me-1"></i>
                                <span>Pixeel Ltd.</span>
                            </li>

                            <li class="list-inline-item">
                                <i class="bi-geo-alt me-1"></i>
                                <a href="#">London,</a>
                                <a href="#">UK</a>
                            </li>

                            <li class="list-inline-item">
                                <i class="bi-calendar-week me-1"></i>
                                <span>Joined March 2013</span>
                            </li>
                        </ul>
                        <!-- End List -->
                    </div>
                    <!-- End Profile Header -->

                    <!-- Nav -->
                    <div class="js-nav-scroller hs-nav-scroller-horizontal mb-5">
                        <span class="hs-nav-scroller-arrow-prev" style="display: none;">
                            <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                                <i class="bi-chevron-left"></i>
                            </a>
                        </span>

                        <span class="hs-nav-scroller-arrow-next" style="display: none;">
                            <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                                <i class="bi-chevron-right"></i>
                            </a>
                        </span>

                        <ul class="nav nav-tabs align-items-center">
                            <li class="nav-item">
                                <a class="nav-link active disabled" href="#">Profile</a>
                            </li>
                            

                            <li class="nav-item ms-auto">
                                <div class="d-flex gap-2">
                                    <a class="btn btn-white btn-sm" href="account-settings.jsp">
                                        <i class="bi-person-plus-fill me-1"></i> Edit profile
                                    </a>

                                    <a class="btn btn-white btn-icon btn-sm" href="#">
                                        <i class="bi-list-ul me-1"></i>
                                    </a>

                                    <!-- Dropdown -->
                                    <div class="dropdown nav-scroller-dropdown">
                                        <button type="button" class="btn btn-white btn-icon btn-sm" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="bi-three-dots-vertical"></i>
                                        </button>

                                        <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="profileDropdown">
                                            <span class="dropdown-header">Settings</span>

                                            <a class="dropdown-item" href="#">
                                                <i class="bi-share-fill dropdown-item-icon"></i> Share profile
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-slash-circle dropdown-item-icon"></i> Block page and profile
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-info-circle dropdown-item-icon"></i> Suggest edits
                                            </a>

                                            <div class="dropdown-divider"></div>

                                            <span class="dropdown-header">Feedback</span>

                                            <a class="dropdown-item" href="#">
                                                <i class="bi-flag dropdown-item-icon"></i> Report
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End Dropdown -->
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- End Nav -->

                    <div class="row">
                        <div class="col-lg-4">
                            <!-- Card -->
                            <div class="card card-body mb-3 mb-lg-5">
                                <h5>Complete your profile</h5>

                                <!-- Progress -->
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="progress flex-grow-1">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <span class="ms-4">15%</span>
                                </div>
                                <!-- End Progress -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div class="card mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header card-header-content-between">
                                    <h4 class="card-header-title">Profile</h4>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
                                    <ul class="list-unstyled list-py-2 text-dark mb-0">
                                        <li class="pb-0"><span class="card-subtitle">About</span></li>
                                        <li><i class="bi-person dropdown-item-icon"></i> ${userobj.name}</li>
                                        <li><i class="bi-briefcase dropdown-item-icon"></i> No department</li>
                                        <li><i class="bi-building dropdown-item-icon"></i> </li>

                                        <li class="pt-4 pb-0"><span class="card-subtitle">Contacts</span></li>
                                        <li><i class="bi-at dropdown-item-icon"></i> ${userobj.email}</li>
                                        <li><i class="bi-phone dropdown-item-icon"></i> ${userobj.phno}</li>

                                        <li class="pt-4 pb-0"><span class="card-subtitle">Teams</span></li>
                                        <li class="fs-6 text-body"><i class="bi-people dropdown-item-icon"></i> You are not a member of any teams</li>
                                        <li class="fs-6 text-body"><i class="bi-stickies dropdown-item-icon"></i> You are not working on any projects</li>
                                    </ul>
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div class="card card-lg mb-3 mb-lg-5">
                                <!-- Body -->
                                <div class="card-body text-center">
                                    <div class="mb-4">
                                        <img class="avatar avatar-xl avatar-4x3" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-unlock.svg" alt="Image Description" data-hs-theme-appearance="default">
                                    </div>

                                    <div class="mb-3">
                                        <h3>2-step verification</h3>
                                        <p>Protect your account now and enable 2-step verification in the settings.</p>
                                    </div>

                                    <a class="btn btn-primary" href="https://d24ouiz0dt1p4y.cloudfront.net/account-settings.html#twoStepVerificationSection">Enable now</a>
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->
                        </div>
                        <!-- End Col -->

                        <div class="col-lg-8">
                            <!-- Card -->
                            <div class="card card-centered mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header card-header-content-between">
                                    <h4 class="card-header-title">Activity stream</h4>

                                    <!-- Dropdown -->
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm rounded-circle" id="contentActivityStreamDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="bi-three-dots-vertical"></i>
                                        </button>

                                        <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="contentActivityStreamDropdown">
                                            <span class="dropdown-header">Settings</span>

                                            <a class="dropdown-item" href="#">
                                                <i class="bi-share-fill dropdown-item-icon"></i> Share connections
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-info-circle dropdown-item-icon"></i> Suggest edits
                                            </a>

                                            <div class="dropdown-divider"></div>

                                            <span class="dropdown-header">Feedback</span>

                                            <a class="dropdown-item" href="#">
                                                <i class="bi-chat-left-dots dropdown-item-icon"></i> Report
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End Dropdown -->
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body card-body-height">
                                    <img class="avatar avatar-xxl mb-3" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-error.svg" alt="Image Description" data-hs-theme-appearance="default">
                                    <p class="card-text">No data to show</p>
                                    <a class="btn btn-white btn-sm" href="./#">Start your Activity</a>
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->

                            <!-- Card -->
                            <div class="card card-centered mb-3 mb-lg-5">
                                <!-- Header -->
                                <div class="card-header card-header-content-between">
                                    <h4 class="card-header-title">Projects</h4>

                                    <!-- Dropdown -->
                                    <div class="dropdown">
                                        <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm rounded-circle" id="projectReportDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="bi-three-dots-vertical"></i>
                                        </button>

                                        <div class="dropdown-menu dropdown-menu-end mt-1" aria-labelledby="projectReportDropdown">
                                            <span class="dropdown-header">Settings</span>

                                            <a class="dropdown-item" href="#">
                                                <i class="bi-share-fill dropdown-item-icon"></i> Share connections
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="bi-info-circle dropdown-item-icon"></i> Suggest edits
                                            </a>

                                            <div class="dropdown-divider"></div>

                                            <span class="dropdown-header">Feedback</span>

                                            <a class="dropdown-item" href="#">
                                                <i class="bi-chat-left-dots dropdown-item-icon"></i> Report
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End Dropdown -->
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body card-body-height card-body-centered">
                                    <img class="avatar avatar-xxl mb-3" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-error.svg" alt="Image Description" data-hs-theme-appearance="default">
                                    <p class="card-text">No data to show</p>
                                    <a class="btn btn-white btn-sm" href="./projects.html">Start your Projects</a>
                                </div>
                                <!-- End Body -->
                            </div>
                            <!-- End Card -->
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Content -->

        
    </main>
    <!-- ========== END MAIN CONTENT ========== -->

    <!-- ========== SECONDARY CONTENTS ========== -->
    <!-- Keyboard Shortcuts -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasKeyboardShortcuts" aria-labelledby="offcanvasKeyboardShortcutsLabel">
        <div class="offcanvas-header">
            <h4 id="offcanvasKeyboardShortcutsLabel" class="mb-0">Keyboard shortcuts</h4>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                <div class="list-group-item">
                    <h5 class="mb-1">Formatting</h5>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span class="fw-semibold">Bold</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">b</kbd>
                        </div>
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <em>italic</em>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">i</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <u>Underline</u>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">u</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <s>Strikethrough</s>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Alt</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">s</kbd>
                            <!-- End Col -->
                        </div>
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span class="small">Small text</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">s</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <mark>Highlight</mark>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">e</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

            </div>

            <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                <div class="list-group-item">
                    <h5 class="mb-1">Insert</h5>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Mention person <a href="#">(@Brian)</a></span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">@</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Link to doc <a href="#">(+Meeting notes)</a></span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">+</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <a href="#">#hashtag</a>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">#hashtag</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Date</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">/date</kbd>
                            <kbd class="d-inline-block mb-1">Space</kbd>
                            <kbd class="d-inline-block mb-1">/datetime</kbd>
                            <kbd class="d-inline-block mb-1">/datetime</kbd>
                            <kbd class="d-inline-block mb-1">Space</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Time</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">/time</kbd>
                            <kbd class="d-inline-block mb-1">Space</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Note box</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">/note</kbd>
                            <kbd class="d-inline-block mb-1">Enter</kbd>
                            <kbd class="d-inline-block mb-1">/note red</kbd>
                            <kbd class="d-inline-block mb-1">/note red</kbd>
                            <kbd class="d-inline-block mb-1">Enter</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

            </div>

            <div class="list-group list-group-sm list-group-flush list-group-no-gutters mb-5">
                <div class="list-group-item">
                    <h5 class="mb-1">Editing</h5>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Find and replace</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">r</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Find next</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">n</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Find previous</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">p</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Indent</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Tab</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Un-indent</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Tab</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Move line up</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1"><i class="bi-arrow-up-short"></i></kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Move line down</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1"><i class="bi-arrow-down-short fs-5"></i></kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Add a comment</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Alt</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">m</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Undo</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">z</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Redo</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">y</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

            </div>

            <div class="list-group list-group-sm list-group-flush list-group-no-gutters">
                <div class="list-group-item">
                    <h5 class="mb-1">Application</h5>
                </div>
                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Create new doc</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Alt</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">n</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Present</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">p</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Share</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">s</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Search docs</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">o</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

                <div class="list-group-item">
                    <div class="row align-items-center">
                        <div class="col-5">
                            <span>Keyboard shortcuts</span>
                        </div>
                        <!-- End Col -->

                        <div class="col-7 text-end">
                            <kbd class="d-inline-block mb-1">Ctrl</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">Shift</kbd> <span class="text-muted small">+</span> <kbd class="d-inline-block mb-1">/</kbd>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>

            </div>
        </div>
    </div>
    <!-- End Keyboard Shortcuts -->

    <!-- Activity -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasActivityStream" aria-labelledby="offcanvasActivityStreamLabel">
        <div class="offcanvas-header">
            <h4 id="offcanvasActivityStreamLabel" class="mb-0">Activity stream</h4>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <!-- Step -->
            <ul class="step step-icon-sm step-avatar-sm">
                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <div class="step-avatar">
                            <img class="step-avatar" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img9.jpg" alt="Image Description">
                        </div>

                        <div class="step-content">
                            <h5 class="mb-1">Iana Robinson</h5>

                            <p class="fs-5 mb-1">Added 2 files to task <a class="text-uppercase" href="#"><i class="bi-journal-bookmark-fill"></i> Fd-7</a></p>

                            <ul class="list-group list-group-sm">
                                <!-- List Item -->
                                <li class="list-group-item list-group-item-light">
                                    <div class="row gx-1">
                                        <div class="col-6">
                                            <!-- Media -->
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/excel-icon.svg" alt="Image Description">
                                                </div>
                                                <div class="flex-grow-1 text-truncate ms-2">
                                                    <span class="d-block fs-6 text-dark text-truncate" title="weekly-reports.xls">weekly-reports.xls</span>
                                                    <span class="d-block small text-muted">12kb</span>
                                                </div>
                                            </div>
                                            <!-- End Media -->
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-6">
                                            <!-- Media -->
                                            <div class="d-flex">
                                                <div class="flex-shrink-0">
                                                    <img class="avatar avatar-xs" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/brands/word-icon.svg" alt="Image Description">
                                                </div>
                                                <div class="flex-grow-1 text-truncate ms-2">
                                                    <span class="d-block fs-6 text-dark text-truncate" title="weekly-reports.xls">weekly-reports.xls</span>
                                                    <span class="d-block small text-muted">4kb</span>
                                                </div>
                                            </div>
                                            <!-- End Media -->
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->
                                </li>
                                <!-- End List Item -->
                            </ul>

                            <span class="small text-muted text-uppercase">Now</span>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <span class="step-icon step-icon-soft-dark">B</span>

                        <div class="step-content">
                            <h5 class="mb-1">Bob Dean</h5>

                            <p class="fs-5 mb-1">Marked <a class="text-uppercase" href="#"><i class="bi-journal-bookmark-fill"></i> Fr-6</a> as <span class="badge bg-soft-success text-success rounded-pill"><span class="legend-indicator bg-success"></span>"Completed"</span></p>

                            <span class="small text-muted text-uppercase">Today</span>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <div class="step-avatar">
                            <img class="step-avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img3.jpg" alt="Image Description">
                        </div>

                        <div class="step-content">
                            <h5 class="h5 mb-1">Crane</h5>

                            <p class="fs-5 mb-1">Added 5 card to <a href="#">Payments</a></p>

                            <ul class="list-group list-group-sm">
                                <li class="list-group-item list-group-item-light">
                                    <div class="row gx-1">
                                        <div class="col">
                                            <img class="img-fluid rounded" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/card-1.svg" alt="Image Description">
                                        </div>
                                        <div class="col">
                                            <img class="img-fluid rounded" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/card-2.svg" alt="Image Description">
                                        </div>
                                        <div class="col">
                                            <img class="img-fluid rounded" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/components/card-3.svg" alt="Image Description">
                                        </div>
                                        <div class="col-auto align-self-center">
                                            <div class="text-center">
                                                <a href="#">+2</a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                            <span class="small text-muted text-uppercase">May 12</span>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <span class="step-icon step-icon-soft-info">D</span>

                        <div class="step-content">
                            <h5 class="mb-1">David Lidell</h5>

                            <p class="fs-5 mb-1">Added a new member to Front Dashboard</p>

                            <span class="small text-muted text-uppercase">May 15</span>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <div class="step-avatar">
                            <img class="step-avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img7.jpg" alt="Image Description">
                        </div>

                        <div class="step-content">
                            <h5 class="mb-1">Rachel King</h5>

                            <p class="fs-5 mb-1">Marked <a class="text-uppercase" href="#"><i class="bi-journal-bookmark-fill"></i> Fr-3</a> as <span class="badge bg-soft-success text-success rounded-pill"><span class="legend-indicator bg-success"></span>"Completed"</span></p>

                            <span class="small text-muted text-uppercase">Apr 29</span>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <div class="step-avatar">
                            <img class="step-avatar-img" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/img/160x160/img5.jpg" alt="Image Description">
                        </div>

                        <div class="step-content">
                            <h5 class="mb-1">Finch Hoot</h5>

                            <p class="fs-5 mb-1">Earned a "Top endorsed" <i class="bi-patch-check-fill text-primary"></i> badge</p>

                            <span class="small text-muted text-uppercase">Apr 06</span>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->

                <!-- Step Item -->
                <li class="step-item">
                    <div class="step-content-wrapper">
                        <span class="step-icon step-icon-soft-primary">
                            <i class="bi-person-fill"></i>
                        </span>

                        <div class="step-content">
                            <h5 class="mb-1">Project status updated</h5>

                            <p class="fs-5 mb-1">Marked <a class="text-uppercase" href="#"><i class="bi-journal-bookmark-fill"></i> Fr-3</a> as <span class="badge bg-soft-primary text-primary rounded-pill"><span class="legend-indicator bg-primary"></span>"In progress"</span></p>

                            <span class="small text-muted text-uppercase">Feb 10</span>
                        </div>
                    </div>
                </li>
                <!-- End Step Item -->
            </ul>
            <!-- End Step -->

            <div class="d-grid">
                <a class="btn btn-white" href="javascript:;">View all <i class="bi-chevron-right"></i></a>
            </div>
        </div>
    </div>
    <!-- End Activity -->

    <!-- Welcome Message Modal -->
    <div class="modal fade" id="welcomeMessageModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Header -->
                <div class="modal-close">
                    <button type="button" class="btn btn-ghost-secondary btn-icon btn-sm" data-bs-dismiss="modal" aria-label="Close">
                        <i class="bi-x-lg"></i>
                    </button>
                </div>
                <!-- End Header -->

                <!-- Body -->
                <div class="modal-body p-sm-5">
                    <div class="text-center">
                        <div class="w-75 w-sm-50 mx-auto mb-4">
                            <img class="img-fluid" src="https://d24ouiz0dt1p4y.cloudfront.net/assets/svg/illustrations/oc-collaboration.svg" alt="Image Description" data-hs-theme-appearance="default">
                        </div>

                        <h4 class="h1">Welcome to Front</h4>

                        <p>We're happy to see you in our community.</p>
                    </div>
                </div>
                <!-- End Body -->

                
            </div>
        </div>
    </div>

    <!-- End Welcome Message Modal -->
    <!-- ========== END SECONDARY CONTENTS ========== -->

    <!-- JS Global Compulsory @@deleteLine:build -->
    <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="https://d24ouiz0dt1p4y.cloudfront.net/node_modules/jquery-migrate/dist/jquery-migrate.min.js"></script>
    <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JS Implementing Plugins -->
    <!-- bundlejs:vendor [https://d24ouiz0dt1p4y.cloudfront.net] -->
    <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-navbar-vertical-aside/dist/hs-navbar-vertical-aside.min.js"></script>
    <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-form-search/dist/hs-form-search.min.js"></script>

    <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-nav-scroller/dist/hs-nav-scroller.min.js"></script>
    <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-sticky-block/dist/hs-sticky-block.min.js"></script>
    <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/vendor/hs-file-attach/dist/hs-file-attach.min.js"></script>

    <!-- JS Front -->
    <script src="https://d24ouiz0dt1p4y.cloudfront.net/assets/js/theme.min.js"></script>

    <!-- JS Plugins Init. -->
    <script>
        (function () {
            window.onload = function () {


                // INITIALIZATION OF NAVBAR VERTICAL ASIDE
                // =======================================================
                new HSSideNav('.js-navbar-vertical-aside').init()


                // INITIALIZATION OF FORM SEARCH
                // =======================================================
                new HSFormSearch('.js-form-search')


                // INITIALIZATION OF BOOTSTRAP DROPDOWN
                // =======================================================
                HSBsDropdown.init()


                // INITIALIZATION OF NAV SCROLLER
                // =======================================================
                new HsNavScroller('.js-nav-scroller')


                // INITIALIZATION OF STICKY BLOCKS
                // =======================================================
                new HSStickyBlock('.js-sticky-block', {
                    targetSelector: document.getElementById('header').classList.contains('navbar-fixed') ? '#header' : null
                })


                // INITIALIZATION OF FILE ATTACHMENT
                // =======================================================
                new HSFileAttach('.js-file-attach')
            }
        })()
    </script>

    <!-- Style Switcher JS -->

    <script>
                (function () {
                    // STYLE SWITCHER
                    // =======================================================
                    const $dropdownBtn = document.getElementById('selectThemeDropdown') // Dropdowon trigger
                    const $variants = document.querySelectorAll(`[aria-labelledby="selectThemeDropdown"] [data-icon]`) // All items of the dropdown

                    // Function to set active style in the dorpdown menu and set icon for dropdown trigger
                    const setActiveStyle = function () {
                        $variants.forEach($item => {
                            if ($item.getAttribute('data-value') === HSThemeAppearance.getOriginalAppearance()) {
                                $dropdownBtn.innerHTML = `<i class="${$item.getAttribute('data-icon')}" />`
                                return $item.classList.add('active')
                            }

                            $item.classList.remove('active')
                        })
                    }

                    // Add a click event to all items of the dropdown to set the style
                    $variants.forEach(function ($item) {
                        $item.addEventListener('click', function () {
                            HSThemeAppearance.setAppearance($item.getAttribute('data-value'))
                        })
                    })

                    // Call the setActiveStyle on load page
                    setActiveStyle()

                    // Add event listener on change style to call the setActiveStyle function
                    window.addEventListener('on-hs-appearance-change', function () {
                        setActiveStyle()
                    })
                })()
    </script>
</body>
</html>
