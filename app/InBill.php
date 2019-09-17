<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class InBill extends Model
{
    protected $fillable=['vendor_name','invoice_id','address','phone_number',
        'taxable_amount','vat','total','discount','sub_total'];
    protected $primaryKey = 'in_bill_id';
    
    public function inBillDetails(){
        return $this->hasMany('App\InBillDetail','in_bill_id');
    }
}
