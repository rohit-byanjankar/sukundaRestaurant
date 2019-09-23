@extends('voyager::master')

@section('content')
<div class="card card-default">
    <div class="card-body">
        <div class="content">
            <form action="{{isset($bill) ? route('inBill.update',$bill->in_bill_id) : route('inBill.displayDetail')}}" method="post">
                @csrf
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Inovice Id</label>
                        <input type="number" name="invoice_id" class="form-control" value="{{isset($bill) ? $bill->invoice_id : ''}}" required>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group">
                        <label>Vendor Name</label>
                        <input type="text" name="vendor_name" class="form-control" value="{{isset($bill) ? $bill->vendor_name : ''}}" required>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group">
                        <label>PAN Number</label>
                        <input type="text" name="pan_number" class="form-control" value="{{isset($bill) ? $bill->pan_number : ''}}">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Phone Number</label>
                        <input type="text" name="phone_number" class="form-control" value="{{isset($bill) ? $bill->phone_number : ''}}" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" name="address" class="form-control" value="{{isset($bill) ? $bill->address : ''}}" required>
                    </div>
                </div>

                <div class="col-md-12">
                    <table class="table table-bordered col-md-12" id="item_table">
                        <thead>
                            <tr style="width:100%">
                                <th style="width: 20%">Particulars</th>
                                <th style="width: 20%">Quantity</th>
                                <th style="width: 10%">Measuring Unit</th>
                                <th style="width: 10%">Rate</th>
                                <th style="width: 20%">Amount</th>
                                <th style="width: 20%"><button type="button" name="add" class="btn btn-success btn-sm add"><span class="glyphicon glyphicon-plus"></span></button></th>
                            </tr>
                        </thead>
                        <tbody>
                            @if(isset($bill_details))
                            @foreach($bill_details as $ol)
                            <tr>
                                <td class='col-md-4'>
                                    <select class="form-control" name="particular[]">
                                        @for($i = 0; $i < sizeof($items);$i++) <option value="{{$items[$i]->item_name}}" <?php if ($items[$i]->item_name == $ol->item_name) echo "selected"; ?>>{{$items[$i]->item_name}}</option>
                                            @endfor
                                    </select>
                                </td>
                                <td class='col-md-2'>
                                    <input type='number' class='form-control quantity' name='quantity[]' value="{{$ol->quantity}}" min=1 required />
                                </td>
                                <td class='col-md-2'>
                                    <select class="form-control" name="measuring_unit[]">
                                        @for($i = 0; $i < sizeof($measuring_units);$i++) <option value="{{$measuring_units[$i]->name}}" <?php if ($measuring_units[$i]->name == $ol->measuring_unit) echo "selected"; ?>>{{$measuring_units[$i]->name}}</option>
                                            @endfor
                                    </select>
                                </td>
                                <td class='col-md-2'>
                                    <input type='number' class='form-control rate' name='rate[]' value="{{$ol->rate}}" min=1>
                                </td>
                                <td class='col-md-2'>
                                    <input type='number' class='form-control amount' name='amount[]' value="{{$ol->amount}}" min=10>
                                </td>
                                <td>
                                    <a onclick="return confirm('Are you sure?')" name='remove' class='btn btn-danger btn-sm remove' href="{{route('inBillDetail.delete',$ol->in_bill_detail_id)}}" style="text-decoration: none">
                                        <span class='glyphicon glyphicon-minus'></span>
                                    </a>
                                </td>
                            </tr>
                            @endforeach
                            @endif
                        </tbody>
                    </table>

                    <div class="row">
                        <div class="col-md-12">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th class="col-md-9 text-center">Sub Total</th>
                                        <td><input type="number" min="0" name="sub_total" id="sub_total" class="form-control" value="{{isset($bill) ? $bill->sub_total : ''}}" readonly></td>
                                    </tr>
                                    <tr>
                                        <th class="col-md-9 text-center">Discount</th>
                                        <td><input type="number" min="0" name="discount" id="discount" class="form-control" value="{{isset($bill) ? $bill->discount : ''}}" onblur='updateAmounts()' required></td>
                                    </tr>
                                    <tr>
                                        <th class="col-md-9 text-center">Total Taxable Amount</th>
                                        <td><input type="number" min="0" name="taxable_amount" id="taxable_amount" class="form-control" value="{{isset($bill) ? $bill->taxable_amount : ''}}" readonly></td>
                                    </tr>

                                    <tr>
                                        <th class="col-md-9 text-center">VAT</th>
                                        <td><input type="number" name="vat" id="vat" class="form-control" value="{{isset($bill) ? $bill->vat : ''}}" min=0 onblur='updateAmounts()' required></td>
                                    </tr>

                                    <tr>
                                        <th class="col-md-9 text-center">Total Amount</th>
                                        <td><input type="number" name="total" id="total" class="form-control" value="{{isset($bill) ? $bill->total : ''}}" min=0 readonly></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="date" value="{{ date('Y/m/d')}}">
                <div class="form-group">
                    <button type="submit" class="btn btn-success">
                        {{ isset($bill) ? 'UPDATE BILL' : 'CREATE BILL' }}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

@stop

@section('javascript')
<script>
    function updateAmounts(){
        updateWageAmount();
        updateTaxableAmount()
        updateTotalAmount()
    }

    function updateWageAmount(){
        var subTotal = 0;
        for(var i=1; i<count; i++){
            total =($("#quantity"+i).val() * (Number($("#rate"+i).val())));
            subTotal =subTotal + total;
            $("#amount"+i).val(total);
            $("#sub_total").val(subTotal);
        }
    }

    function updateTaxableAmount(){
        var taxTotal = $('#sub_total').val() - $('#discount').val();
        $('#taxable_amount').val(taxTotal);
    }

    function updateTotalAmount(){
        var sumTotal = +$('#taxable_amount').val() + +$('#vat').val();
        $('#total').val(sumTotal);
    }

    $(document).ready(function() {
        count = 1;
        $(document).on('click', '.add', function () {
            var html = '';
            html += '<tr>';
            html += "<td class='col-md-5'><select name='particular[]' class='form-control selectTo' >";
                @foreach($items as $item)
                    html +=  "<option value=\"{{$item->item_id}}\" class=\"form-control\">{{$item->item_name}}</option>";
                @endforeach
                html +=  "</select></td>";
            html += "<td><input type='number' class='form-control'  id ='quantity"+count+"' name = 'quantity[]' min=1 required value=1 onblur='updateAmounts\(\)'/></td>";
            html += "<td class='col-md-2'><select name=\"measuring_unit[]\" class=\"form-control\" required>" +
                "@foreach($measuring_units as $measuring_unit)" +
                "<option value=\"{{$measuring_unit->name}}\" class=\"form-control\">{{$measuring_unit->name}}</option>" +
                "@endforeach" +
                "</select></td>";
            html += "<td class='col-md-1'><input type='number' class='form-control ' id ='rate"+count+"' value' min=1 onblur='updateAmounts\(\)' required></td>";
            html += "<td class='col-md-2'><input type='number' class='form-control ' id='amount"+count+"' name = 'amount[]' min=100 readonly></td>";
            html += "<td><button type='button' name='remove' class='btn btn-danger btn-sm remove' min=0 ><span class='glyphicon glyphicon-minus'></span></button></td></tr>";
            $('#item_table').append(html);
            count++;
            updateAmounts();

            $('.selectTo').select2(); //Select2 search list
        });

        $(document).on('click', '.remove', function () {
            count = count - 1;
            $(this).closest('tr').remove();
            updateAmounts();
        });
    });
</script>
@stop