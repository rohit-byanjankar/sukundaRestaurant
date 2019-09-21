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

    public  function  orderLineItem($foodID,$quantity){
        if(key_exists($foodID,$this->lineItems)){
            if(!isset($this->lineItems[$foodID])){
                $this->lineItems[$foodID]=$foodID;
                $this->lineItems[$foodID]->qty=$quantity;
            }
            else{
                $this->lineItems[$foodID]->qty=$quantity;
            }
        }
    }
}

