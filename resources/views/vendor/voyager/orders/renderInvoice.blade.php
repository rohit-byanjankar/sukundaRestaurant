@extends('voyager::master')
@section('page_header')
<h1 class="page-title">
    <i class="voyager-list"></i>Order Invoice
</h1>
<a href="{{ route('voyager.orders.index') }}" class="btn btn-success">
    <i class="voyager-back"></i> <span>Return</span>
</a>
@include('voyager::multilingual.language-selector') 
@stop

@section('content')
<div class="col-md-12" style="height : 700px;">
    <div style="height : 100%; width : 100%;" class="col-md-12">
        <iframe src="{{route('orders.invoice',$id)}}" frameborder="1" width="100%" height="100%"></iframe>
    </div>
</div>

@stop