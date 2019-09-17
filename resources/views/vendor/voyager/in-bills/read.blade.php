@extends('voyager::master')
@section('content')
<div class="col-md-12 d-inline bg-success">
    <div class="col-md-6">
        <h4>
            Vendor Name : {{$bill->vendor_name}}
        </h4>
    </div>
    <div class="col-md-6">
        <h4>
            Invoice Number : {{$bill->invoice_id}}
        </h4>
    </div>
</div>
<div class="col-md-12">
    <table id="bill_line" class="col-md-12">
        <thead>
            <tr>
                <th>Particulars</th>
                <th>Quantity</th>
                <th>Rate</th>
                <th>Amount</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($bill_details as $o)
            <tr>
                <td>{{$o->item_name}}</td>
                <td>{{$o->quantity}} {{$o->measuring_unit}}</td>
                <td>{{ setting('site.currency') }} {{$o->rate}}</td>
                <td>{{ setting('site.currency') }} {{$o->amount}}</td>
                <td>
                    <a onclick="return confirm('Are you sure?')" href="{{route('inBillDetail.delete',$o->in_bill_detail_id)}}" title="Delete" class="btn btn-sm btn-danger pull-right delete">
                        <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
                    </a>
                    <a href="{{ route('inBillDetail.edit', $o->in_bill_detail_id)}}" title="Edit" class="btn btn-sm btn-primary pull-right edit">
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
        $('#bill_line').DataTable();
    });
</script>
@stop