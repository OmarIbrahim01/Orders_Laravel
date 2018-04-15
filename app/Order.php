<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Order extends Model
{


    // Realation Ships
    public function customer()
    {
    	return $this->belongsTo('App\Customer');
    }

    public function country()
    {
    	return $this->belongsTo('App\Country');
    }

    public function work_place()
    {
    	return $this->belongsTo('App\WorkPlace');
    }

    public function urgent_fee()
    {
    	return $this->belongsTo('App\UrgentFee');
    }

    public function discount()
    {
    	return $this->belongsTo('App\Discount');
    }

    public function order_status()
    {
    	return $this->belongsTo('App\OrderStatus');
    }

    public function order_type()
    {
    	return $this->belongsTo('App\OrderType');
    }

    public function ordering_method()
    {
    	return $this->belongsTo('App\OrderingMethod');
    }

    public function delivery_type()
    {
    	return $this->belongsTo('App\DeliveryType');
    }

    public function delivery_area()
    {
    	return $this->belongsTo('App\DeliveryArea');
    }

    public function added_by_user()
    {
    	return $this->belongsTo('App\User', 'added_by');
    }

    public function first_designer()
    {
    	return $this->belongsTo('App\User', 'designer_first');
    }

    public function second_designer()
    {
    	return $this->belongsTo('App\User', 'designer_second');
    }








    public function delivery_in_days()
    {
        // return Carbon::createFromFormat('Y-m-d h:i:s', $this->delivery_date)->diffInDays(now(), false);
        return now()->diffInDays(Carbon::createFromFormat('Y-m-d h:i:s', $this->delivery_date), false);
    }









}
