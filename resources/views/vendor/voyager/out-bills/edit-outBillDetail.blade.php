@extends('voyager::master')

@section('content')

    <div class="card card-default">
        <div class="card-body">
            <div class="content">
                <form action="{{route('outBillDetail.update',$bill_details->out_bill_detail_id)}}" method="post">
                    @csrf
                    <input type="hidden" name="bill_line_id" value="{{$bill_details->out_bill_id}}">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Bill Id</label>
                                <input type="number" name="bill_id" value="{{$bill_details->out_bill_id}}" class="form-control" readonly required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Particular</label>
                                <input type="text" name="particular" value="{{$bill_details->food_menu_item_id}}" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" name="quantity" value="{{$bill_details->quantity}}" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Rate</label>
                                <input type="number" name="rate" value="{{$bill_details->rate}}" class="form-control" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Amount</label>
                                <input type="number" name="amount" value="{{$bill_details->amount}}" class="form-control" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@stop