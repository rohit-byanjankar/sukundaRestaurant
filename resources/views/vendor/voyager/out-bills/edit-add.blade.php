@extends('voyager::master')
@section('content')
    <div class="card card-default">
        <div class="card-body">
            <div class="content">
                <form action="{{isset($bill) ? route('outBill.update',$bill->out_bill_id) : route('outBill.store')}}" method="post">
                    @csrf
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Customer Name</label>
                            <input type="text" name="customer_name" class="form-control" value="{{isset($bill) ? $bill->customer_name : ''}}" required>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Address</label>
                            <input type="text" name="address" class="form-control" value="{{isset($bill) ? $bill->address : ''}}">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="text" name="phone_number" class="form-control" value="{{isset($bill) ? $bill->phone_number : ''}}">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Item</label>
                            <select class="form-control ItemList" name="item">
                                @foreach($items as $item)
                                    <option value="{{$item->item_id}}">{{$item->item_name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12">
                                <table class="table table-bordered" id="item_table">
                                    <thead>
                                    <tr>
                                        <th class="col-md-5">Particulars</th>
                                        <th class="col-md-3">Quantity</th>
                                        <th class="col-md-2">Rate</th>
                                        <th class="col-md-2">Amount</th>
                                        <th><button type="button" name="add" class="btn btn-success btn-sm add"><span class="glyphicon glyphicon-plus"></span></button></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @if(isset($bill_details))
                                        @foreach($bill_details as $ol)
                                            <tr>
                                                <td class='col-md-6'>
                                                    <input type='text' class='form-control selectFoodItem' name='particular[]' value="{{$ol->particular}}">
                                                </td>
                                                <td class='col-md-1'>
                                                    <input type='number' class='form-control' name='quantity[]' value="{{$ol->quantity}}" min=1 required />
                                                </td>
                                                <td class='col-md-1'>
                                                    <input type='number' class='form-control' name='rate[]' value="{{$ol->rate}}" min=1>
                                                </td>
                                                <td class='col-md-3'>
                                                    <input type='number' class='form-control' name='amount[]' value="{{$ol->amount}}" min=10>
                                                </td>
                                                <td>
                                                    <a onclick="return confirm('Are you sure?')" name='remove' class='btn btn-danger btn-sm remove' href="{{route('inBill.delete',$ol->in_bill_detail_id)}}" style="text-decoration: none">
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
                                                <td><input type="number" min="0" name="sub_total" id="sub_total" class="form-control" value="{{isset($bill) ? $bill->sub_total : ''}}"  readonly></td>
                                            </tr>
                                            <tr>
                                                <th class="col-md-9 text-center">Discount </th>
                                                <td><input type="number" min="0" name="discount" id="discount" class="form-control" value="{{isset($bill) ? $bill->discount : ''}}" onblur='updateAmounts()' required></td>
                                            </tr>
                                            <tr>
                                                <th class="col-md-9 text-center">Total Taxable Amount</th>
                                                <td><input type="number" min="0" name="taxable_amount" id="taxable_amount" class="form-control" value="{{isset($bill) ? $bill->taxable_amount : ''}}" readonly></td>
                                            </tr>

                                            <tr>
                                                <th class="col-md-9 text-center">VAT</th>
                                                <td><input type="number" name="vat" id="vat" class="form-control" value="{{isset($bill) ? $bill->vat : ''}}" onblur='updateAmounts()' min=0 required></td>
                                            </tr>

                                            <tr>
                                                <th class="col-md-9 text-center">Total Amount</th>
                                                <td><input type="number" name="total" id="total" class="form-control" value="{{isset($bill) ? $bill->total : '0'}}" min=0 readonly></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-success">
                            {{ isset($bill) ? 'EDIT bill' : 'CREATE bill!' }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@stop

@section('javascript')
    <script>
        var rates = {@foreach($foodItem as  $food){{$food->food_menu_item_id.":".$food->price.","}}@endforeach};

        function updateAmounts(){
            updateWageAmount();
            updateTotalAmount();
            updateTaxableAmount()
        }

        function updateWageAmount(){
            var subTotal = 0;
            for(var i=1; i<count; i++){
                total =($("#quantity"+i).val() * (Number($("#rate"+i).val())));
                $("#amount"+i).val(total);
                subTotal =subTotal + total;
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

        function changeRate(event) {
            var row = event.id.charAt(4);
            var selector = "#rate"+row;
            $(selector).val(rates[event.value]);
            updateAmounts();
        }

        $(document).ready(function() {
            count = 1;
            $(document).on('click', '.add', function () {
                var html = '';
                html += '<tr>';
                html += "<td class='col-md-6'>" +
                    "<select name='particular[]' id ='name" + count + "' class='form-control FoodItem' onchange=\"changeRate(this)\">" +
                        @foreach($foodItem as $food)
                            "<option value={{$food->food_menu_item_id}}>{{$food->item_name}} </option> " +
                        @endforeach
                            "</select> " +
                    "</td>";
                html += "<td><input type='number' class='form-control' id ='quantity"+count+"' name = 'quantity[]' min=1 required value=1 onblur='updateAmounts\(\)'/></td>";
                html += "<td><input type='number' class='form-control' id ='rate"+count+"' value='0' class='form-control' name = 'rate[]' min='0' readonly></td>";
                html += "<td class='col-md-3'><input type='number' class='form-control'id='amount"+count+"' name = 'amount[]' value='0' readonly></td>";
                html += "<td><button type='button' name='remove' class='btn btn-danger btn-sm remove' min=0 ><span class='glyphicon glyphicon-minus'></span></button></td></tr>";
                $('#item_table').append(html);
                count++;

                $('.FoodItem').select2();
            });
            $(document).on('click', '.remove', function () {
                count = count - 1;
                $(this).closest('tr').remove();
            });
        });
    </script>
@stop

