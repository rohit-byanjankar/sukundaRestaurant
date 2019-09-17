<?php

namespace App\Http\Controllers\api;

use App\FoodMenuItem;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class MenuItemControllerApi extends Controller
{
    public function getMenuItem(){
        $menuItem=FoodMenuItem::paginate(6);

        if ($menuItem->count() > 0){
            return response()->json(['data'=>$menuItem,'message'=>'All food menu items retrieved succesfully']);
        }else{
            return response()->json(['message'=>'No food menu items found']);
        }
    }

    public function showMenuItem($id){
        $menuItem=FoodMenuItem::find($id);

        if ($menuItem){
            return response()->json(['data'=>$menuItem,'message'=>'Food menu item retrieved succesfully']);
        }else{
            return response()->json(['message'=>'No food menu items found']);
        }
    }

    public function setMenuItem(Request $request){
        $menuItem=FoodMenuItem::create([
           'item_name' => $request->item_name,
           'category_id' => $request->category_id,
           'recipe_id' => $request->recipe_id,
           'image' => $request->image,
           'price' => $request->price,
           'description' => $request->description,
        ]);

        return response()->json(['data'=>$menuItem,'message'=>'Item inserted succesfully']);
    }

    public function updateMenuItem(Request $request,$id){
        $menuItem=FoodMenuItem::find($id);

           $menuItem->item_name = $request->item_name;
           $menuItem->category_id = $request->category_id;
           $menuItem->recipe_id = $request->recipe_id;
           $menuItem->image = $request->image;
           $menuItem->price = $request->price;
           $menuItem->description = $request->description;

           $menuItem->save();
        return response()->json(['data'=>$menuItem,'message'=>'Item updated succesfully']);
    }
}
