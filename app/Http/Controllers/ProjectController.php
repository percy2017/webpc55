<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use NumerosEnLetras;
class ProjectController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        if(!\Session::has('detalle_pedido')) \Session::put('detalle_pedido',array());
    }

    //pedidos -----------------------------------------------------------------------------------
    public function pedidos_index()
    {
        $pedidos = DB::table('pedidos')
                ->join('users', 'users.id', 'pedidos.user_id')
                ->join('estados', 'estados.id', 'pedidos.estado_id')
                ->join('proyectos', 'proyectos.id', 'pedidos.proyecto_id')
                ->select('pedidos.*', 'estados.nombre as estado', 'proyectos.nombre as proyecto')
                ->where('users.id', Auth::user()->id)
                ->get();
        //return $pedidos;
        return view('project.pedidos_index', compact('pedidos'));
    }
    public function pedidos_create()
    {
        $proyectos = DB::table('proyectos')->get();
        $tipos = DB::table('tipos')->get();
        $proveedores = DB::table('proveedores')->get();
        $pagos = DB::table('pagos')->get();

        return view('project.pedidos_create', compact('proyectos','tipos','proveedores','pagos'));
    }
    public function pedidos_storage(Request $datos)
    {
        $detalle_pedido = \Session::get('detalle_pedido');
        //NumerosEnLetras::convertir(1988208.99,'Bolivianos',true);
        
        DB::table('pedidos')->insert([
            'firma' => setting('admin.firma'), 
            'referencia' => $datos->referencia, 
            'estado_id' => 1,
            'observacion' => $datos->observacion,
            'user_id' => Auth::user()->id,
            'proveedor_id' => $datos->proveedor_id,
            'proyecto_id' => $datos->proyecto_id,
            'tipo_id' => $datos->tipo_id,
            'pago_id' => $datos->pago_id,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);

        $item_id = DB::table('pedidos')->latest()->first(); 
        return $datos;
        
    }
    //Items----------------------------------------------------------------------------
    public function items_index()
    {
        $items = DB::table('items')
                ->join('categorias', 'categorias.id', 'items.categoria_id')
                ->join('unidades', 'unidades.id', 'items.unidad_id')
                ->select('items.*', 'categorias.nombre as categoria', 'unidades.nombre as unidad')
                ->orderBy('items.created_at','desc')
                ->paginate(setting('admin.paginate'));
        return view('project.items_index', compact('items'));
    }
    public function items_create()
    {
        $categorias = DB::table('categorias')->get();
        $unidades = DB::table('unidades')->get();
        return view('project.items_create',compact('categorias','unidades'));
    }
    public function items_search($criterio)
    {
        $items = DB::table('items')
                ->join('categorias', 'categorias.id', 'items.categoria_id')
                ->join('unidades', 'unidades.id', 'items.unidad_id')
                ->select('items.*', 'categorias.nombre as categoria', 'unidades.nombre as unidad')
                ->orderBy('items.created_at','desc')
                ->where('items.nombre', 'like', '%'.$criterio.'%')
                ->paginate(setting('admin.paginate'));
        return view('project.items_index', compact('items'));
    }
    public function items_storage(Request $datos)
    {
        return $datos;
        DB::table('items')->insert([
            'nombre' => $datos->nombre, 
            'descripcion' => $datos->descripcion, 
            'categoria_id' => $datos->categoria_id, 
            'unidad_id' => $datos->unidad_id,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);


        $item_id = DB::table('items')->latest()->first();
        $this->detalle_pedido_storage($item_id->id);
    }
    //detalle_pedido------------------------------------------------------------------
    public function detalle_pedido_storage($item_id)
    {
        $new = DB::table('items')
                ->select('id','nombre','descripcion')
                ->where('id',$item_id)
                ->first();

        $items= \Session::get('detalle_pedido');
        $items[$item_id] = $new;
  
        \Session::put('detalle_pedido',$items);
    }
    public function detalle_pedido_index()
    {
        $dp= \Session::get('detalle_pedido');   
        return view('project.detalle_pedido_index', compact('dp'));
    }
    public function detalle_pedido_trash()
    {
    	\Session::forget('detalle_pedido');
    }
    public function detalle_pedido_delete($item_id)
    {
    	$items= \Session::get('detalle_pedido');
    	unset($items[$item_id]);
    	\Session::put('detalle_pedido',$items);
    	
    }

}
