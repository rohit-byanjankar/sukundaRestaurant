@extends('voyager::master')

@section('content')
<form action="{{route('inBill.store')}}" method="post">
    @csrf
    <div class="col-md-12">

        <div class="col-md-12">
            <table class="table table-bordered col-md-12">
                <thead>
                    <tr>
                        <th colspan="5">Generals</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="4">Invoice Id</td>
                        <td>
                            {{$in_bill_details->invoice_id}}
                            <input type="hidden" name="invoice_id" value="{{$in_bill_details->invoice_id}}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">Vendor Name </td>
                        <td>
                            {{$in_bill_details->vendor_name}}
                            <input type="hidden" name="vendor_name" value="{{$in_bill_details->vendor_name}}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">Address </td>
                        <td>
                            {{$in_bill_details->address}}
                            <input type="hidden" name="address" value="{{$in_bill_details->address}}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">Phone Number </td>
                        <td>
                            {{$in_bill_details->phone_number}}
                            <input type="hidden" name="phone_number" value="{{$in_bill_details->phone_number}}">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-12">
            <table class="table table-bordered col-md-12">
                <thead>
                    <tr>
                        <th class="col-md-4">Particular</th>
                        <th class="col-md-2">Quantity</th>
                        <th class="col-md-2">Measuring Unit</th>
                        <th class="col-md-2">Rate</th>
                        <th class="col-md-2">Amount</th>
                    </tr>
                </thead>
                <tbody>
                    @for($i = 0; $i < sizeof($in_bill_details->particular);$i++)
                        <tr>
                            <td class="col-md-4">{{$items[$i]->item_name}}</td>
                            <td class="col-md-2">{{$in_bill_details->quantity[$i]}}</td>
                            <td class="col-md-2">{{$in_bill_details->measuring_unit[$i]}}</td>
                            <td class="col-md-2">{{ setting('site.currency') }} {{$in_bill_details->rate[$i]}}</td>
                            <td class="col-md-2">{{ setting('site.currency') }} {{$in_bill_details->amount[$i]}}</td>
                        </tr>
                        <input type="hidden" name="item_id[]" value="{{$items[$i]->item_id}}">
                        <input type="hidden" name="particular[]" value="{{$items[$i]->item_name}}">
                        <input type="hidden" name="quantity[]" value="{{$in_bill_details->quantity[$i]}}">
                        <input type="hidden" name="measuring_unit[]" value="{{$in_bill_details->measuring_unit[$i]}}">
                        <input type="hidden" name="rate[]" value="{{$in_bill_details->rate[$i]}}">
                        <input type="hidden" name="amount[]" value="{{$in_bill_details->amount[$i]}}">
                        @endfor
                </tbody>
            </table>
        </div>
        <div class="col-md-12">
            <table class="table table-bordered col-md-12">
                <tbody>
                    <tr>
                        <td colspan="4">Discount </td>
                        <td>
                        {{ setting('site.currency') }} {{$in_bill_details->discount}}
                            <input type="hidden" name="discount" value="{{$in_bill_details->discount}}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">Tax </td>
                        <td>
                        {{ setting('site.currency') }} {{$in_bill_details->taxable_amount}}
                        </td>
                        <input type="hidden" name="taxable_amount" value="{{$in_bill_details->taxable_amount}}">
                    </tr>
                    <tr>
                        <td colspan="4">V.A.T </td>
                        <td>
                        {{ setting('site.currency') }} {{$in_bill_details->vat}}
                            <input type="hidden" name="vat" value="{{$in_bill_details->vat}}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">Sub-Total </td>
                        <td>
                        {{ setting('site.currency') }} {{$in_bill_details->sub_total}}
                        </td>
                        <input type="hidden" name="sub_total" value="{{$in_bill_details->sub_total}}">
                    </tr>
                    <tr>
                        <td colspan="4">Total </td>
                        <td>
                        {{ setting('site.currency') }} {{$in_bill_details->total}}
                        </td>
                        <input type="hidden" name="total" value="{{$in_bill_details->total}}">
                    </tr>
                </tbody>
            </table>
        </div>
        <input type="hidden" name="date" value="{{ date('Y/m/d')}}">
        <div class="form-group col-md-12">
            <button type="submit" class="btn btn-success">
                SAVE
            </button>
        </div>
    </div>
</form>


@stop