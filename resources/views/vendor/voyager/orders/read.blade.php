@extends('voyager::master')

@section('content')

<div class="container">
    <h4>
        Customer Name : {{$order->customer_name}}
    </h4>
    <div class="panel panel-default">
        <div class="panel-body"><b>Note : </b>{{$order->note}}</div>
    </div>
</div>
<div class="col-md-12">
    <table id="order_line" class="col-md-12">
        <thead>
            <tr>
                <th>Date</th>
                <th>Particulars</th>
                <th>Quantity</th>
                <th>Rate</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($order_details as $o)
            <tr>
                <td>{{$order->date}}</td>
                <td>{{$o->particular}}</td>
                <td>{{$o->quantity}}</td>
                <td>{{setting('site.currency')}} {{$o->rate}}</td>
                <td>{{setting('site.currency')}} {{$o->amount}}</td>
                <td>{{$o->particular_status}}</td>
                <td>
                    <a onclick="return confirm('Are you sure?')" href="{{route('order-lines.delete',$o->order_line_id)}}" title="Delete" class="btn btn-sm btn-danger pull-right delete">
                        <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
                    </a>

                    <a href="{{ route('order-lines.edit', $o->order_line_id)}}" title="Edit" class="btn btn-sm btn-primary pull-right edit">
                        <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
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
        $('#order_line').DataTable();
    });
</script>
@stop