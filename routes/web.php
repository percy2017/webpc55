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
        Route::get('/project/pedidos/contabilizar','ProjectController@pedidos_contabilizar')->name('pedidos.conta');
        Route::get('/project/pedidos/contabilizar/detalle/{pedido_id}','ProjectController@pedidos_contabilizar_detalle')->name('pedidos.conta.detalle');
        Route::get('/project/pedidos/contabilizar/archivar/{pedido_id}','ProjectController@pedidos_archivar')->name('pedidos.archivar');
        Route::get('/project/pedidos/proveedor/create','ProjectController@pedidos_proveedor_create')->name('pedidos.proveedor.create');
        Route::post('/project/pedidos/proveedor/stotage','ProjectController@pedidos_proveedor_storage')->name('pedidos.proveedor.storage');

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
    Route::get('/sales/report','SalesController@report')->name('sales.report');
        Route::get('/sales/solicitudes','SalesController@solicitud_index')->name('solicitud.index');
        Route::get('/sales/solicitudes/create','SalesController@solicitud_create')->name('solicitud.create');
        Route::get('/sales/solicitudes/edit/{id}','SalesController@solicitud_edit')->name('solicitud.edit');
        Route::post('/sales/solicitudes/storage','SalesController@solicitud_storage')->name('solicitud.storage');
        Route::get('/sales/solicitudes/clientes/create','SalesController@solicitud_cliente_create')->name('solicitud.cliente.create');
        Route::post('/sales/solicitudes/clientes/storage','SalesController@solicitud_cliente_storage')->name('solicitud.cliente.storage');
        Route::get('/sales/solicitudes/envios/solicitud/{solicitud_id}','SalesController@solicitud_envios_index')->name('solicitud.envios.index');
        Route::get('/sales/solicitudes/envios/create/{solicitud_id}','SalesController@solicitud_envios_create')->name('solicitud.envios.create');
        Route::post('/sales/solicitudes/envios/storage','SalesController@solicitud_envios_storage')->name('solicitud.envios.storage');

        Route::post('/sales/ventas/storage','SalesController@ventas_storage')->name('ventas.storage');

        Route::get('/sales/materiales','SalesController@materiales_index')->name('materiales.index');
        Route::get('/sales/materiales/search/{criterio}','SalesController@materiales_search')->name('materiales.search');

        Route::get('/sales/detalle_solictud/storage/{material_id}','SalesController@detalle_solicitud_storage')->name('ds.storage');
        Route::get('/sales/detalle_solictud','SalesController@detalle_solicitud_index')->name('ds.index');
        Route::get('/sales/detalle_solictud/delete/{material_id}','SalesController@detalle_solicitud_delete')->name('ds.delete');
        Route::get('/sales/detalle_solictud/trash','SalesController@detalle_solicitud_trash')->name('ds.trash');
        Route::get('/sales/detalle_solictud/edit/{id}/{cantidad}','SalesController@detalle_solicitud_edit')->name('ds.edit');
});
