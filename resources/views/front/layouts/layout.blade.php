<html lang="zxx"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>bhaktapur</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all">
    <!--about-bottom -->
    <link type="text/css" rel="stylesheet" href="css/cm-overlay.css">
    <!--about-bottom -->
    <link href="css/font1.css" rel="stylesheet">
    <link href="css/font2.css" rel="stylesheet">
    <link href="css/font3.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all">
    @yield('stylesheet')
</head>
<body>
<div class="wrapper">
        @include('front.layouts.navbar')
    <div class="main-panel">
        @include('front.content.aboutUs')
        <div class="section">
            <div class="container">
                <h3 class="w3layouts-title">Taste the best !</h3>
                <div class="about-bottom">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="Carousel" class="carousel slide">
                                <ol class="carousel-indicators">
                                    <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#Carousel" data-slide-to="1" class=""></li>
                                    <li data-target="#Carousel" data-slide-to="2" class=""></li>
                                </ol>
                                <!-- Carousel items -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <a href="g1.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g1.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g2.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g2.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g3.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g3.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g4.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g4.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                        </div>
                                        <!--.row-->
                                    </div>
                                    <!--.item-->
                                    <div class="item">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <a href="g5.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g5.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g6.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g6.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g7.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g7.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g1.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g1.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                        </div>
                                        <!--.row-->
                                    </div>
                                    <!--.item-->
                                    <div class="item">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <a href="g2.jpg" class="thumbnail cm-overlay">
                                                    <img src="g2.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g3.jpg" class="thumbnail cm-overlay">
                                                    <img src="g3.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g4.jpg" class="thumbnail cm-overlay">
                                                    <img src="g4.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="g5.jpg" class="thumbnail cm-overlay">
                                                    <img src="g5.jpg" alt="Image" style="max-width:100%;">
                                                </a>
                                            </div>
                                        </div>
                                        <!--.row-->
                                    </div>
                                    <!--.item-->
                                </div>
                                <!--.carousel-inner-->
                                <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                                <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                            </div>
                            <!--.Carousel-->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        @include('content.ourMenu')

        <div class="section">
            <div class="w3_agileits-subscribe timings text-center">
                <h4>opening times</h4>
                <div class="about-p  text-center">
                    <span class="sub-title p1"></span>
                    <span class="fa fa-cutlery" aria-hidden="true"></span>
                    <span class="sub-title p1"></span>

                </div>
                <div class="time">
                    <h5>Monday – Friday </h5>
                    <p>9:00 AM – 11:00 PM</p>
                    <h5>Saturday – Sunday </h5>
                    <p>8:00 AM – 00:00 AM</p>
                </div>
            </div>
        </div>

        <!-- slid -->
        <div class="slid">
            <div class="slid-text">
                <h4>Fresh ingredient, tasty meals.</h4>
                <p>Proin tincidunt sodales faucibus. Curabitur ut metus sed urna dignissim sodales ac a tellus. Sed varius justo tellus,
                    at convallis libero cursus non. In malesuada accumsan felis, a imperdiet arcu blandit sed. Ut id faucibus eros. Fusce
                    sed vulputate dui, non consectetur felis. Etiam id enim sem. Suspendisse commodo tempor magna </p>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!-- //slid -->

        @include('front.content.testimonial')
        @include('front.layouts.footer')
    </div>
</div>
<!-- js -->

<script src="js/jquery-2.2.3.min.js"></script>
<!--/js-->
<!-- //gallery -->
<script src="js/jquery.tools.min.js"></script>
<script src="js/jquery.mobile.custom.min.js"></script>
<script src="js/jquery.cm-overlay.js"></script>
<script src="js/bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('.cm-overlay').cmOverlay();
    });
</script>
<!-- //gallery -->
<!--start-date-piker-->
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-ui.js"></script>
<script>
    $(function () {
        $("#datepicker,#datepicker1").datepicker();
    });
</script>
<!-- /End-date-piker -->
<script src="js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();

            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!--//end-smooth-scrolling-->
<!-- smooth-scrolling-of-move-up  -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        */

        $().UItoTop({
            easingType: 'easeOutQuart'
        });
    });
</script>
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<a href="#" id="toTop" style="display: none;"><span id="toTopHover"></span>To Top</a>
@stack('scripts')
</body>
</html>

