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
    Route::get('/project/report','ProjectController@report')->name('project.report');
    Route::get('/project/report/query/{table}/{table_option}','ProjectController@report_query')->name('project.query');   
        Route::get('/project/pedidos','ProjectController@pedidos_index')->name('pedidos.index');
        Route::get('/project/pedidos/create','ProjectController@pedidos_create')->name('pedidos.create');
        Route::post('/project/pedidos/storage','ProjectController@pedidos_storage')->name('pedidos.storage');
        Route::get('/project/pedidos/edit/{id}','ProjectController@pedidos_edit')->name('pedidos.edit');
        Route::get('/project/pedidos/estado/{id}/{estado}','ProjectController@pedidos_estado')->name('pedidos.estado');
        Route::get('/project/pedidos/cola','ProjectController@pedidos_cola')->name('pedidos.cola');
        Route::get('/project/pedidos/cola/filtros/{pedido_id}','ProjectController@pedidos_filtros')->name('pedidos.filtros');
        Route::post('/project/pedidos/final','ProjectController@pedidos_final')->name('pedidos.final');
        Route::post('/project/pedidos/rechazo','ProjectController@pedidos_rechazo')->name('pedidos.rechazo');
        Route::post('/project/pedidos/update','ProjectController@pedidos_update')->name('pedidos.update');
        Route::get('/project/pedidos/search/{criterio}','ProjectController@pedidos_search')->name('pedidos.search');

        Route::get('/project/items/index','ProjectController@items_index')->name('items.index');
        Route::get('/project/items/create/{criterip}','ProjectController@items_create')->name('items.create');
        Route::get('/project/items/search/{criterio}','ProjectController@items_search')->name('items.search');
        Route::post('/project/items/storage','ProjectController@items_storage')->name('items.storage');

        Route::get('/project/detalle_pedido/storage/{item_id}','ProjectController@detalle_pedido_storage')->name('detalle_pedido.storage');
        Route::get('/project/detalle_pedido/index','ProjectController@detalle_pedido_index')->name('detalle_pedido.index');
        Route::get('/project/detalle_pedido/trash','ProjectController@detalle_pedido_trash')->name('detalle_pedido.trash');
        Route::get('/project/detalle_pedido/delete/{item_id}','ProjectController@detalle_pedido_delete')->name('detalle_pedido.delete');
        Route::get('/project/detalle_pedido/edit/{item_id}/{campo}/{valor}','ProjectController@detalle_pedido_edit')->name('detalle_pedido.edit');
    //--------------------------------------------------------------------------------------------------------------        
    Route::get('/security','SecurityController@index');
    Route::get('/sales','SalesController@index');
        Route::get('/sales/solicitudes','SalesController@solicitud_index')->name('solicitud.index');
        Route::get('/sales/solicitudes/create','SalesController@solicitud_create')->name('solicitud.create');
        Route::get('/sales/solicitudes/edit/{id}','SalesController@solicitud_edit')->name('solicitud.edit');
});
