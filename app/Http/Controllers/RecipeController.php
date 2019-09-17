<?php

namespace App\Http\Controllers;

use App\Item;
use App\MeasuringUnit;
use App\Recipe;
use App\RecipeDetail;
use Illuminate\Http\Request;

class RecipeController extends Controller
{
    public function index()
    {
        $recipes = Recipe::all();
        // dd($recipes);
        return view('voyager::recipes.browse', compact('recipes'));
    }

    public function create()
    {
        $items = Item::all();
        $measuring_units = MeasuringUnit::all();
        return view('voyager::recipes.edit-add', compact('items', 'measuring_units'));
    }

    public function store(Request $request)
    {
        // dd($request);
        $recipe = Recipe::create([
            'recipe_name' => $request->recipe_name
        ]);
        for ($i = 0; $i < sizeof($request->item_id); $i++) {
            $recipe_detail = RecipeDetail::create([
                'recipe_id' => $recipe->recipe_id,
                'item_id' => $request->item_id[$i],
                'quantity' => $request->quantity[$i],
                'measuring_unit' => $request->measuring_unit[$i]
            ]);
        }
        return redirect(route('voyager.recipe.index'));
    }

    public function editRecipe($id)
    {
        $recipe = Recipe::find($id);
        $recipeDetails = RecipeDetail::where('recipe_id', $id)->get();
        $items = Item::all();
        $measuring_units = MeasuringUnit::all();
        return view('voyager::recipes.edit-add', compact('recipe', 'recipeDetails', 'items'))->with('measuring_units', $measuring_units);
    }

    public function updateRecipe(Request $request, $id)
    {
        // dd($request);
        $recipe = Recipe::find($id);
        $recipe->recipe_name = $request->recipe_name;
        
        $recipeDetail = RecipeDetail::where('recipe_id',$request->recipe_id)->get();
        for($i = 0; $i < $recipeDetail->count(); $i++){
            $recipeDetail[$i]->item_id = $request->item_id[$i];
            $recipeDetail[$i]->quantity = $request->quantity[$i];
            $recipeDetail[$i]->measuring_unit = $request->measuring_unit[$i];
            // dd($recipeDetail[$i]);
            $recipeDetail[$i]->save();
        }
        for($i = $recipeDetail->count(); $i < sizeof($request->item_id); $i++){
            $recipeDetail2 = RecipeDetail::create([
                'recipe_id' => $recipe->recipe_id,
                'item_id' => $request->item_id[$i],
                'quantity' => $request->quantity[$i],
                'measuring_unit' => $request->measuring_unit[$i]
            ]);
        }
        $recipe->save();
    }

    public function editRecipeDetail($id){
        $recipe_detail = RecipeDetail::find($id);
        $items = Item::all();
        $measuring_units = MeasuringUnit::all();
        return view('voyager::recipes.edit-recipedetail',compact('recipe_detail','items','measuring_units'));
    }
    
    public function updateRecipeDetail(Request $request, $id){
        
        $recipe_detail = RecipeDetail::find($id);
        $recipe_detail->item_id =  $request->item_id;
        $recipe_detail->quantity = $request->quantity;
        $recipe_detail->measuring_unit = $request->measuring_unit;
        $recipe_detail->save();
        return redirect(route('recipe.show',$request->recipe_id));
    }

    public function viewRecipeDetail($id)
    {
        $recipe = Recipe::find($id);
        $recipe_details = RecipeDetail::where('recipe_id', $id)->get();
        $index = 0;
        foreach($recipe_details as $recipe_detail){
            $recipe_detail->item_name = Item::where('item_id',$recipe_detail->item_id)->first()->item_name;
        }
        return view('voyager::recipes.read', compact('recipe','recipe_details'));
    }

    public function deleteRecipe($id)
    {
        $recipe = Recipe::find($id);
        $recipe->recipeDetails()->delete();
        $recipe->delete();
        return redirect()->back();
    }

    public function deleteRecipeDetail($id)
    {
        $recipeDetail = RecipeDetail::find($id);
        $recipeDetail->delete();
        return redirect()->back();
    }
}
