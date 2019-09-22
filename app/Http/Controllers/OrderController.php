<?php

namespace App\Http\Controllers;

use App\FoodMenuItem;
use App\OrderStatus;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;
use App\OrderLine;
use App\Order;
use DB;

class OrderController extends Controller
{
    public function indexOrder()
    {
        $orders = Order::all();
        return view('voyager::orders.browse', compact('orders'));
    }
    public function createOrder()
    {
        $order_status = OrderStatus::all();
        $food_menu_items = FoodMenuItem::all();
        return view('voyager::orders.edit-add',compact('order_status','food_menu_items'));
    }
    public function store(Request $request)
    {
        // dd($request);
        $order = Order::create([
            'customer_name' => $request->customer_name,
            'date' => $request->date,
            'order_status' => $request->order_status,
            'paid' => $request->paid,
            'note' => $request->note
        ]);

        for ($i = 0; $i < sizeof($request->particular); $i++) {
            $order_line = OrderLine::create([
                'order_id' => $order->order_id,
                'food_menu_item_id' => $request->particular[$i],
                'quantity' => $request->quantity[$i],
                'rate' => $request->rate[$i],
                'amount' => $request->amount[$i]
            ]);
        }
        return redirect(route('voyager.orders.index'));
    }

    public function editOrder($id)
    {
        $order_status = OrderStatus::all();
        $food_menu_items = FoodMenuItem::all();
        $order = Order::find($id);
        $order_line = OrderLine::where('order_id', $id)->get();
        return view('voyager::orders.edit-add', compact('order_line', 'order', 'order_status'))->with('food_menu_items', $food_menu_items);
    }

    public function viewOrder($id)
    {
        $order = Order::find($id);
        $order_details = OrderLine::where('order_id', $id)->get();
        foreach ($order_details as $order_detail) {
            $order_detail->particular = FoodMenuItem::where('food_menu_item_id', $order_detail->food_menu_item_id)->first()->item_name;
        }
        return view('voyager::orders.read', compact('order_details', 'order'));
    }

    public function updateOrder(Request $request, $id)
    {
        // dd($request);
        $order = Order::find($id);
        $order->customer_name = $request->customer_name;
        $order->date = $request->date;
        $order->note = $request->note;
        $order->paid = $request->paid;
        $order->order_status = $request->order_status;

        $order_line = OrderLine::where('order_id', $id)->get();
        for ($i = 0; $i < $order_line->count(); $i++) {
            $order_line[$i]->food_menu_item_id = $request->particular[$i];
            $order_line[$i]->quantity = $request->quantity[$i];
            $order_line[$i]->rate = $request->rate[$i];
            $order_line[$i]->amount = $request->amount[$i];
            $order_line[$i]->particular_status = $request->particular_status[$i];
            $order_line[$i]->save();
        }
        for ($i = $order_line->count(); $i < sizeof($request->particular); $i++) {
            $order_line2 = OrderLine::create([
                'order_id' => $id,
                'food_menu_item_id' => $request->particular[$i],
                'quantity' => $request->quantity[$i],
                'rate' => $request->rate[$i],
                'amount' => $request->amount[$i],
                'particular_status' => $request->particular_status[$i]
            ]);
        }
        $order->save();
        return redirect(route('voyager.orders.index'));
    }

    //Deleting order from table
    public function deleteOrder($id)
    {
        $order = Order::find($id);
        $order->orderLine()->delete();
        $order->delete();
        return redirect()->back();
    }

    //Deletes order-line from orders table
    public function deleteOrderDetail($id)
    {
        $order_line = OrderLine::find($id);
        $order_line->delete();
        return redirect()->back();
    }

    public function editOrderLine($id)
    {
        $order_status = OrderStatus::all();
        $order_details = OrderLine::find($id);
        $food_menu_items = FoodMenuItem::all();
        return view('voyager::orders.edit-orderline', compact('order_details', 'order_status','food_menu_items'));
    }

    public function updateOrderLine(Request $request)
    {
        $order_line = OrderLine::where('order_line_id', $request->order_line_id)->first();
        $order_line->food_menu_item_id = $request->particular;
        $order_line->rate = $request->rate;
        $order_line->amount = $request->amount;
        $order_line->quantity = $request->quantity;
        $order_line->particular_status = $request->particular_status;
        $order_line->save();
        return redirect(route('orders.show', $request->order_id));
    }

    //invoice functions for order table'
    public function renderInvoice($id)
    {
        return view('voyager::orders.renderInvoice', compact('id'));
    }

    public function viewInvoice($id)
    {
        $order = Order::find($id);
        $order_lines = OrderLine::where('order_id', $id)->get();
        foreach ($order_lines as $order_line) {
            $order_line->particular = FoodMenuItem::where('food_menu_item_id', $order_line->food_menu_item_id)->first()->item_name;
        }
        $pdf = PDF::setPaper('A4', 'portrait');
        $pdf->loadView('voyager::orders.invoice', compact('order', 'order_lines'));
        return $pdf->stream();
    }

    public function viewOrderReport(Request $request){
        $orderFrom=$request->from;
        $orderTo=$request->to;
        $orders=DB::table('order_lines')
            ->select('particular', DB::raw('SUM(quantity) as Total'),'rate','order_id')
            ->whereBetween('created_at',[$orderFrom,$orderTo])
            ->groupBy('particular','rate','order_id')
            ->get();

        $pdf = PDF::loadView('voyager::orders.viewOrderReport',compact('orders','orderFrom','orderTo'));
        return $pdf->stream();
    }

    public function addToOrder(Request $request)
    {
        $foodID = $request->foodId;
        $foodItem = FoodMenuItem::find($foodID);
        //dd($foodItem);
        $orderCart = session()->get('orderCart');

        // if cart is empty then this the first product
        //dd($foodID);
        if (!$orderCart) {
            $orderCart = new Order();
            $orderCart->orderLineItem($foodItem,1);
            session()->put('orderCart',$orderCart);
        }

        $orderCart->orderLineItem($foodItem,1);
            session()->push('cartItems',$orderCart);

            return redirect('/')->with('success','Item added to Cart');
    }

    public function deleteFromOrders($id){
        $orderCart=session()->get('orderCart');
        unset($orderCart[$id]);
        return redirect()->back();
    }
}
