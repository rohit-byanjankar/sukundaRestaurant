<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>Restaurant POS</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" >

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
        <link href="css/app.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <!-- Styles -->
        <style>
            html, body {
                background-color: #fff;
                color: #636b6f;
                font-family: 'Nunito', sans-serif;
                font-weight: 200;
                height: 100vh;
                margin: 0;
            }

            .full-height {
                height: 100vh;
            }

            .flex-center {
                align-items: center;
                display: flex;
                justify-content: center;
            }

            .position-ref {
                position: relative;
            }

            .top-right {
                position: absolute;
                right: 10px;
                top: 18px;
            }

            .content {
                text-align: center;
            }

            .title {
                font-size: 84px;
            }

            .links > a {
                color: #636b6f;
                padding: 0 25px;
                font-size: 13px;
                font-weight: 600;
                letter-spacing: .1rem;
                text-decoration: none;
                text-transform: uppercase;
            }

            .m-b-md {
                margin-bottom: 30px;
            }

            .half-height{
                height:50%;
            }
            .background-red{
                background:red;
            }
            .all-borders{
                border:1px solid #000;
            }
            .content{
                width:98%;
            }

        </style>
    </head>
    <body>
        <div class="full-height">

            <div class="content">
                <div id="app" class="row">

                    <div class="col-md-7 ">
                        <div class="row" >
                        <menu-items></menu-items>    
                        </div>
                        <div class="row" >
                        <order-items></order-items>
                        </div>
                    </div>
                    <div class="col-md-5 full-height">
                        <order-details></order-details>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

        <script src="js/app.js"></script>
    </body>
</html>
