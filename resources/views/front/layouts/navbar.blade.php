<div class="agile-banner-main" id="home">
    <div class="banner-layer">
        <div class="header-main">
            <div class="container">
                <nav class="navbar navbar-default">
                    <div class="navbar-header">
                    <img src="frontend/image-assets/logo.png" width="60px" alt="" id="margin">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- navbar-header -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        {{menu('Site Main Menu')}}
                        <ul class="list-right">
                            <li>
                                <span class="fa fa-envelope-o list-icon" aria-hidden="true"></span>
                                <a href="mailto:info@example.com">{{setting('site.email')}}</a>
                            </li>
                            <li>
                                <span class="fa fa-phone list-icon" aria-hidden="true"></span>
                                <p> {{setting('site.phone_number')}} </p>
                            </li>  
                           <li class="dropdown">
                                @include('front.content.viewOrders')
                            </li>
                        </ul>
                    </div>

                    <div class="clearfix"> </div>
                </nav>

                @if(session()->has('success'))
                    <div class="alert alert-info text-center alert-dismissible col-md-12">
                        {{ session()->get('success')}}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif

                @if ($errors->any())
                    <div class="alert alert-danger alert-dismissible col-md-12">
                        <ul>
                            @foreach ($errors->all() as $error)
                                {{ $error }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //menu -->
        <!-- banner -->
        <div class="container">
            <div class="banner-top">
                <div class="banner-info">
                    <h1>
                    <a>
                        {{setting('site.title')}}
                    </a>
                    </h1>
                    <h2>Tasty experience in every bite!</h2>

                    <div class="about-p text-center">
                        <span class="sub-title"></span>
                        <span class="fa fa-cutlery" aria-hidden="true"></span>
                        <span class="sub-title"></span>
                    </div>
                    <p>make your kinda meal
                    </p><p>

                    </p></div>
            </div>

        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!-- //banner -->
