<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $primaryKey = 'order_id';
    protected  $fillable = ['order_id','customer_name','date','note'];

    public function orderLine(){
        return $this->belongsTo('App\OrderLine','order_id');
    }
}
