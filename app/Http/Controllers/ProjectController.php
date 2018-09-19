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

    //modulo-------------------------------------------------------------------------
    public function report()
    {
        return view('project.report');
    }
    public function report_query($table, $table_option)
    {   
        
        switch ($table) {
            case '1':
                switch ($table_option) {
                    case '1':
                        $proyectos = DB::table('proyectos')
                        ->orderBy('created_at', 'desc')
                        ->paginate(setting('admin.paginate'));
                        $criterio = '';
                        return view('project.report_query', compact('table','table_option','proyectos','criterio'));
                
                        break;
                    case '2':
                        $proyectos = DB::table('proyectos')
                        ->orderBy('created_at', 'desc')
                        ->paginate(setting('admin.paginate'));
                        $criterio = '';
                        return view('project.report_query', compact('table','table_option','proyectos','criterio'));                
                        break;
                    default:
                        # code...
                        break;
                }
                break;
            case '2':
                switch ($table_option) {
                    case '1':
                        $pedidos = DB::table('pedidos')
                        ->orderBy('created_at', 'desc')
                        ->paginate(setting('admin.paginate'));
                        $criterio = '';
                        return view('project.report_query', compact('table','table_option','pedidos','criterio'));
                
                        break;
                    case '2':
                        $proyectos = DB::table('proyectos')
                        ->orderBy('created_at', 'desc')
                        ->paginate(setting('admin.paginate'));
                        $criterio = '';
                        return view('project.report_query', compact('table','table_option','proyectos','criterio'));                
                        break;
                    default:
                        # code...
                        break;
                }
                break;
            case '3':
                # code...
                break;
            default:
                # code...
                break;
        }

        return view('project.report_query', compact('query','table','table_option'));
    }

    //pedidos -----------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------
    public function pedidos_index()
    {
        $pedidos = DB::table('pedidos')
                ->join('users', 'users.id', 'pedidos.user_id')
                ->join('estados', 'estados.id', 'pedidos.estado_id')
                ->join('proyectos', 'proyectos.id', 'pedidos.proyecto_id')
                ->join('tipos', 'tipos.id', 'pedidos.tipo_id')
                ->join('proveedores', 'proveedores.id', 'pedidos.proveedor_id')
                ->select('pedidos.*', 'estados.nombre as estado', 'estados.color', 'proyectos.nombre as proyecto', 'tipos.nombre as tipo', 'proveedores.nombre as proveedor')
                ->where('users.id', Auth::user()->id)
                ->orderBy('pedidos.created_at', 'desc')
                ->paginate(setting('admin.paginate'));
        $criterio = '';
        return view('project.pedidos_index', compact('pedidos','criterio'));
    }
    public function pedidos_search($criterio)
    {
        //return $criterio;
        if ($criterio) {
            # code...
            $pedidos = DB::table('pedidos')
                ->join('users', 'users.id', 'pedidos.user_id')
                ->join('estados', 'estados.id', 'pedidos.estado_id')
                ->join('proyectos', 'proyectos.id', 'pedidos.proyecto_id')
                ->join('tipos', 'tipos.id', 'pedidos.tipo_id')
                ->join('proveedores', 'proveedores.id', 'pedidos.proveedor_id')
                ->select('pedidos.*', 'estados.nombre as estado', 'estados.color', 'proyectos.nombre as proyecto', 'tipos.nombre as tipo', 'proveedores.nombre as proveedor')
                ->where([['users.id', Auth::user()->id],['proyectos.nombre','like','%'.$criterio.'%']])
                ->orWhere([['users.id', Auth::user()->id],['pedidos.total','=',$criterio]])
                ->orderBy('pedidos.created_at', 'desc')
                ->paginate(setting('admin.paginate'));
        
        return view('project.pedidos_index', compact('pedidos','criterio'));
        }else
        {
            return redirect()->route('pedidos.index')->with(['message' => 'Debe establecer el criterio de busqueda..', 'alert-type' => 'info']);
        }
        
    }
    public function pedidos_create()
    {
        $proyectos = DB::table('proyectos')
                    ->where('estado',true)
                    ->orderBy('created_at','desc')
                    ->get();
                    
        $tipos = DB::table('tipos')
                ->orderBy('created_at','desc')
                ->get();

        $proveedores = DB::table('proveedores')
                    ->where('estado',true)
                    ->orderBy('created_at','desc')
                    ->get();

        $pagos = DB::table('pagos')
                ->orderBy('created_at','desc')
                ->get();

        $this->detalle_pedido_trash();

        return view('project.pedidos_create', compact('proyectos','tipos','proveedores','pagos'));
    }
    public function pedidos_storage(Request $datos)
    {
        $detalle_pedido = \Session::get('detalle_pedido');
        if (count($detalle_pedido)>0) {

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
                'updated_at' => Carbon::now(),
                'total' => $this->total(),
                'literal' => NumerosEnLetras::convertir($this->total(),'Bolivianos',true)
            ]);
    
            $pedido = DB::table('pedidos')->latest()->first(); 
    
            $items= \Session::get('detalle_pedido');
            foreach($items as $item)
            {
                DB::table('detalle_pedidos')->insert([
                    'pedido_id' => $pedido->id,
                    'item_id' => $item->id,
                    'cantidad' => $item->cantidad,
                    'precio' => $item->precio,
                    'subtotal' => $item->cantidad * $item->precio,
                    'maquinaria_id' =>  $item->maquinaria_id,
                    'aux_id' =>  $item->aux_id,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now()
                ]);
                
                DB::table('items')
                    ->where('id', $item->id)
                    ->update(['cantidad' => $item->cantidad, 'precio' => $item->precio, 'maquinaria_id' => $item->maquinaria_id]);

            }
    
            $this->detalle_pedido_trash();
            if($datos->aprobacion)
            {
                $this->pedidos_estado($pedido->id, 2);
            }
            return redirect()->route('pedidos.index')->with(['message' => 'Pedido realizado correctamente..', 'alert-type' => 'info']);  

        } else {
            return redirect()->back()->with(['message' => 'Debes Ingresar Items al pedidos para poder guardar.', 'alert-type', 'warning']);
        }
        
        
    }
    public function pedidos_edit($id)
    {
        $pedido = DB::table('pedidos')
                    ->join('estados','estados.id','pedidos.estado_id')
                    ->select('pedidos.*','estados.nombre as estado')
                    ->where('pedidos.id',$id)
                    ->first($id);

        $rechazo = DB::table('rechazos')
                        ->where('rechazos.pedido_id', $id)
                        ->orderBy('created_at','desc')
                        ->first();

        $detalle_pedido = DB::table('detalle_pedidos')
                        ->join('pedidos', 'pedidos.id', 'detalle_pedidos.pedido_id')
                        ->join('users', 'users.id', 'pedidos.user_id')
                        ->join('items', 'items.id', 'detalle_pedidos.item_id')
                        ->select('items.*', 'detalle_pedidos.cantidad', 'detalle_pedidos.precio', 'detalle_pedidos.maquinaria_id')
                        ->where([['detalle_pedidos.pedido_id', $id],['users.id', Auth::user()->id]])
                        ->get();

        $proyectos = DB::table('proyectos')->get();
        $tipos = DB::table('tipos')->get();
        $proveedores = DB::table('proveedores')->get();
        $pagos = DB::table('pagos')->get();

        
        //vaciamos el array.
        $this->detalle_pedido_trash();

        //recupero todos los detalles del pedido
        $dp = DB::table('detalle_pedidos')
                ->where('detalle_pedidos.pedido_id',$id)
                ->get();
   
        foreach($dp as $item)
        {
            //recuperamos (items * items) del pedido
            $new = DB::table('detalle_pedidos')
                ->join('items', 'items.id', 'detalle_pedidos.item_id')
                ->select('items.id','items.nombre','items.descripcion','detalle_pedidos.cantidad','detalle_pedidos.precio', 'detalle_pedidos.maquinaria_id','detalle_pedidos.aux_id')
                //->where([['detalle_pedidos.pedido_id', $id], ['detalle_pedidos.item_id',$item->id]])
                ->where('detalle_pedidos.aux_id', $item->aux_id)
                ->first();

            $arreglo= \Session::get('detalle_pedido');
            
            $arreglo[$item->aux_id] = $new;
    
            \Session::put('detalle_pedido',$arreglo);
        }                
        return view('project.pedidos_edit', compact('proyectos','tipos','proveedores','pagos','pedido','detalle_pedido','rechazo'));
    }
    public function pedidos_estado($id, $estado)
    {
        DB::table('pedidos')
            ->where('id', $id)
            ->update(['estado_id' => $estado, 'updated_at' => Carbon::now()]);
        
        DB::table('estados_cambios')->insert([
            'pedido_id' => $id,
            'user_id' => Auth::user()->id,
            'estado_id' => $estado,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
        
    }

    public function pedidos_cola()
    {
        $rol = DB::table('users')
                ->join('roles','roles.id','users.role_id')
                ->select('roles.*')
                ->where('users.id',Auth::user()->id)
                ->first();
        $estado_id =0;
        switch ($rol->id) {
            case 3: //rol aprobador
                $estado_id = 2;
            break;
            case 4: //rol elaborador
                $estado_id = 4;
            break;

            default:
                # code...
            break;
        }

        $pedidos = DB::table('pedidos')
        ->join('users', 'users.id', 'pedidos.user_id')
        ->join('estados', 'estados.id', 'pedidos.estado_id')
        ->join('proyectos', 'proyectos.id', 'pedidos.proyecto_id')
        ->join('tipos', 'tipos.id', 'pedidos.tipo_id')
        ->join('proveedores', 'proveedores.id', 'pedidos.proveedor_id')
        ->select('pedidos.*', 'estados.nombre as estado', 'estados.color', 'proyectos.nombre as proyecto', 'users.name', 'tipos.nombre as tipo', 'proveedores.nombre as proveedor')
        ->where('pedidos.estado_id',$estado_id) //estado aprobacion
        ->orderBy('pedidos.created_at', 'desc')
        ->get();
        
        return view('project.pedidos_cola', compact('pedidos'));

        
    }

    public function pedidos_filtros($pedido_id)
    {
        $pedido = DB::table('pedidos')
                ->join('users','users.id','pedidos.user_id')
                ->select('pedidos.*', 'users.id as user_id','users.avatar','users.name')
                ->where('pedidos.id',$pedido_id)
                ->first();

        $solicitar_cant = DB::table('pedidos')
                        ->join('users','users.id','pedidos.user_id') 
                        ->where('pedidos.user_id',$pedido->user_id)       
                        ->count();

        $detalle_pedido = DB::table('detalle_pedidos')
                        ->join('pedidos', 'pedidos.id', 'detalle_pedidos.pedido_id')
                        ->join('users', 'users.id', 'pedidos.user_id')
                        ->join('items', 'items.id', 'detalle_pedidos.item_id')
                        ->select('items.*', 'detalle_pedidos.cantidad', 'detalle_pedidos.precio')
                        ->where('detalle_pedidos.pedido_id', $pedido_id)
                        ->get();

        switch ($pedido->estado_id) {
            case 2:
                return view('project.pedidos_aprobar', compact('pedido','detalle_pedido','solicitar_cant'));
                break;
            case 4:
                $pagos = DB::table('pagos')->orderBy('pagos.id','desc')->get();
                return view('project.pedidos_elaborar', compact('pedido','detalle_pedido','pagos'));
                break;
            default:
                # code...
                break;
        }
        
    }

    public function pedidos_final(Request $datos)
    {
        DB::table('pedidos')
            ->where('id', $datos->pedido_id)
            ->update(['estado_id' => 6, 'pago_id' => $datos->pago_id, 'datos' => $datos->datos]);
            $this->pedidos_estado($datos->pedido_id, 6);

        return redirect()->route('pedidos.cola')->with(['message' => 'Pedido registrado y enviado para contabilizar..!', 'alert-type' => 'info']);  
        
    }
    public function pedidos_rechazo(Request $datos)
    {

        $this->pedidos_estado($datos->pedido_id, 3);

        DB::table('rechazos')->insert([
            'pedido_id' => $datos->pedido_id,
            'motivo' => $datos->motivo,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()
        ]);
        return redirect()->route('pedidos.cola')->with(['message' => 'Pedido rechazado..', 'alert-type' => 'info']);
            
    }

    public function pedidos_update(Request $datos)
    {
        $detalle_pedido = \Session::get('detalle_pedido');
        if (count($detalle_pedido)>0) 
        {

            DB::table('pedidos')
                    ->where('id', $datos->pedido_id)
                    ->update([
                        'proyecto_id' => $datos->proyecto_id,
                        'proveedor_id' => $datos->proveedor_id,
                        'tipo_id' => $datos->tipo_id,
                        'referencia' => $datos->referencia,
                        'observacion' => $datos->observacion,
                        'updated_at' => Carbon::now(),
                        'total' => $this->total(),
                        'literal' => NumerosEnLetras::convertir($this->total(),'Bolivianos',true)
                    ]);
                    
            DB::table('detalle_pedidos')->where('pedido_id', $datos->pedido_id)->delete();

            $items= \Session::get('detalle_pedido');
            foreach($items as $item)
            {
                DB::table('detalle_pedidos')->insert([
                    'pedido_id' => $datos->pedido_id,
                    'item_id' => $item->id,
                    'cantidad' => $item->cantidad,
                    'precio' => $item->precio,
                    'maquinaria_id' => $item->maquinaria_id,
                    'aux_id' => $item->aux_id,
                    'subtotal' => $item->cantidad * $item->precio,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now()
                ]);
                
                DB::table('items')
                    ->where('id', $item->id)
                    ->update(['cantidad' => $item->cantidad, 'precio' => $item->precio, 'maquinaria_id' => $item->maquinaria_id]);

            }
            $this->pedidos_estado($datos->pedido_id, 2);
            $this->detalle_pedido_trash();
            return redirect()->route('pedidos.index')->with(['message' => 'Pedido actualizado correctamente..', 'alert-type' => 'info']);  

        } else {
            return redirect()->back()->with(['message' => 'Debes Ingresar Items al pedidos para poder guardar.', 'alert-type', 'warning']);
        }

    }

    public function pedidos_contabilizar()
    {
        $pedidos = DB::table('pedidos')
                    ->join('users', 'users.id', 'pedidos.user_id')                    
                    ->join('proyectos', 'proyectos.id', 'pedidos.proyecto_id')
                    ->join('proveedores', 'proveedores.id', 'pedidos.proveedor_id')
                    ->join('tipos', 'tipos.id', 'pedidos.tipo_id')
                    ->select('pedidos.*','users.name','proyectos.nombre as proyecto', 'tipos.nombre as tipo')
                    ->where('pedidos.estado_id',6)   
                    ->orderBy('pedidos.created_at','desc')
                    ->get();

        return view('project.pedidos_contabilidad', compact('pedidos'));
    }
    public function pedidos_contabilizar_detalle($pedido_id)
    {
        $dp = DB::table('detalle_pedidos')
                ->join('pedidos', 'pedidos.id', 'detalle_pedidos.pedido_id')
                ->join('users', 'users.id', 'pedidos.user_id')
                ->join('items', 'items.id', 'detalle_pedidos.item_id')
                ->join('maquinarias', 'maquinarias.id', 'detalle_pedidos.maquinaria_id')
                ->select('items.*', 'detalle_pedidos.cantidad', 'detalle_pedidos.precio','maquinarias.codigo as maquinaria')
                ->where('detalle_pedidos.pedido_id', $pedido_id)
                ->get();
        
        return view('project.pedidos_conta_detalle', compact('dp', 'maquinarias'));
    }

    public function pedidos_archivar($pedido_id)
    {
        $this->pedidos_estado($pedido_id, 5);
        return redirect()->route('pedidos.conta')->with(['message' => 'Pedido archivado correctamente..!', 'alert-type' => 'info']);
    }
    
    public function pedidos_proveedor_create()
    {
        return view('project.proveedor_create');
    }
    public function pedidos_proveedor_storage(Request $datos)
    {
        DB::table('proveedores')->insert([
            'nombre' => $datos->nombre,
            'direccion' => $datos->direccion,
            'telefono' => $datos->telefono,
            'celular' => $datos->celular,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now()

        ]);
        return redirect()->route('pedidos.create')->with(['message' => 'Provedor agreado correctamente..', 'alert-type' => 'info']);
    }

    public function pedidos_pdf($id)
    {
        $pedido = DB::table('pedidos')
                    ->join('estados','estados.id','pedidos.estado_id')
                    ->select('pedidos.*','estados.nombre as estado')
                    ->where('pedidos.id',$id)
                    ->first($id);

        $rechazo = DB::table('rechazos')
                        ->where('rechazos.pedido_id', $id)
                        ->orderBy('created_at','desc')
                        ->first();

        $detalle_pedido = DB::table('detalle_pedidos')
                        ->join('pedidos', 'pedidos.id', 'detalle_pedidos.pedido_id')
                        ->join('users', 'users.id', 'pedidos.user_id')
                        ->join('items', 'items.id', 'detalle_pedidos.item_id')
                        ->select('items.*', 'detalle_pedidos.cantidad', 'detalle_pedidos.precio', 'detalle_pedidos.maquinaria_id')
                        ->where([['detalle_pedidos.pedido_id', $id],['users.id', Auth::user()->id]])
                        ->get();

        $solicitante = DB::table('users')->where('id',$pedido->user_id)->first();

        $proyectos = DB::table('proyectos')->get();
        $tipos = DB::table('tipos')->get();
        $proveedores = DB::table('proveedores')->get();
        $pagos = DB::table('pagos')->get();

        
        //vaciamos el array.
        $this->detalle_pedido_trash();

        //recupero todos los detalles del pedido
        $dp = DB::table('detalle_pedidos')
                ->where('detalle_pedidos.pedido_id',$id)
                ->get();
   
        foreach($dp as $item)
        {
            //recuperamos (items * items) del pedido
            $new = DB::table('detalle_pedidos')
                ->join('items', 'items.id', 'detalle_pedidos.item_id')
                ->select('items.id','items.nombre','items.descripcion','detalle_pedidos.cantidad','detalle_pedidos.precio', 'detalle_pedidos.maquinaria_id','detalle_pedidos.aux_id')
                //->where([['detalle_pedidos.pedido_id', $id], ['detalle_pedidos.item_id',$item->id]])
                ->where('detalle_pedidos.aux_id', $item->aux_id)
                ->first();

            $arreglo= \Session::get('detalle_pedido');
            
            $arreglo[$item->aux_id] = $new;
    
            \Session::put('detalle_pedido',$arreglo);
        }         
        

        $dp= \Session::get('detalle_pedido');
        
        $maquinarias = DB::table('maquinarias')->get();

        $vista = view('project.pedidos_pdf', compact('proyectos','tipos','proveedores','pagos','pedido','detalle_pedido','rechazo','dp','maquinarias','solicitante'));
        $pdf = \App::make('dompdf.wrapper');
        $pdf->loadHTML($vista);
        return $pdf->stream();
    }
    //Items--------------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------------------
    public function items_index()
    {
        $items = DB::table('items')
                ->join('categorias', 'categorias.id', 'items.categoria_id')
                ->join('unidades', 'unidades.id', 'items.unidad_id')
                ->select('items.*', 'categorias.nombre as categoria', 'unidades.nombre as unidad')
                ->orderBy('items.created_at','desc')
                ->paginate(setting('admin.paginate'));
                
        $criterio = '';
        return view('project.items_index', compact('items','criterio'));
    }
    public function items_create($criterio)
    {
        $categorias = DB::table('categorias')->get();
        $unidades = DB::table('unidades')->get();
        return view('project.items_create',compact('categorias','unidades','criterio'));
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
        
        return view('project.items_index', compact('items','criterio'));
    }
    public function items_storage(Request $datos)
    {
        DB::table('items')->insert([
            'nombre' => $datos->nombre, 
            'descripcion' => $datos->descripcion, 
            'categoria_id' => $datos->categoria_id, 
            'unidad_id' => $datos->unidad_id,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
            'cantidad' => 0,
            'precio' => 0
        ]);

        $item_id = DB::table('items')->latest()->first();
        $this->detalle_pedido_storage($item_id->id);
    }

    //detalle_pedido-----------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------
    public function detalle_pedido_storage($item_id)
    {
        $random = $this->random(10);
        DB::table('items')
        ->where('id', $item_id)
        ->update(['aux_id' => $random]);

        $new = DB::table('items')
                ->select('id','nombre','descripcion','cantidad','precio', 'maquinaria_id','aux_id')
                ->where('id',$item_id)
                ->first();

        $items= \Session::get('detalle_pedido');

        $items[$random] = $new;
  
        \Session::put('detalle_pedido',$items);
    }
    public function detalle_pedido_index()
    {
        $dp= \Session::get('detalle_pedido');
        //return $dp;
        $maquinarias = DB::table('maquinarias')->get();
        return view('project.detalle_pedido_index', compact('dp', 'maquinarias'));
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
    public function detalle_pedido_edit($item_id, $campo, $valor)
    {
        $items= \Session::get('detalle_pedido');
        switch ($campo) 
        {
            case 'cantidad':
                $items[$item_id]->cantidad = $valor;
                break;
            case 'precio':
                $items[$item_id]->precio = $valor;
                break;
            case 'maquinaria_id':
                $items[$item_id]->maquinaria_id = $valor;
                break;
            default:
                # code...
                break;
        }
        \Session::put('detalle_pedido',$items);
        
    }
    public function total()
    {
        $items= \Session::get('detalle_pedido');
        $total=0;
        foreach($items as $item)
        {
            $total+= $item->cantidad * $item->precio;
        }
        return $total;
    }

    function random($length) { 
        return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length); 
    } 

    //cheque --------------------------------------------------------------
    //---------------------------------------------------------------------
    public function cheque_create()
    {
        return view('project.cheque_create');
    }

}