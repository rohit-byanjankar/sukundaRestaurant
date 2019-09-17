<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class OutBill extends Model
{
    protected $fillable=['sub_total','item_id','discount','customer_name','address','phone_number',
        'taxable_amount','vat','total','discount','sub_total'];
    protected $primaryKey = 'out_bill_id';

}
