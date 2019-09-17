<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Payment extends Model
{
    protected $fillable=['invoice_no','bank','card_no','expiry_year','expiry_month','payment_type','payment_mode',
        'payment_status','branch','tax_amount'];
    protected $primaryKey = 'payment_id';
}
