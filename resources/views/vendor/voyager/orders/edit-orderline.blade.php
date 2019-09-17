@extends('voyager::master')

@section('content')

<div class="card card-default">
    <div class="card-body">
        <div class="content">
            <form action="{{route('order-lines.update',$order_details->order_line_id)}}" method="post">
                @csrf
                <input type="hidden" name="order_line_id" value="{{$order_details->order_line_id}}">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Order Id</label>
                            <input type="number" name="order_id" value="{{$order_details->order_id}}" class="form-control" readonly required>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Particular</label>
                            <select class="form-control particular" name="particular">
                                @foreach($food_menu_items as $food_menu_item)
                                <option value="{{$food_menu_item->food_menu_item_id}}" <?php if ($food_menu_item->food_menu_item_id == $order_details->food_menu_item_id) echo "selected"; ?>>{{$food_menu_item->item_name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Quantity</label>
                            <input type="number" name="quantity" value="{{$order_details->quantity}}" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Rate</label>
                            <input type="number" name="rate" value="{{$order_details->rate}}" class="form-control" required>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Amount</label>
                            <input type="number" name="amount" value="{{$order_details->amount}}" class="form-control" required>
                        </div>
                    </div>

                    <div class="col-md-12">
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
                                            <input type="radio" name="particular_status" value="{{$os->status}}" <?php if ($order_details->particular_status == $os->status) echo "checked"; ?>><?php $w = ucwords($os->status);
                                                                                                                                                                                                echo $w; ?>
                                        </label>
                                    </td>
                                </tr>
                                @endforeach
                                </tr>
                            </tbody>
                        </table>
                    </div>


                    <button type="submit" class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>
@stop