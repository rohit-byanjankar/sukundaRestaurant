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
                                <td>{{number_format($item['price'],2)}}</td>
                                <td>{{$item['quantity']}}</td>
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