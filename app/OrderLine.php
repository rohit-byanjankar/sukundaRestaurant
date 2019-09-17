<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class OrderLine extends Model
{
    protected $primaryKey = 'order_line_id';
    protected $fillable = ['order_line_id','order_id','food_menu_item_id','quantity','rate','amount'];
    
    public function order(){
        return $this->hasMany('App\OrderLine','order_id');
    }
}
