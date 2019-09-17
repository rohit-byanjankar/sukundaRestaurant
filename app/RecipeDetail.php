<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class RecipeDetail extends Model
{
    protected $primaryKey = 'recipe_detail_id';
    protected $fillable = ['recipe_id','item_id','quantity','measuring_unit'];

    public function recipe(){
        return $this->belongsTo('App\Recipe','recipe_id');
    }
}
