<?php

namespace App\Http\Controllers;

use App\InBill;
use App\InBillDetail;
use App\Item;
use App\MeasuringUnit;
use App\StockEntry;
use Illuminate\Http\Request;

class InBillController extends Controller
{

    public function InBillIndex()
    {
        $inBill = InBill::all();
        return view('voyager::in-bills.browse', compact('inBill'));
    }

    public function createInBill()
    {
        $items = Item::all();
        $measuring_units = MeasuringUnit::all();
        return view('voyager::in-bills.edit-add', compact('items', 'measuring_units'));
    }

    public function viewInBillDetail($id)
    {
        $bill = InBill::find($id);
        $bill_details = InBillDetail::where('in_bill_id', $id)->get();
        $i = 0;
        foreach($bill_details as $bill_detail){
            $index = $i++;
            $bill_details[$index]->item_name = Item::where('item_id',$bill_details[$index]->item_id)->first()->item_name;
        }
        return view('voyager::in-bills.read', compact('bill_details', 'bill'));
    }

    public function editInBill($id)
    {
        $items = Item::all();
        $bill = InBill::find($id);
        $measuring_units = MeasuringUnit::all();
        $bill_details = InBillDetail::where('in_bill_id', $id)->get();
        return view('voyager::in-bills.edit-add', compact('bill', 'bill_details', 'items'))->with('measuring_units',$measuring_units);
    }

    public function editInBillDetail($id)
    {
        $bill_details = InBillDetail::find($id);
        $bill_details->item_name = Item::where('item_id',$bill_details->item_id)->first()->item_name;
        // dd($bill_details);
        return view('voyager::in-bills.edit-inbilldetail', compact('bill_details'));
    }

    public function displayDetail(Request $request)
    {
        // dd($request->request);
        $item_id = [];
        for ($i = 0; $i < sizeof($request->particular); $i++) {
            $items = Item::where('item_id', $request->particular[$i])->first();
            $item_id[] = $items;
        }
        // dd($item_id);
        return view('voyager::in-bills.bill-detail')->with('in_bill_details', $request)->with('items', $item_id);
    }

    public function store(Request $request)
    {
        // dd($request);
        $bill = InBill::create([
            'invoice_id' => $request->invoice_id,
            'vendor_name' => $request->vendor_name,
            'pan_number' => $request->pan_number,
            'phone_number' => $request->phone_number,
            'address' => $request->address,
            'taxable_amount' => $request->taxable_amount,
            'vat' => $request->vat,
            'total' => $request->total,
            'discount' => $request->discount,
            'sub_total' => $request->sub_total
        ]);

        for ($i = 0; $i < sizeof($request->particular); $i++) {
            $bill_details = InBillDetail::create([
                'in_bill_id' => $bill->in_bill_id,
                'item_id' => $request->item_id[$i],
                'quantity' => $request->quantity[$i],
                'rate' => $request->rate[$i],
                'amount' => $request->amount[$i],
                'measuring_unit' => $request->measuring_unit[$i]
            ]);

            $stock_entry = StockEntry::create([
                'item_id' => $request->item_id[$i],
                'date' => $request->date,
                'item_name' => $request->particular[$i],
                'quantity' => $request->quantity[$i],
                'measuring_unit' => $request->measuring_unit[$i]
            ]);
        }
        return redirect(route('voyager.in-bills.index'))->with('message', 'Successfully added new in-bill.');
    }

    public function updateInBill(Request $request, $id)
    {
        // dd($request);
        $bill = InBill::find($id);
        $bill->vendor_name= $request->vendor_name;
        $bill->pan_number= $request->pan_number;
        $bill->address = $request->address;
        $bill->phone_number = $request->phone_number;
        $bill->sub_total = $request->sub_total;
        $bill->total = $request->total;
        $bill->vat = $request->vat;
        $bill->discount = $request->discount;
        $bill->taxable_amount = $request->taxable_amount;

        $bill_line = InBillDetail::where('in_bill_id', $id)->get();
        for ($i = 0; $i < $bill_line->count(); $i++) {
            $bill_line[$i]->item_id = $request->item_id[$i];
            $bill_line[$i]->quantity = $request->quantity[$i];
            $bill_line[$i]->rate = $request->rate[$i];
            $bill_line[$i]->amount = $request->amount[$i];
            $bill_line[$i]->measuring_unit = $request->measuring_unit[$i];
            $bill_line[$i]->save();
        }
        for ($i = $bill_line->count(); $i < sizeof($request->particular); $i++) {
            $bill_line2 = InBillDetail::create([
                'in_bill_id' => $id,
                'item_id' => $request->item_id[$i],
                'quantity' => $request->quantity[$i],
                'rate' => $request->rate[$i],
                'amount' => $request->amount[$i],
                'measuring_unit' => $request->measuring_unit[$i]
            ]);
        }
        $bill->save();
        return redirect(route('voyager.in-bills.index'))->with('message', 'Successfully Updated!');
    }

    public function updateInBillDetail(Request $request, $id)
    {
        $bill_details = InBillDetail::find($id);
        $bill_details->item_id = $request->item_id;
        $bill_details->quantity = $request->quantity;
        $bill_details->rate = $request->rate;
        $bill_details->amount = $request->amount;
        $bill_details->measuring_unit = $request->measuring_unit;
        $bill_details->save();
        return redirect(route('inBillDetail.view', $request->bill_line_id))->with('message', 'Successfully Updated!');
    }

    public function deleteInBillDetail($id)
    {
        $bill_details = InBillDetail::find($id);
        $bill_details->delete();
        return redirect()->back()->with('message', 'Deleted Successfully!');
    }

    public function deleteInBill($id)
    {
        $bill = InBill::find($id);
        // $bill->inBillDetails()->delete();
        $bill->delete();
        return redirect()->back()->with('message', 'Deleted Successfully!');
    }
}
