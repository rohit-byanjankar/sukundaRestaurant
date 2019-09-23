{{ Illuminate\Mail\Markdown::parse($slot) }}
@php
    if(session('orderCart')){
        $orders=session('orderCart');
            $items=$orders->getCartItems();
        }
@endphp
<h1> Ordered items are as follows:</h1>
<table>
<thead>
<tr style="background:orange;color:white;">
    <th style="width:50%">Product</th>
    <th style="width:15%">Price</th>
    <th style="width:10%">Qty</th>
    <th style="width:20%" class="text-right">Total</th>
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
                <td>{{$item['name']}}</td>
                <td>{{number_format($item['price'],2)}}</td>
                <td>{{$item['quantity']}}</td>
                <td class='text-right'>{{number_format($subTotal,2)}}</td>
            </tr>
        @endforeach
    @endif
</tbody>
</table>
@php
    if(session('orderCart')){
        $orderCart=session()->get('orderCart');
         $orderCart->cartItems=[];
        }
@endphp

