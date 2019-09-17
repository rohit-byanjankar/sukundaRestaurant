@extends('voyager::master')

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="voyager-list"></i> inBill
    </h1>
    <a href="{{ route('inBill.create') }}" class="btn btn-success btn-add-new">
        <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
    </a>
</div>
@stop

@section('content')
<div class="col-md-12">
    <table id="bill">
        <thead>
            <th>Bill Number</th>
            <th>Invoice Number</th>
            <th>Vendor Name</th>
            <th>Address</th>
            <th>Phone Number</th>
            <th>Action</th>
        </thead>
        <tbody>
            @foreach($inBill as $bill)
            <tr>
                <td>{{$bill->in_bill_id}}</td>
                <td>{{$bill->invoice_id}}</td>
                <td>{{$bill->vendor_name}}</td>
                <td>{{$bill->address}}</td>
                <td>{{$bill->phone_number}}</td>
                <td>
                    <a href="{{route('inBillDetail.view',$bill->in_bill_id)}}" title="View" class="btn btn-sm btn-warning pull-left view">
                        <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
                    </a>
                    <a href="{{route('inBill.edit',$bill->in_bill_id)}}" title="Edit" class="btn btn-sm btn-primary pull-left edit">
                        <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
                    </a>
                    <a href="{{route('inBill.delete',$bill->in_bill_id)}}" onclick="return confirm('Are you sure?')" title="Delete" class="btn btn-sm btn-danger pull-left delete">
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