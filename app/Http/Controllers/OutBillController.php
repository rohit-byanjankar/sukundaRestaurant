<?php

namespace App\Http\Controllers;

use App\FoodMenuItem;
use App\Item;
use App\OutBill;
use App\OutBillDetail;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;

class OutBillController extends Controller
{
    public function OutBillIndex(){
        $outBill=OutBill::all();
        return view('voyager::out-bills.browse',compact('outBill'));
    }

    public function createOutBill(){
        $foodItem=FoodMenuItem::all();
        $items=Item::all();
        return view('voyager::out-bills.edit-add',compact('items','foodItem'));
    }

    public function viewOutBillDetail($id)
    {
        $bill = OutBill::find($id);
        $bill_details = OutBillDetail::where('out_bill_id', $id)->get();
        return view('voyager::out-bills.read', compact('bill_details', 'bill'));
    }

    public function editOutBill($id){
        $items=Item::all();
        $bill= OutBill::find($id);
        $bill_details = OutBillDetail::where('out_bill_id', $id)->get();
        return view('voyager::out-bills.edit-add', compact('bill','bill_details','items'));
    }

    public function editOutBillDetail($id)
    {
        $bill_details = OutBillDetail::find($id);
        return view('voyager::out-bills.edit-outbilldetail', compact('bill_details'));
    }

    public function store(Request $request){
        $bill = OutBill::create([
            'customer_name' => $request->customer_name,
            'phone_number' => $request->phone_number,
            'address' => $request->address,
            'taxable_amount' => $request->taxable_amount,
            'vat' => $request->vat,
            'total' => $request->total,
            'discount' => $request->discount,
            'sub_total' => $request->sub_total,
            'item_id' => $request->item,
        ]);

        for ($i = 0; $i < sizeof($request->particular); $i++) {
            $bill_details = OutBillDetail::create([
                'out_bill_id' => $bill->out_bill_id,
                'food_menu_item_id' => $request->particular[$i],
                'quantity' => $request->quantity[$i],
                'rate' => $request->rate[$i],
                'amount' => $request->amount[$i]
            ]);
        }
        return redirect(route('voyager.out-bills.index'));
    }

    public function updateOutBill(Request $request,$id){
        $bill = OutBill::find($id);
        $bill->customer_name = $request->customer_name;
        $bill->address = $request->address;
        $bill->phone_number = $request->phone_number;
        $bill->item_id = $request->item;
        $bill->sub_total = $request->sub_total;
        $bill->total = $request->total;
        $bill->vat = $request->vat;
        $bill->discount = $request->discount;
        $bill->taxable_amount = $request->taxable_amount;

        $bill_line = OutBillDetail::where('out_bill_id', $id)->get();
        for ($i = 0; $i < $bill_line->count(); $i++) {
            $bill_line[$i]->particular = $request->particular[$i];
            $bill_line[$i]->quantity = $request->quantity[$i];
            $bill_line[$i]->rate = $request->rate[$i];
            $bill_line[$i]->amount = $request->amount[$i];
            $bill_line[$i]->save();
        }
        for ($i = $bill_line->count(); $i < sizeof($request->particular); $i++) {
            $bill_line2 = OutBillDetail::create([
                'out_bill_id' => $id,
                'particular' => $request->particular[$i],
                'quantity' => $request->quantity[$i],
                'rate' => $request->rate[$i],
                'amount' => $request->amount[$i]
            ]);
        }
        $bill->save();
        return redirect(route('voyager.out-bills.index'));
    }

    public function updateOutBillDetail(Request $request,$id){
        $bill_details=OutBillDetail::find($id);
        $bill_details->particular = $request->particular;
        $bill_details->quantity= $request->quantity;
        $bill_details->rate= $request->rate;
        $bill_details->amount= $request->amount;

        $bill_details->save();
        return redirect(route('outBillDetail.view', $request->bill_line_id));
    }

    public function deleteOutBillDetail($id)
    {
        $bill_details = OutBillDetail::find($id);
        $bill_details->delete();

        return redirect()->back();
    }
    public function deleteOutBill($id)
    {
        $bill= OutBill::find($id);
        $bill->delete();
        return redirect()->back();
    }
}
