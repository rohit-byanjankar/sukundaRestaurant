@extends('front.layouts.layout')
@section('contents')
    <table id="orderCart" class="table table-hover table-condensed">
        <thead>
        <tr>
            <th style="width:30%">Product</th>
            <th style="width:10%">Price</th>
            <th style="width:10%">Quantity</th>
            <th style="width:22%" class="text-center">Subtotal</th>
            <th style="width:10%"></th>
        </tr>
        </thead>
        <tbody>

        <?php $total = 0 ?>

        @if(session('orderCart'))
            <?php
                $orders=session('orderCart');
                $items=$orders->getCartItems();
               // dd($items);
            ?>
            @foreach($items as $item)
                <tr>
                    <td><img src="storage/{{$item['image']}}" height="50px" width="100px"></td>
                    <td>{{$item['price']}}</td>
                    <td>{{$item['quantity']}}</td>
                    <td></td>
                </tr>

            @endforeach
        @else
            <h3 class="text-center">Empty Order</h3>
        @endif
        </tbody>
        <tfoot>
        <tr class="visible-xs">
            <td class="text-center"><strong>Total {{ $total }}</strong></td>
        </tr>
        <tr>
            <td><a href="{{ url('/') }}" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
            <td colspan="2" class="hidden-xs"></td>
            <td class="hidden-xs text-center"><strong>Total ${{ $total }}</strong></td>
        </tr>
        </tfoot>
    </table>

@endsection