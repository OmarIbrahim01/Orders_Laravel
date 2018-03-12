<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            //Order Info
            $table->increments('id');
            $table->integer('customer_id');
            $table->integer('serial');
            $table->integer('country_id');
            $table->integer('work_place_id');
            $table->integer('urgent_id');
            $table->integer('discount_id');
            $table->float('down_payment');
            $table->string('tag');

            //Order Status
            $table->integer('status_id');
            $table->string('status_updated_at');
            $table->integer('status_updated_by');

            //Order Type (Normal, Sample, Co-worker)
            $table->integer('order_type_id');

            //Order Date and User
            $table->timestamps();
            $table->integer('added_by');

            //Ordering Location
            $table->integer('ordering_type_id');
            $table->integer('ordering_location_id');
            //Ordering Destination
            $table->integer('delevery_type_id');
            $table->string('delevery_date');
            $table->integer('delevery_destination_id');
            $table->text('delevery_address');

            //Order Notes
            $table->text('general_note');
            $table->integer('general_note_by');
            $table->string('general_note_Date');
            $table->text('admin_note');
            $table->integer('admin_note_by');
            $table->string('admin_note_date');
            $table->text('designer_note');
            $table->integer('designer_note_by');
            $table->string('designer_note_date');
            $table->text('sales_note');
            $table->integer('sales_note_by');
            $table->string('sales_note_date');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
