<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Booking extends Model
{
    protected $fillable=['booker_name','booker_address','booker_phone_no','no_of_people','booked_time'];
    protected $primaryKey = 'booking_id';
}
