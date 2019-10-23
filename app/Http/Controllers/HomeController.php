<?php

namespace App\Http\Controllers;

use App\FoodMenuItem;
use App\MenuCategory;
use App\Post;
use App\SplashAnnouncement;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    public function index(){
        $aboutUs=Post::where('id',1)->first();
        $categories=MenuCategory::with('menuItems')->get();
        $featured=FoodMenuItem::featured()->get();

        $modal=DB::table('splashAnnouncement')
            ->whereDate('scheduleFrom','<=', Carbon::today())
            ->whereDate('scheduleTo','>=', Carbon::today())
            ->where('status','=','active')
            ->get();

        return view('front.index',compact('aboutUs','categories','featured','modal'));
    }
}
