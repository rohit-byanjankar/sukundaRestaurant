@extends('voyager::master')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-list"></i> outBill
    </h1>
    <a href="{{ route('outBill.create') }}" class="btn btn-success btn-add-new">
        <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
    </a>
</div>
@stop

@section('content')
<div class="col-md-12">
    <table id="bill">
        <thead>
            <th>Bill Number</th>
            <th>Customer Name</th>
            <th>Address</th>
            <th>Phone Number</th>
            <th>Action</th>
        </thead>
        <tbody>
            @foreach($outBill as $bill)
            <tr>
                <td>{{$bill->out_bill_id}}</td>
                <td>{{$bill->customer_name}}</td>
                <td>{{$bill->address}}</td>
                <td>{{$bill->phone_number}}</td>
                <td>
                    <a href="{{route('outBillDetail.view',$bill->out_bill_id)}}" title="View" class="btn btn-sm btn-warning pull-left view">
                        <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
                    </a>
                    <a href="{{route('outBill.edit',$bill->out_bill_id)}}" title="Edit" class="btn btn-sm btn-primary pull-left edit">
                        <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
                    </a>
                    <a href="{{route('outBill.delete',$bill->out_bill_id)}}" onclick="return confirm('Are you sure?')" title="Delete" class="btn btn-sm btn-danger pull-left delete">
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
        $('#bill').DataTable();
    });
</script>
@stop