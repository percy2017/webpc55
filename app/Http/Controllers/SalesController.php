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
        if(!\Session::has('detalle_venta')) \Session::put('detalle_venta',array());
    }
    
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
        
        return view('sales.solicitud_create');
    }
    public function solicitud_edit($id)
    {
        
        return view('sales.solicitud_edit');
    }
    

}
