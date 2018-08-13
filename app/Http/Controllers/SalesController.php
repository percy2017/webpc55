<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use NumerosEnLetras;

class SalesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        if(!\Session::has('detalle_solicitud')) \Session::put('detalle_solicitud',array());
    }
    
    public function report()
    {
        return view('sales.report');
    }
    //ventas-------------------------------------------------------------------------
    //-------------------------------------------------------------------------------

        public function ventas_storage(Request $datos)
        {
            DB::table('ventas')->insert([
                'solicitud_id' => $datos->solicitud_id,
                'observacion' => $datos->observacion,
                'users_id' => auth::user()->id, 
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]);
            return redirect()->route('solicitud.index')->with(['message' => 'Venta realizado correctamente..', 'alert-type' => 'info']);
            return $datos;
        }
    //solicitudes--------------------------------------------------------------------
    //-------------------------------------------------------------------------------
    public function solicitud_index()
    {
        $solicitudes= DB::table('solicitudes')
                ->join('clientes', 'clientes.id', 'solicitudes.cliente_id')
                ->select('solicitudes.*','clientes.nombre_completo')
                ->where('solicitudes.user_id', Auth::user()->id) 
                ->orderBy('solicitudes.created_at', 'desc')
                ->paginate(setting('admin.paginate'));
        $criterio = '';
        return view('sales.solicitud_index', compact('solicitudes','criterio'));
    }
    public function solicitud_create()
    {
        $clientes = DB::table('clientes')->get();
        return view('sales.solicitud_create', compact('clientes'));
    }
    public function solicitud_edit($id)
    {
        $solicitud = DB::table('solicitudes')
                    ->where('id',$id)
                    ->first();

        $detalle_solicitud = DB::table('detalle_materiales')
                    ->join('materiales', 'materiales.id', 'detalle_materiales.materiale_id')
                    ->select('detalle_materiales.*','materiales.nombre', 'materiales.descripcion')
                    ->where('detalle_materiales.solicitude_id', $solicitud->id)
                    ->get();
        return view('sales.solicitud_edit', compact('solicitud', 'detalle_solicitud'));
    }
    
    public function solicitud_storage(Request $datos)
    {
        // return $datos;
        $materiales = \Session::get('detalle_solicitud');
        if (count($materiales)>0) 
        {
            DB::table('solicitudes')->insert([
                'cliente_id' => $datos->cliente_id,
                'fecha_entrega' => $datos->fecha_entrega,
                'hora_entrega' => $datos->hora_entrega, 
                'direccion_entrega' => $datos->direccion_entrega,
                'user_id' => Auth::user()->id,
                'latitud' => $datos->latitud,
                'longitud' => $datos->longitud,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'total' => $this->total()
            ]);
            $solicitud = DB::table('solicitudes')->latest()->first(); 
            foreach($materiales as $item)
            {
                DB::table('detalle_materiales')->insert([
                    'solicitude_id' => $solicitud->id,
                    'materiale_id' => $item->id,
                    'cantidad' => $item->cantidad,
                    'precio' => $item->precio,
                    
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now()
                    
                ]);
            }
            $this->detalle_solicitud_trash();
            return redirect()->route('solicitud.index')->with(['message' => 'Solicitud realizado correctamente..', 'alert-type' => 'info']);  
            //return $datos;
        }
        else
        {
            return redirect()->route('solicitud.create')->with(['message' => 'debe agregar materiales a la solicitud', 'alert-type' => 'info']);  
        }
    }
    //materiales--------------------------------------------------------------------
    //-------------------------------------------------------------------------------
    public function materiales_index()
    {
        $materiales = DB::table('materiales')
                    ->join('clasificaciones','clasificaciones.id','materiales.clasificacion_id')
                    ->select('materiales.*', 'clasificaciones.nombre as clasificacion')
                    ->orderBy('materiales.created_at','desc')
                    ->paginate(setting('admin.paginate'));
        $criterio = '';
        return view('sales.materiales_index',compact('materiales','criterio'));
    }

    //detale_solicitud---------------------------------------------------------------
    //-------------------------------------------------------------------------------

    public function detalle_solicitud_storage($material_id)
    {
        $new = DB::table('materiales')
                ->select('id','nombre','descripcion','cantidad','precio','bombeado')
                ->where('id',$material_id)
                ->first();

        $items= \Session::get('detalle_solicitud');

        $items[$material_id] = $new;
  
        \Session::put('detalle_solicitud',$items);
    }
    public function detalle_solicitud_index()
    {
        $materiales = \Session::get('detalle_solicitud');
        return view('sales.detalle_solicitud_index',compact('materiales'));
    }
    public function detalle_solicitud_trash()
    {
    	\Session::forget('detalle_solicitud');
    }
    public function detalle_solicitud_delete($item_id)
    {
    	$material= \Session::get('detalle_solicitud');
    	unset($material[$item_id]);
    	\Session::put('detalle_solicitud',$material);
    	
    }
    public function detalle_solicitud_edit($id, $cantidad)
    {
        $material= \Session::get('detalle_solicitud');
        $material[$id]->cantidad = $cantidad;
        \Session::put('detalle_solicitud',$material);
    	
    }
    public function total()
    {
        $items= \Session::get('detalle_solicitud');
        $total=0;
        foreach($items as $item)
        {
            $total+= $item->cantidad * $item->precio;
        }
        return $total;
    }
}
