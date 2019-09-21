<?php

namespace App\Http\Controllers;

use App\Booking;
use App\User;
use App\Notifications\BookingByPeople;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    public  function booking(Request $request){
        $booker=Booking::create([
            'booker_name' => $request->name,
            'booked_time' => $request->date,
            'booker_address' => $request->address,
            'no_of_people' => $request->totalPeople,
            'booker_phone_no' => $request->phoneNo
        ]);

        $admins=User::where('role_id',1)->get();
        foreach ($admins as $admin){
            $admin->notify(new BookingByPeople($booker));
        }

        return redirect(route('home'))->with('success','Your reservation notification has been sent');
    }
}
