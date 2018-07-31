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
    return view('welcome');
});
Route::post('/register','Auth\RegisterController@register')->name('register');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();

    Route::get('/project','ProjectController@index');
        Route::get('/project/pedidos','ProjectController@pedidos_index')->name('pedidos.index');
        Route::get('/project/pedidos/create','ProjectController@pedidos_create')->name('pedidos.create');
        
    Route::get('/security','SecurityController@index');
    Route::get('/sales','SalesController@index');
});
