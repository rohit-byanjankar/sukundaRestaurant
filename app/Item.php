<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Item extends Model
{
    protected $primaryKey = 'item_id';
    protected $fillable = ['item_name','quantity','measuring_unit'];    

    public function inBillDetails(){
        return $this->hasMany('App\InBillDetail');
    }
}

