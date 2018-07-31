@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('browse_pedidos'); ?>

@if($permits)
    @section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Nuevo Pedido
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
                        <form action="#" method="post">
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <label for="">Proyectos</label>
                                    <select name="proyecto_id" id="" class="form-control">
                                        @foreach($proyectos as $item)
                                            <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                        @endforeach
                                    </select>
                                </div>
                               
                                <div class="form-group">
                                    <label for="">Proveedores</label>
                                    <select name="proveedor_id" id="" class="form-control">
                                        @foreach($proveedores as $item)
                                            <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="">Referencia</label>
                                    <textarea name="referencia" id="" rows="3" class="form-control"></textarea>
                                </div>

                            </div>
                            <div class="col-xs-12 col-md-6">
                                <div class="form-group">
                                    <label for="">Tipo de pedido</label>
                                    <select name="tipo_id" id="" class="form-control">
                                        @foreach($tipos as $item)
                                            <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="">Metodo de Pago</label>
                                        <select name="tipo_id" id="" class="form-control">
                                            @foreach($pagos as $item)
                                                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                            @endforeach
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="">Observaciones</label>
                                    <textarea name="observaciones" id="" rows="3" class="form-control"></textarea>
                                </div>

                            </div>
                            <div class="col-xs-12">
                                <hr>
                                <small>Items del Pedido</small>
                            </div>
                            <div class="col-xs-12">
                                <a href="#" class="btn btn-primary">Agregar Item</a>
                                
                            </div>
                            
                        </form>
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
@section('javascrtipt')

@endsection
