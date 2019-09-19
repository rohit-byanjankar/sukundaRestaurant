<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function __construct(){
        $this->lineItems=array();
}
protected $primaryKey = 'order_id';
    protected  $fillable = ['order_id','customer_name','date','note'];

    public function orderLine(){
        return $this->belongsTo('App\OrderLine','order_id');
    }

    public  function  orderLineItem($foodItem,$quantity){
        if(!isset($this->lineItems[$foodItem->food_menu_item_id])){
            $this->lineItems[$foodItem->food_menu_item_id]=$foodItem->item_name;
            $this->lineItems[$foodItem->food_menu_item_id]=$quantity;
        }
        else{
            $this->lineItems[$foodItem->food_menu_item_id]->qty=$quantity;
        }
    }
}
