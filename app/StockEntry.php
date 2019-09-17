<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class StockEntry extends Model
{
    protected $primaryKey = 'stock_entry_id';
    protected $fillable = ['item_id','date','item_name','quantity','measuring_unit','invoice_id'];
}
