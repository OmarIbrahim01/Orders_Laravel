<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('/orders');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


//////////////////////////////////////
////////////////Orders///////////////

//Dashboard
Route::get('/orders', [
    'as' => 'orders.dashboard',
    'uses' => 'DashboardController@index'
]);







Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
