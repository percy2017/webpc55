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
        Route::post('/project/pedidos/storage','ProjectController@pedidos_storage')->name('pedidos.storage');
        Route::get('/project/items/index','ProjectController@items_index')->name('items.index');
        Route::get('/project/items/create','ProjectController@items_create')->name('items.create');
        Route::get('/project/items/search/{criterio}','ProjectController@items_search')->name('items.search');
        Route::post('/project/items/storage','ProjectController@items_storage')->name('items.storage');
        Route::get('/project/detalle_pedido/storage/{item_id}','ProjectController@detalle_pedido_storage')->name('detalle_pedido.storage');
        Route::get('/project/detalle_pedido/index','ProjectController@detalle_pedido_index')->name('detalle_pedido.index');
        Route::get('/project/detalle_pedido/trash','ProjectController@detalle_pedido_trash')->name('detalle_pedido.trash');
        Route::get('/project/detalle_pedido/delete/{item_id}','ProjectController@detalle_pedido_delete')->name('detalle_pedido.delete');
        
    Route::get('/security','SecurityController@index');
    Route::get('/sales','SalesController@index');
});
