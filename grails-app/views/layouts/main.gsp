<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="Jobboard">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>JobBoard - Bootstrap HTML5 Job Portal Template</title>

    <!-- Favicon -->
    <asset:image src="favicon.png" />
    <!-- Bootstrap CSS -->
    <asset:stylesheet href="bootstrap1.min.css" type="text/css"/>
    <asset:stylesheet href="jasny-bootstrap.min.css" type="text/css"/>
    <asset:stylesheet href="bootstrap-select.min.css" type="text/css"/>
    <!-- Material CSS -->
    <asset:stylesheet href="material-kit.css" type="text/css"/>
    <!-- Font Awesome CSS -->
    <asset:stylesheet href="font-awesome.min.css" type="text/css"/>
    <asset:stylesheet href="themify-icons.css"/>

    <!-- Animate CSS -->
    <asset:stylesheet href="animate.css" type="text/css"/>
    <!-- Owl Carousel -->
    <asset:stylesheet href="owl.carousel.css" type="text/css"/>
    <asset:stylesheet href="owl.theme.css" type="text/css"/>
    <!-- Rev Slider CSS -->
    <asset:stylesheet href="settings.css" type="text/css"/>
    <!-- Slicknav js -->
    <asset:stylesheet href="slicknav.css" type="text/css"/>
    <!-- Main Styles -->
    <asset:stylesheet href="main1.css" type="text/css"/>
    <!-- Responsive CSS Styles -->
    <asset:stylesheet href="responsive.css" type="text/css"/>

    <!-- Color CSS Styles  -->
    <asset:stylesheet type="text/css" href="red.css" media="screen" />


</head>
<body>

<!-- Header Section Start -->
<div class="header">
    <!-- Start intro section -->
    <section id="intro" class="section-intro">
        <div class="logo-menu">
            <nav class="navbar navbar-default" role="navigation" data-spy="affix" data-offset-top="50">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    <a class="navbar-brand logo" href="index.html"><asset:image src="logo.png"/></a>
                    </div>

                    <div class="collapse navbar-collapse" id="navbar">
                        <!-- Start Navigation List -->
                        <ul class="nav navbar-nav">
                            <li>
                        <g:link controller="organization" action="index">Home</g:link>

                            </li>
<sec:ifNotLoggedIn>
    <li><g:link controller="user" action="create">Register Training Seeker</g:link></li>


               </sec:ifNotLoggedIn>
                        <li>
                        <sec:ifLoggedIn>

                            <sec:ifAllGranted roles='ROLE_ORG'>

                                <li><g:link controller="training" action="create">Create New Training</g:link></li>
                                <li><g:link controller="trainUser" action="list">My Profile</g:link></li>

                            </sec:ifAllGranted>
                            <sec:ifAllGranted roles='ROLE_USER'>
                                <li><g:link controller="user" action="userprofile">Profile</g:link></li>
                                <li><g:link controller="user" action="uploadcv">UploadCV</g:link></li>
                            </sec:ifAllGranted>
                            <li><g:link controller="logout">Logout</g:link></li>


                        </sec:ifLoggedIn>
                        </li>
                            <li>
                                <g:link controller="organization" action="contactus">Contact Us</g:link>

                            </li>

                            <li>

                                    <g:link controller="organization" action="aboutus">About Us</g:link>


                            </li>

                        <li>
                            <a href="#">
                                Our History<i class=""></i>
                            </a>

                        </li>


                        </li>

                        </ul>
                        <sec:ifNotLoggedIn>
                        <ul class="nav navbar-nav navbar-right float-right">
                            <li class="left"><g:link controller="organization" action="createorg">Register Organization</g:link></li>
                            <li class="right"><g:link controller="login">Login</g:link></li>

                        </ul>
                        </sec:ifNotLoggedIn>
                    </div>
                </div>
                <!-- Mobile Menu Start -->

                <!-- Mobile Menu End -->
            </nav>

            <!-- Off Canvas Navigation -->
            <div class="navmenu navmenu-default navmenu-fixed-left offcanvas">

            </div>
            <div class="tbtn wow pulse" id="menu" data-wow-iteration="infinite" data-wow-duration="500ms" data-toggle="offcanvas" data-target=".navmenu">
                <p><i class="ti-files"></i> All Pages</p>
            </div>
        </div>

        <!-- Header Section End -->

        <div class="search-container">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Find the Right Training that fits your life</h1><br><h2>More than <strong>100</strong> training are waiting to Kickstart your career!</h2>
                        <div class="content">
                            <g:form method="GET" action="index" controller="organization">
                                <div class="row">
                                    <div class="col-md-4 col-sm-6">
                                        <div class="form-group">
                                            <g:textField name="query" class="form-control" type="text" placeholder="job title / keywords / company name" />
                                            <i class="ti-time"></i>
                                        </div>
                                    </div>


                                    <div class="col-md-1 col-sm-6">
                                        <button type="button" class="btn btn-search-icon"><i class="ti-search"></i></button>
                                    </div>
                                </div>
                            </g:form>
                        </div>
                        <div class="popular-jobs">
                            <b>Popular Keywords: </b>
                            <a href="#">Child Caring</a>
                            <a href="#">Helping Orphans</a>
                            <a href="#">Managing Offices</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end intro section -->
    <section class="find-job section">




    <g:layoutBody/>

    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

</section>


    <section class="section purchase" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row">
                <div class="section-content text-center">
                    <h1 class="title-text">
                        Looking for a Job
                    </h1>
                    <p>Join thousand of employers and earn what you deserve!</p>
                    <a href="my-account.html" class="btn btn-common">Get Started Now</a>
                </div>
            </div>
        </div>
    </section>
    <!--news section starts here-->
    <section id="blog" class="section">
        <!-- Container Starts -->
        <div class="container">
            <h2 class="section-title">
                Latest News
            </h2>
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 blog-item">
                    <!-- Blog Item Starts -->
                    <div class="blog-item-wrapper">
                        <div class="blog-item-img">
                            <a href="single-post.html">
                                <asset:image src="blog/home-items/img1.jpg" />

                            </a>
                        </div>
                        <div class="blog-item-text">
                            <div class="meta-tags">
                                <span class="date"><i class="ti-calendar"></i> Dec 20, 2017</span>
                                <span class="comments"><a href="#"><i class="ti-comment-alt"></i> 5 Comments</a></span>
                            </div>
                            <a href="single-post.html">
                                <h3>
                                    Tips to write an impressive resume online for beginner
                                </h3>
                            </a>

                            <a href="single-post.html" class="btn btn-common btn-rm">Read More</a>
                        </div>
                    </div>
                    <!-- Blog Item Wrapper Ends-->
                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 blog-item">
                    <!-- Blog Item Starts -->
                    <div class="blog-item-wrapper">
                        <div class="blog-item-img">
                            <a href="single-post.html">
                                <asset:image src="blog/home-items/img2.jpg" />

                            </a>
                        </div>
                        <div class="blog-item-text">
                            <div class="meta-tags">
                                <span class="date"><i class="ti-calendar"></i> Jan 20, 2018</span>
                                <span class="comments"><a href="#"><i class="ti-comment-alt"></i> 5 Comments</a></span>
                            </div>
                            <a href="single-post.html">
                                <h3>
                                    Let's explore 5 cool new features in JobBoard theme
                                </h3>
                            </a>

                            <a href="single-post.html" class="btn btn-common btn-rm">Read More</a>
                        </div>
                    </div>
                    <!-- Blog Item Wrapper Ends-->
                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 blog-item">
                    <!-- Blog Item Starts -->
                    <div class="blog-item-wrapper">
                        <div class="blog-item-img">
                            <a href="single-post.html">
                                <asset:image src="blog/home-items/img3.jpg" />

                            </a>
                        </div>
                        <div class="blog-item-text">
                            <div class="meta-tags">
                                <span class="date"><i class="ti-calendar"></i> Mar 20, 2018</span>
                                <span class="comments"><a href="#"><i class="ti-comment-alt"></i> 5 Comments</a></span>
                            </div>
                            <a href="single-post.html">
                                <h3>
                                    How to convince recruiters and get your dream job
                                </h3>
                            </a>

                            <a href="single-post.html" class="btn btn-common btn-rm">Read More</a>
                        </div>
                    </div>
                    <!-- Blog Item Wrapper Ends-->
                </div>
            </div>
        </div>
    </section>
    <section id="testimonial" class="section">
        <div class="container">
            <div class="row">
                <div class="touch-slider" class="owl-carousel owl-theme">
                    <div class="item active text-center">
                        <asset:image src="testimonial/img1.jpg" class="img-member"/>
                        <img  src="assets/img/" alt="">
                        <div class="client-info">
                            <h2 class="client-name">Jessica <span>(Senior Accountant)</span></h2>
                        </div>
                        <p><i class="fa fa-quote-left quote-left"></i> The team that was assigned to our project... were extremely professional <i class="fa fa-quote-right quote-right"></i><br> throughout the project and assured that the owner expectations were met and <br> often exceeded. </p>
                    </div>
                    <div class="item text-center">
                        <asset:image src="testimonial/img2.jpg" class="img-member"  alt=""/>
                        <div class="client-info">
                            <h2 class="client-name">John Doe <span>(Project Menager)</span></h2>
                        </div>
                        <p><i class="fa fa-quote-left quote-left"></i> The team that was assigned to our project... were extremely professional <i class="fa fa-quote-right quote-right"></i><br> throughout the project and assured that the owner expectations were met and <br> often exceeded. </p>
                    </div>
                    <div class="item text-center">
                        <asset:image src="testimonial/img3.jpg" class="img-member"  alt=""/>
                        <div class="client-info">
                            <h2 class="client-name">Helen <span>(Engineer)</span></h2>
                        </div>
                        <p><i class="fa fa-quote-left quote-left"></i> The team that was assigned to our project... were extremely professional <i class="fa fa-quote-right quote-right"></i><br> throughout the project and assured that the owner expectations were met and <br> often exceeded. </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->

    <!-- Clients Section -->
    <section class="clients section">
        <div class="container">
            <h2 class="section-title">
                Clients & Partners
            </h2>
            <div class="row">
                <div id="clients-scroller">
                    <div class="items">
                        <asset:image src="clients/img1.png" />

                    </div>
                    <div class="items">
                        <asset:image src="clients/img2.png" />
                    </div>
                    <div class="items">
                        <asset:image src="clients/img3.png" />
                    </div>
                    <div class="items">
                        <asset:image src="clients/img3.png" />
                    </div>
                    <div class="items">
                        <asset:image src="clients/img5.png" />
                    </div>
                    <div class="items">
                        <asset:image src="clients/img6.png" />
                    </div>
                    <div class="items">
                        <asset:image src="clients/img6.png" />
                    </div>
                    <div class="items">
                        <asset:image src="clients/img6.png" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Client Section End -->

    <!-- Counter Section Start -->
    <section id="counter">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="counting">
                        <div class="icon">
                            <i class="ti-briefcase"></i>
                        </div>
                        <div class="desc">
                            <h2>Jobs</h2>
                            <h1 class="counter">12050</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="counting">
                        <div class="icon">
                            <i class="ti-user"></i>
                        </div>
                        <div class="desc">
                            <h2>Members</h2>
                            <h1 class="counter">10890</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="counting">
                        <div class="icon">
                            <i class="ti-write"></i>
                        </div>
                        <div class="desc">
                            <h2>Resume</h2>
                            <h1 class="counter">700</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="counting">
                        <div class="icon">
                            <i class="ti-heart"></i>
                        </div>
                        <div class="desc">
                            <h2>Company</h2>
                            <h1 class="counter">9050</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Counter Section End -->

    <!-- Infobox Section Start -->
    <section class="infobox section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="info-text">
                        <h2>Don't Want To Miss a Thing?</h2>
                        <p>Just go to <a href="#">Google Play</a> to download JobBoard Mini</p>
                    </div>
                    <a href="#" class="btn btn-border">Google Play</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Infobox Section End -->

    <!-- Footer Section Start -->
    <footer>
        <!-- Footer Area Start -->
        <section class="footer-Content">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="widget">
                            <h3 class="block-title"></h3>
                            <div class="textwidget">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque lobortis tincidunt est, et euismod purus suscipit quis. Etiam euismod ornare elementum. Sed ex est, consectetur eget facilisis sed.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="widget">
                            <h3 class="block-title">Quick Links</h3>
                            <ul class="menu">
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Support</a></li>
                                <li><a href="#">License</a></li>
                                <li><a href="#">Terms & Conditions</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="widget">
                            <h3 class="block-title">Trending Jobs</h3>
                            <ul class="menu">
                                <li><a href="#">Android Developer</a></li>
                                <li><a href="#">Senior Accountant</a></li>
                                <li><a href="#">Frontend Developer</a></li>
                                <li><a href="#">Junior Tester</a></li>
                                <li><a href="#">Project Manager</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="widget">
                            <h3 class="block-title">Follow Us</h3>
                            <div class="bottom-social-icons social-icon">
                                <a class="twitter" href="https://twitter.com/GrayGrids"><i class="ti-twitter-alt"></i></a>
                                <a class="facebook" href="https://web.facebook.com/GrayGrids"><i class="ti-facebook"></i></a>
                                <a class="youtube" href="https://youtube.com"><i class="ti-youtube"></i></a>
                                <a class="dribble" href="https://dribbble.com/GrayGrids"><i class="ti-dribbble"></i></a>
                                <a class="linkedin" href="https://www.linkedin.com/GrayGrids"><i class="ti-linkedin"></i></a>
                            </div>
                            <p>Join our mailing list to stay up to date and get notices about our new releases!</p>
                            <form class="subscribe-box">
                                <input type="text" placeholder="Your email">
                                <input type="submit" class="btn-system" value="Send">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<asset:javascript src="jquery-min.js" />
<asset:javascript src="bootstrap1.min.js" />
<asset:javascript src="material.min.js"/>
<asset:javascript src="material-kit.js"/>
<asset:javascript src="jquery.parallax.js"/>
<asset:javascript src="owl.carousel.min.js"/>
<asset:javascript src="jquery.slicknav.js"/>
<asset:javascript src="main1.js"/>
<asset:javascript src="jquery.counterup.min.js"/>
<asset:javascript src="waypoints.min.js"/>
<asset:javascript src="jasny-bootstrap.min.js"/>
<asset:javascript src="bootstrap-select.min.js"/>
<asset:javascript src="form-validator.min.js"/>
<asset:javascript src="contact-form-script.js"/>
<asset:javascript src="jquery.themepunch.revolution.min.js"/>
<asset:javascript src="jquery.themepunch.tools.min.js"/>

</body>
</html>
