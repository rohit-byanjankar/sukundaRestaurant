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
                <p id="pfont">We serve lunch and dinner,
                   With authentic varieties of nepalese traditional food. The spices and herbs healthy for everyone. 
                    Come in now for catering servies, reservations, group celebrations, dine in or take away. </p>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!-- //slid -->
{{--          @include('front.content.testimonial')--}}
@endsection
