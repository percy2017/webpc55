<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use NumerosEnLetras;

class WarehouseCrontroller extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        if(!\Session::has('tipo_insumos')) \Session::put('tipo_insumos',array());  
    }

    public function materiales_index()
    {
        $materiales = DB::table('materiales')->get();
        return view('warehouse.materiales_index', compact('materiales'));
    }
    public function materiales_create()
    {
        // $materiales = DB::table('materiales')->get();
        return view('warehouse.materiales_create');
    }

    public function insumos_index()
    {
        $tipo_insumos = DB::table('tipo_insumos')
                    ->join('unidades','unidades.id','tipo_insumos.unidad_id')
                    ->select('tipo_insumos.*','unidades.nombre as unidad')
                    ->paginate(setting('admin.paginate'));
        $criterio = '';
        return view('warehouse.tipo_insumos_index',compact('tipo_insumos','criterio'));
    }

    public function insumos_storage($tipo_insumo_id)
    {


        $aux = DB::table('tipo_insumos')
                ->join('unidades','unidades.id','tipo_insumos.unidad_id')
                ->select('tipo_insumos.id','tipo_insumos.nombre','tipo_insumos.cantidad','unidades.nombre as unidad')
                ->where('tipo_insumos.id',$tipo_insumo_id)
                ->first();

        // return dd($aux) ;
        $aux2= \Session::get('tipo_insumos');
        // return $aux2;
        $aux2[$aux->id] = $aux;
  
        \Session::put('tipo_insumos',$aux2);

        return \Session::get('tipo_insumos');
    }

    public function insumos_delete($tipo_insumo_id)
    {
    	$aux= \Session::get('tipo_insumos');
    	unset($aux[$tipo_insumo_id]);
        \Session::put('tipo_insumos',$aux);
        
    	return \Session::get('tipo_insumos');
    }

    public function tipo_insumos_index()
    {
    
        $aux= \Session::get('tipo_insumos');
    	return view('warehouse.tipo_insumos_material',compact('aux'));
    }
    public function tipo_insumos_trash()
    {
    	\Session::forget('tipo_insumos');
    }
    public function tipo_insumos_update($id, $cantidad)
    {
        $aux= \Session::get('tipo_insumos');
        $aux[$id]->cantidad = $cantidad;

        \Session::put('tipo_insumos',$aux);

        return \Session::get('tipo_insumos');

    }

}
