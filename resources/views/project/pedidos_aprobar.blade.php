@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('browse_pedidos'); ?>

@if($permits)
    @section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Aprobar Pedido
        </h1>
    </div>
    @endsection

    @section('content')

    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>nombre</th>
                                        <th>descripcion</th>
                                        <th>cantidad</th>
                                        <th>precio</th>
                                        <th>SubTotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($detalle_pedido as $item)
                                        <tr>
                                            <td>{{ $item->id }}</td>
                                            <td>{{ $item->nombre }}</td>
                                            <td>{{ $item->descripcion }}</td>
                                            <td>{{ $item->cantidad }}</td>
                                            <td>{{ $item->precio }}</td> 
                                            <td>{{ number_format($item->precio * $item->cantidad, 2, ',', ' ') }}</t
                                        </tr>
                                    @endforeach
                            
                                </tbody>
                            </table>
                        </div>
                        <hr>
                        <div align="center">
                            <a href="{{ route('pedidos.estado', array($pedido->id, 4)) }}" class="btn btn-primary">Aprobar</a>
                            <a href="#" class="btn btn-danger">Rechazar</a>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>

    @endsection


@else 
    @section('content')
        <div align="center">
            <h2>
                {{ setting('admin.mensaje_no_autorizado') }}
            </h2>        
        </div>
    @endsection
@endif


@section('javascript')
   
@endsection
