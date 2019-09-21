<?php
use App\Http\Controllers\OrderController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','HomeController@index')->name('home');
Route::post('book','BookingController@booking')->name('book');
Route::post('addToOrder','OrderController@addToOrder')->name('addToOrder');
Route::post('deleteFromOrders/{id}','OrderController@deleteFromOrders')->name('deleteFromOrders');
Route::get('viewOrders',function (){
    return view('front.content.viewOrders');
})->name('viewOrders');

Route::get('/pos', function () {
    return view('front.pos');
});

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    //Route for InBills
    Route::get('in-bills','InBillController@InBillindex')->name('voyager.in-bills.index');
    Route::get('in-bills/create','InBillController@createInBill')->name('inBill.create');
    Route::post('in-bills','InBillController@store')->name('inBill.store');
    Route::any('in-bills/edit/{id}','InBillController@editInBill')->name('inBill.edit');
    Route::any('in-bills/delete/{id}','InBillController@deleteInBill')->name('inBill.delete');
    Route::any('in-bills/update/{id}','InBillController@updateInBill')->name('inBill.update');
    Route::post('in-bills/view-details','InBillController@displayDetail')->name('inBill.displayDetail');

    //Route for InBills Detail
    Route::any('/in-bills/in-bills-detail/{id}','InBillController@viewInBillDetail')->name('inBillDetail.view');
    Route::get('/in-bills/in-bills-detail/{id}/edit','InBillController@editInBillDetail')->name('inBillDetail.edit');
    Route::any('/in-bills/in-bills-detail/{id}/update','InBillController@updateInBillDetail')->name('inBillDetail.update');
    Route::any('/in-bills/in-bills-detail/{id}/delete','InBillController@deleteInBillDetail')->name('inBillDetail.delete');

    //Route for OutBills
    Route::get('out-bills','outBillController@outBillindex')->name('voyager.out-bills.index');
    Route::get('out-bills/create','outBillController@createOutBill')->name('outBill.create');
    Route::post('out-bills','outBillController@store')->name('outBill.store');
    Route::any('out-bills/edit/{id}','outBillController@editOutBill')->name('outBill.edit');
    Route::any('out-bills/delete/{id}','outBillController@deleteOutBill')->name('outBill.delete');
    Route::any('out-bills/update/{id}','outBillController@updateOutBill')->name('outBill.update');

    //Route for OutBills Detail
    Route::any('/out-bills/out-bills-detail/{id}','outBillController@viewOutBillDetail')->name('outBillDetail.view');
    Route::get('/out-bills/out-bills-detail/{id}/edit','outBillController@editOutBillDetail')->name('outBillDetail.edit');
    Route::any('/out-bills/out-bills-detail/{id}/update','outBillController@updateOutBillDetail')->name('outBillDetail.update');
    Route::any('/out-bills/out-bills-detail/{id}/delete','outBillController@deleteOutBillDetail')->name('outBillDetail.delete');

    //Routes for orders
    Route::get('orders','OrderController@indexOrder')->name('voyager.orders.index');//order index page
    Route::get('orders/create','OrderController@createOrder')->name('orders.create');//create order page
    Route::any('orders/edit/{id}','OrderController@editOrder')->name('orders.edit');//editing orders
    Route::any('orders/update/{id}','OrderController@updateOrder')->name('orders.update');//updating orders
    Route::any('orders/delete/{id}','OrderController@deleteOrder')->name('orders.delete');//delete order from table
    Route::post('orders','OrderController@store')->name('orders.store');//storing orders
    Route::any('orders/report','OrderController@viewOrderReport')->name('orders.report');//storing orders

    //Route for Orders Line
    Route::any('orders/order-lines/{id}','OrderController@viewOrder')->name('orders.show');//viewing order-lines of order
    Route::get('orders/order-lines/{id}/edit','OrderController@editOrderLine')->name('order-lines.edit');//editing order-line from orders view
    Route::any('orders/order-lines/{id}/update','OrderController@updateOrderLine')->name('order-lines.update');//updating order-line
    Route::any('orders/order-lines/{id}/delete','OrderController@deleteOrderDetail')->name('order-lines.delete');//deleting order-line form orders view

    //Routes for invoices in order table
    Route::get('/orders/{id}/view-invoice','OrderController@renderInvoice')->name('orders.render-invoice');
    Route::get('/orders/{id}/invoice','OrderController@viewInvoice')->name('orders.invoice');

    //Routes for Payment
    Route::get('payments','PaymentController@indexPayment')->name('voyager.payments.index');
    Route::post('payments','PaymentController@storePayment')->name('payments.store');
    Route::get('payments/create','PaymentController@createPayment')->name('payments.create');
    Route::any('payments/update/{id}','PaymentController@updatePayment')->name('payments.update');
    Route::any('payments/edit/{id}','PaymentController@editPayment')->name('payments.edit');

    //Routes for recipe
    Route::get('/recipes','RecipeController@index')->name('voyager.recipes.index');
    Route::any('/recipes/store','RecipeController@store')->name('recipe.store');
    Route::get('recipes/create','RecipeController@create')->name('recipe.create');
    Route::any('recipes/edit/{id}','RecipeController@editRecipe')->name('recipe.edit');
    Route::get('/recipes/editDetail/{id}','RecipeController@editRecipeDetail')->name('recipeDetail.edit');
    Route::post('/recipes/update/{id}','RecipeController@updateRecipe')->name('recipe.update');
    Route::post('/recipes/updateDetail/{id}','RecipeController@updateRecipeDetail')->name('recipeDetail.update');
    Route::get('recipes/delete/{id}','RecipeController@deleteRecipe')->name('recipe.delete');
    Route::get('recipes/deleteDetail/{id}','RecipeController@deleteRecipeDetail')->name('recipeDetail.delete');
    Route::get('/recipes/show/{id}','RecipeController@viewRecipeDetail')->name('recipe.show');
});
