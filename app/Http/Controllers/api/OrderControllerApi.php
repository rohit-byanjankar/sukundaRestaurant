<?php

namespace App\Http\Controllers\Api;

use App\Order;
use App\OrderLine;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class OrderControllerApi extends Controller
{
    public function getOrder(Request $request){
        $order=Order::paginate(6);
        if ($order->count() > 0){
            return response()->json(['data' => $order,'message'=>'All orders retrieved succesfully']);
        }else{
            return response()->json(['message'=>'No order found']);
        }
    }

    public function setOrder(Request $request)
    {
        $order = Order::create([
            'order_no' => $request->order_no,
            'customer_name' => $request->customer_name,
            'date' => $request->date
        ]);

        for ($i = 0; $i < sizeof($request->particular); $i++) {
            $order_line = OrderLine::create([
                'order_id' => $order->order_id,
                'particular' => $request->particular[$i],
                'quantity' => $request->quantity[$i],
                'rate' => $request->rate[$i]
            ]);
        }

        return response()->json(['data'=>$order,'order_line_items'=>$order_line,'message'=>'Order created succesfully']);
    }

    public function editOrder($id)
    {
        $order = Order::find($id);
        $order_line = OrderLine::where('order_id', $id)->get();

        if ($order){
            return response()->json(['data'=>$order,'order_line_items'=>$order_line,'message'=>'Order retrieved succesfully']);
        }else{
            return response()->json(['message'=>'No order found']);
        }
    }

    public function updateOrder(Request $request,$id)
    {
        $order = Order::find($id);
        $order->customer_name = $request->customer_name;
        $order->date = $request->date;
        $order->order_no = $request->order_no;
        $order->order_status = $request->order_status;
        $order->paid = $request->paid;

        $order_line = OrderLine::where('order_id', $id)->get();
        for ($i = 0; $i < $order_line->count(); $i++) {
            $order_line[$i]->particular = $request->particular[$i];
            $order_line[$i]->quantity = $request->quantity[$i];
            $order_line[$i]->rate = $request->rate[$i];
            $order_line[$i]->particular_status = $request->particular_status[$i];
            $order_line[$i]->save();
        }

        for ($i = $order_line->count(); $i < sizeof($request->particular); $i++) {
            $order_line2 = OrderLine::create([
                'order_id' => $id,
                'particular' => $request->particular[$i],
                'quantity' => $request->quantity[$i],
                'rate' => $request->rate[$i]
            ]);
        }
        $order->save();
        return response()->json(['data'=>$order,'order_line_items'=>$order_line,'message'=>'Order updated succesfully']);
    }
}
