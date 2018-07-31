<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ProjectController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

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


}
