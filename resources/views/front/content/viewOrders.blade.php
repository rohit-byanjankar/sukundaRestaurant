<?php 
if(session('orderCart')){
    $orders=session('orderCart');
    $items=$orders->getCartItems();
}else{
    $items=[];
}
?>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="fa fa-cart-plus list-icon"></span>Your Orders<span class="badge">{{count($items)}}</span><span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-cart" style="left:-100%" role="menu">
              <li>
                 @include('front.content.order_list_table')
                
              </li>
              <li style="width:100%;padding:0 10px">
                <a href="#" data-toggle="modal" data-target="#orderConfirmationModal" class="text-center btn btn-warning pull-right">Place Order</a></li>

          </ul>
 <div class="modal" tabindex="-1" role="dialog" id="orderConfirmationModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirm Your Order</h5>
      </div>
      <form method="post" action="{{url('confirmOrder')}}">
        {{csrf_field()}}
      <div class="modal-body">
        @include('front.content.order_list_table')
        <h3 class="text-warning">Your Details</h3>
        <div class="form-group">
            <input type="hidden" value="{{json_encode($items)}}" name="items">
            <input type="email" class="form-control" placeholder="Email" name="email" required="" />
            <input type="tel" class="form-control" placeholder="Mobile Number" name="phone" required="" />
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Confirm</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </form>
    </div>
  </div>
</div>


