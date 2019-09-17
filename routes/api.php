<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('menu-items','Api\MenuItemControllerApi@getMenuItem');
Route::post('menu-items','Api\MenuItemControllerApi@setMenuItem');
Route::put('menu-items/{id}','Api\MenuItemControllerApi@updateMenuItem');
Route::get('menu-items/{id}','Api\MenuItemControllerApi@showMenuItem');
Route::get('order','Api\OrderControllerApi@getOrder');
Route::post('order','Api\OrderControllerApi@setOrder');
Route::get('order/{id}','Api\OrderControllerApi@editOrder');
