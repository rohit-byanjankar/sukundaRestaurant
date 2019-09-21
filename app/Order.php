<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $primaryKey = 'order_id';
    protected $fillable = ['order_id','customer_name','date','note'];

    public $cartItems;
    
    public function __construct(){
        $this->lineItems=[];
    }
    
    
    public function orderLine(){
        return $this->belongsTo('App\OrderLine','order_id');
    }

    public  function  orderLineItem($foodItem,$quantity){
        //cart item does not exist make new array with food menu item id as key
        //else we just add the quantity
        if(!isset($this->cartItems[$foodItem->food_menu_item_id])){
            $this->cartItems[$foodItem->food_menu_item_id]=array(
                                                            'quantity'=>$quantity,
                                                            'price'=>$foodItem->price,
                                                            'name'=>$foodItem->item_name,
                                                            'id'=>$foodItem->food_menu_item_id
                                                            );
        }
        else{
            $this->cartItems[$foodItem->food_menu_item_id]['quantity']+=$quantity;
        }
    }
}
