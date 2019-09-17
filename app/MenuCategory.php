<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\FoodMenuItem;


class MenuCategory extends Model
{
    protected $primaryKey = 'category_id';

    public function menuItems(){
    	return $this->hasMany(FoodMenuItem::class,'category_id');
    }
}
