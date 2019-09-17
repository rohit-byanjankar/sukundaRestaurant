<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Recipe extends Model
{
    protected $primaryKey = 'recipe_id';
    protected $fillable = ['recipe_name'];

    public function recipeDetails(){
        return $this->hasMany('App\RecipeDetail','recipe_id');
    }
}
