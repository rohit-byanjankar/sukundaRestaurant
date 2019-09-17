@extends('voyager::master')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-list"></i> Payments
    </h1>
    <a href="{{ route('payments.create')}}" class="btn btn-success btn-add-new">
        <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
    </a>
</div>
@stop

@section('content')
<div class="col-md-12">
    <table id="order">
        <thead>
            <th>Invoice No :</th>
            <th>Payment Mode</th>
            <th>Payment Type</th>
            <th>Expiry Year</th>
            <th>Expiry Month</th>
            <th>Payment Status</th>
            <th>Action</th>
        </thead>
        <tbody>
            @foreach($payments as $payment)
            <tr>
                <td>{{$payment->invoice_no}}</td>
                <td>{{$payment->payment_mode}}</td>
                <td>{{$payment->payment_type}}</td>
                <td>{{$payment->expiry_year}}</td>
                <td>{{$payment->expiry_month}}</td>
                <td>{{$payment->payment_status}}</td>
                <td>
                    <a href="{{route('voyager.payments.show',$payment->payment_id)}}" title="View" class="btn btn-sm btn-warning pull-left view">
                        <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
                    </a>
                    <a href="{{route('payments.edit',$payment->payment_id)}}" title="Edit" class="btn btn-sm btn-primary pull-left edit">
                        <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
                    </a>
                    <a href="{{route('voyager.payments.destroy',$payment->payment_id)}}" onclick="return confirm('Are you sure?')" title="Delete" class="btn btn-sm btn-danger pull-left delete">
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