@extends('voyager::master')
@section('javascript')
    <script>
        var rates = {@foreach($food_menu_items as  $food){{$food->food_menu_item_id.":".$food->price.","}}@endforeach};

        function updateAmounts(){
            updateWageAmount();
        }

      function updateWageAmount(){
            var total = 0;
            for(var i=1; i<count; i++){
                total =($("#quantity"+i).val() * (Number($("#rate"+i).val())));
            $("#amount"+i).val(total);
            }
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
                html += "<td class='col-md-7'>" +
                    "<select name='particular[]' id ='name" + count + "' class='form-control FoodItem' onchange=\"changeRate(this)\">";
                @foreach($food_menu_items as $food)
                    html += "<option value={{$food->food_menu_item_id}}>{{$food->item_name}} </option> ";
                @endforeach
                    html += "</select></td>";
                html += "<td><input type='number' class='form-control' id ='quantity"+count+"' name = 'quantity[]' min=1 required value=1 onblur='updateAmounts\(\)' /></td>";
                html += "<td><input type='number' id ='rate"+count+"' value='+rates[1]+' class='form-control' name = 'rate[]' min='0' readonly></td>";
                html += "<td><input type='number' class='form-control' id='amount"+count+"' name = 'amount[]' value='0' readonly></td>";
                html += "<td>" +
                    "<select name='particular_status[]'>" +
                    "@foreach($order_status as $order_stat)" +
                    "<option value='{{$order_stat->status}}'>" +
                    "<?php $w = ucwords($order_stat->status);
                        echo $w; ?> </option>" +
                    "@endforeach" +
                    "</select>" +
                    "</td>";
                html += "<td><button type='button' name='remove' class='btn btn-danger btn-sm remove' min=0 ><span class='glyphicon glyphicon-minus'></span></button></td></tr>";
                $('#item_table').append(html);
                count++;

                $('.FoodItem').select2();
                updateAmounts();
            });

            $(document).on('click', '.remove', function () {
                count = count - 1;
                $(this).closest('tr').remove();
                updateAmounts();
            });
        });
    </script>
@stop
@section('content')
<div class="card card-default">
    <div class="card-body">
        <div class="content">
            <form action="{{isset($order_line) ? route('orders.update',$order->order_id) : route('orders.store')}}" method="post">
                @csrf
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Customer Name</label>
                        <input type="text" name="customer_name" class="form-control" value="{{isset($order) ? $order->customer_name : ''}}" required>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Date</label>
                        <input type="date" name="date" class="form-control" value="{{isset($order) ? $order->date : ''}}">
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label>Payment Status</label>
                        <select class="form-control" name="paid">
                            <option value="1" <?php if (isset($order)) {
                                                    if ($order->paid == 1) echo "selected";
                                                } ?>>Paid</option>
                            <option value="0" <?php if (isset($order)) {
                                                    if ($order->paid == 0) echo "selected";
                                                } else {
                                                    echo "selected";
                                                } ?>>Not Paid</option>
                        </select>
                    </div>
                </div>
                
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Notes</label>
                        <textarea class="form-control" name="note">{{isset($order) ? $order->note : ''}}</textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="col-md-12">
                                <table class="table table-bordered" id="item_table">
                                    <thead>
                                        <tr>
                                            <th class="col-md-4">Particulars</th>
                                            <th class="col-md-1">Quantity</th>
                                            <th class="col-md-2">Rate</th>
                                            <th class="col-md-2">Amount</th>
                                            <th class="col-md-2">Status</th>
                                            <th><button type="button" name="add" class="btn btn-success btn-sm add"><span class="glyphicon glyphicon-plus"></span></button></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if(isset($order_line))
                                        @foreach($order_line as $ol)
                                        
                                        <tr>
                                            <td class='col-md-7'>
                                                <select class="form-control particular" name="particular[]">
                                                    @foreach($food_menu_items as $food_menu_item)
                                                    <option value="{{$food_menu_item->food_menu_item_id}}" <?php if ($food_menu_item->food_menu_item_id == $ol->food_menu_item_id) echo "selected"; ?>>{{$food_menu_item->item_name}}</option>
                                                    @endforeach
                                                </select> </td>
                                            <td>
                                                <input type='number' class='form-control quantity' name='quantity[]' value="{{$ol->quantity}}" min=1 required />
                                            </td>
                                            <td>
                                                <input type='number' class='form-control rate' name='rate[]' value="{{$ol->rate}}" min=1>
                                            </td>
                                            <td>
                                                <input type='number' class='form-control amount' name='amount[]' value="{{$ol->amount}}" min=1>
                                            </td>
                                            <td>
                                                <select name="particular_status[]">
                                                    @foreach($order_status as $order_stat)
                                                    <option value="{{$order_stat->status}}" <?php if ($order_stat->status == $ol->particular_status) echo "selected"; ?>>
                                                        <?php $w = ucwords($order_stat->status);
                                                        echo $w; ?></option>
                                                    @endforeach
                                                </select>
                                            </td>
                                            <td>
                                                <a onclick="return confirm('Are you sure?')" name='remove' class='btn btn-danger btn-sm remove' href="{{route('order-lines.delete',$ol->order_line_id)}}" style="text-decoration: none">
                                                    <span class='glyphicon glyphicon-minus'></span>
                                                </a>
                                            </td>
                                        </tr>
                                        @endforeach
                                        @endif
                                    </tbody>
                                </table>

                                <table class="col-md-12">
                                    <tbody>
                                        <tr class="col-md-12">
                                            <div class="form-group">
                                                <label>Order Status</label>
                                            </div>
                                            @foreach($order_status as $os)
                                        <tr>
                                            <td>
                                                <label>
                                                    <input type="radio" name="order_status" value="{{$os->status}}" <?php if (isset($order)) {
                                                                                                                        if ($order->order_status == $os->status) echo "checked";
                                                                                                                    } else {
                                                                                                                        if ($os->status == 'pending') echo "checked";
                                                                                                                    } ?>><?php $w = ucwords($os->status);
                                                                                                                            echo $w; ?>
                                                </label>
                                            </td>
                                        </tr>
                                        @endforeach
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success">
                        {{ isset($order) ? 'UPDATE ORDER' : 'ADD ORDER!' }}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@stop

