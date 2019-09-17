@extends('front.layouts.layout')
@section('contents')

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
                                            <div class="col-md-3">
                                                <a href="g5.jpg" class="thumbnail cm-overlay">
                                                    <img src="frontend/image-assets/g5.jpg" alt="Image" style="max-width:100%;">
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

        @include('front.content.ourMenu')

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
@endsection