<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FoodMenuItem extends Model
{
    public $fillable=['item_name','category_id','price','description','recipe_id','image'];
    protected $primaryKey = 'food_menu_item_id';

    public function scopeFeatured($query){
        return $query->where('is_special_dish',1);
    }
}
