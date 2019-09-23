
<table style="margin-left:2%;color:#fca503;" id="orderCart" class="table table-hover table-condensed table-responsive">
                    <thead>
                    <tr style="background:orange;color:white;">
                        <th style="width:50%">Product</th>
                        <th style="width:15%">Price</th>
                        <th style="width:10%">Qty</th>
                        <th style="width:20%" class="text-right">Total</th>
                        <th style="width:5%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $total = 0 ?>
                    @if(count($items)>0)
                        @foreach($items as $key=>$item)
                            <?php 
                            $subTotal=$item['price']*$item['quantity'];
                            $total+=$subTotal;
                            ?>
                            <tr>
                                <td><!--img src="storage/{{$item['image']}}" height="50px" width="100px"--> {{$item['name']}}</td>
                                <td id="price">{{number_format($item['price'],2)}}</td>
                                <td><input type="number" value="{{$item['quantity']}}" min="1" id="size" class="qty" onchange="updateOrder({{$item['id']}})"></td>
                                <td class='text-right'>{{number_format($subTotal,2)}}</td>
                                <td><a href="{{url('deleteFromOrders/'.$key)}}" title='Remove Item'><span class="fa fa-trash text-danger"></span></a></td>
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td colspan="4"><h3 class="text-center">Empty Order</h3></td>
                       </tr>
                    @endif
                    </tbody>
                    <tfoot>
                    <tr class="visible-xs">
                        <td class="text-right"><strong>Total {{number_format($total,2) }}</strong></td>
                    </tr>
                    <tr>
                        <td class="hidden-xs text-right" colspan="4"><strong>Total {{setting('site.currency').' '.number_format($total,2) }}</strong></td>
                    </tr>
                    </tfoot>
                </table>

@push('scripts')
    <script>
        function updateOrder(id) {
            var product_id = id;
            var new_quantity = $('.qty').val();
            $.ajax({
                url : "{{url('/updateOrder')}}",
                method : 'post',
                data : {
                  quantity : new_quantity,
                  product_id : product_id,
                  _token: '{{csrf_token()}}'
                },
                success : function(response) {
                    //$(inputQuantityElement).val(new_quantity);
                }
            });
        }
    </script>
@endpush