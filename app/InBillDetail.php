<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class InBillDetail extends Model
{
    public $fillable=['in_bill_id','item_id','rate','amount','quantity','measuring_unit'];
    protected $primaryKey = 'in_bill_detail_id';

    public function inBill(){
        return $this->belongsTo('App\InBill','in_bill_id');
    }
}
