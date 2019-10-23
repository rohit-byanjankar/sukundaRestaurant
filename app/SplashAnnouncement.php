<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class SplashAnnouncement extends Model
{
    protected $table = "splashAnnouncement";
    protected $fillable=['scheduleFrom','scheduleTo','status','content'];
}
