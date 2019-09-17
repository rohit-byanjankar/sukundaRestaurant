<?php

namespace App\Http\Controllers;

use App\FoodMenuItem;
use App\MenuCategory;
use App\Post;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index(){
        $aboutUs=Post::where('id',1)->first();
        $categories=MenuCategory::with('menuItems')->get();
        $featured=FoodMenuItem::featured()->get();
        return view('front.index',compact('aboutUs','categories','featured'));
    }
}
