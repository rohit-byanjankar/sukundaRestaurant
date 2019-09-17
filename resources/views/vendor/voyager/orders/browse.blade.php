@extends('voyager::master')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-list"></i> Orders
    </h1>
    <a href="{{ route('orders.create')}}" class="btn btn-success btn-add-new">
        <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
    </a>
    <form method="post" action="{{route('orders.report')}}" class="float-right">
        @csrf
        <span class="font-weight-bold">From:<input type="date" name="from">
        To:<input type="date" name="to"></span>
        <button class="btn btn-info">Generate Order Report</button>
    </form>
</div>
@stop

@section('content')
<div class="col-md-12">
    <table id="order">
        <thead>
            <th>Order Id</th>
            <th>Customer Name</th>
            <th>Order Status</th>
            <th>Payment Status</th>
            <th>Order Date</th>
            <th>Invoice</th>
            <th>Action</th>
        </thead>
        <tbody>
            @foreach($orders as $order)
            <tr>
                <td>{{$order->order_id}}</td>
                <td>{{$order->customer_name}}</td>
                <td>{{$order->order_status}}</td>
                <td><?php if($order->paid == '0') echo "Not Paid"; else echo "Paid";?></td>
                <td>{{$order->date}}</td>
                <td>
                    @if($order->paid == '0')
                    <a href="{{route('orders.render-invoice',$order->order_id)}}" title="Genrerate Invoice" class="btn btn-sm btn-success pull-left">
                        <i class="voyager-file-text"></i> <span class="hidden-xs hidden-sm">Generate Invoice</span>
                    </a>
                    @else
                    <a href="{{route('orders.render-invoice',$order->order_id)}}" title="View Invoice" class="btn btn-sm btn-success pull-left">
                        <i class="voyager-file-text"></i> <span class="hidden-xs hidden-sm">View Invoice</span>
                    </a>
                    @endif
                </td>
                <td>
                    <a href="{{route('orders.show',$order->order_id)}}" title="View" class="btn btn-sm btn-warning pull-left view">
                        <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
                    </a>
                    <a href="{{route('orders.edit',$order->order_id)}}" title="Edit" class="btn btn-sm btn-primary pull-left edit">
                        <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
                    </a>
                    <a href="{{route('orders.delete',$order->order_id)}}" onclick="return confirm('Are you sure?')" title="Delete" class="btn btn-sm btn-danger pull-left delete">
                        <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
                    </a>

                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@stop
@section('javascript')
<script>
    $(document).ready(function() {
        $('#order').DataTable();
    });
</script>
@stop