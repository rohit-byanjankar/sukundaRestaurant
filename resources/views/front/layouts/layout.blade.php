<html lang="zxx"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>{{setting('site.title')}}</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="title" content="{{setting('site.title')}}">
    <meta name="description" content="{{setting('site.description')}}">
    <meta name="keywords" content="{{setting('site.keywords')}}">
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all">
    <!--about-bottom -->
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
    <div class="main-panel" id="home">
        @yield('contents')
    </div>
    @include('front.layouts.footer')
</div>
<!-- js -->

<script src="js/jquery-2.2.3.min.js"></script>
<!--/js-->
<!-- //gallery -->
<script src="js/jquery.tools.min.js"></script>
{{--<script src="js/jquery.mobile.custom.min.js"></script>--}}
<script src="js/bootstrap.js"></script>

<!-- //gallery -->
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-ui.js"></script>
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
<a href="#" id="toTop" style="display: none;" title="To Top"><span id="toTopHover"></span></a>
@stack('scripts')
</body>
</html>

