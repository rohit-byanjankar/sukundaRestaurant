@extends('voyager::master')
@section('content')
    <div class="card card-default">
        <div class="card-body">
            <div class="content">
                <form action="{{isset($payments) ? route('payments.update',$payments->payment_id) : route('payments.store')}}" method="post">
                    @csrf
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Invoice No :</label>
                            <input type="number" name="invoice_no" class="form-control" value="{{isset($payments) ? $payments->invoice_no : ''}}" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Payment Mode :</label>
                            <select  name="payment_mode" class="form-control" id="Selection">
                                <option value='creditCard' {{isset($payments) && $payments->payment_mode == 'creditCard' ? 'selected' : ''}}>Credit Card</option>
                                <option value='cash' {{isset($payments) && $payments->payment_mode == 'cash' ? 'selected' : ''}}>Cash</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Payment Type :</label>
                            <select  name="payment_type" class="form-control">
                                <option value='paid'  {{isset($payments) && $payments->payment_type == 'paid' ? 'selected' : ''}}>Paid</option>
                                <option value='unpaid'  {{isset($payments) && $payments->payment_type == 'unpaid' ? 'selected' : ''}}>Unpaid</option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Payment Status :</label>
                            <input type="text" name="payment_status" class="form-control" value="{{isset($payments) ? $payments->payment_status : ''}}">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Expiry Month :</label>
                            <input type="text" name="expiry_month" class="form-control" value="{{isset($payments) ? $payments->expiry_month : ''}}">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Expiry Year :</label>
                            <input type="text" name="expiry_year" class="form-control" value="{{isset($payments) ? $payments->expiry_year : ''}}">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Tax Amount :</label>
                            <input type="number" name="tax_amount" class="form-control" value="{{isset($payments) ? $payments->tax_amount : ''}}">
                        </div>
                    </div>

                    <div class="toggleOnSelect">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Bank Name :</label>
                                <input type="text" name="bank" class="form-control" value="{{isset($payments) ? $payments->bank_name : ''}}">
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Branch :</label>
                                <input type="text" name="branch" class="form-control" value="{{isset($payments) ? $payments->branch : ''}}">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Card Number :</label>
                                <input type="number" name="card_no" class="form-control" value="{{isset($payments) ? $payments->card_no : ''}}">
                            </div>
                        </div>
                    </div>

                    <div class="form-group col-md-12 text-center">
                        <button type="submit" class="btn btn-success">
                            {{ isset($payments) ? 'EDIT Payment' : 'CREATE Payment!' }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection

@section('javascript')
    <script>
        $(function () {
            $("#Selection").change(function() {
                if($(this).val() === 'cash') {
                    $(".toggleOnSelect").hide();
                }
                else {
                    $(".toggleOnSelect").show();
                }
            });
        });
    </script>
@endsection