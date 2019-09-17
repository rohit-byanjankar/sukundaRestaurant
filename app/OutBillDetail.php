<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OutBillDetail extends Model
{
    public $fillable=['out_bill_id','food_menu_item_id','rate','amount','quantity'];
    protected $primaryKey = 'out_bill_detail_id';
}
