<?php

namespace App\Http\Controllers;

use App\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function indexPayment(){
        $payments=Payment::all();
        return view('voyager::payments.browse',compact('payments'));
    }

    public function createPayment(){
        return view('voyager::payments.edit-add');
    }

    public function storePayment(Request $request){
         Payment::create([
            'invoice_no' => $request->invoice_no,
            'payment_mode' => $request->payment_mode,
            'payment_type' => $request->payment_type,
            'payment_status' => $request->payment_status,
            'expiry_year' => $request->expiry_year,
            'expiry_month' => $request->expiry_month,
            'bank_name' => $request->bank,
            'card_no' => $request->card_no,
            'branch' => $request->branch,
            'tax_amount' => $request->tax_amount
        ]);

        return redirect(route('voyager.payments.index'));
    }

    public function editPayment($id)
    {
        $payments=Payment::find($id);
        return view('voyager::payments.edit-add',compact('payments'));
    }

    public function updatePayment(Request $request,$id){
        $payment = Payment::find($id);
        $payment->invoice_no = $request->invoice_no;
        $payment->payment_mode = $request->payment_mode;
        $payment->payment_type = $request->payment_type;
        $payment->payment_status = $request->payment_status;
        $payment->expiry_year = $request->expiry_year;
        $payment->expiry_month = $request->expiry_month;
        $payment->bank_name = $request->bank;
        $payment->card_no = $request->card_no;
        $payment->branch = $request->branch;
        $payment->tax_amount = $request->tax_amount;

        $payment->save();
        return redirect(route('voyager.payments.index'));
    }

    public function showPayment(){

    }

    public function deletePayment(){

    }
}
