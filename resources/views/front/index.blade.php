@extends('front.layouts.layout')
@section('contents')
        @include('front.content.aboutUs')
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
                   {!! setting('site.opening_time') !!}
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
{{--          @include('front.content.testimonial')--}}
@endsection
