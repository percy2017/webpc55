@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('pedidos_cola_project'); ?>

@if($permits)
    @section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Pedido para elaboracion
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
                        <form action="{{ route('pedidos.final') }}" method="POST">
                        {{ csrf_field() }}
                            <input type="text" name="pedido_id" value="{{ $pedido->id }}" hidden>
                            <div class="form-group col-md-6">
                                <label for="">Tipo de Pago</label>
                                <select name="pago_id" id="" class="form-control select2">
                                    @foreach($pagos as $item)
                                        <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="">Datos del Pago</label>
                                <textarea name="datos" id="" rows="3" class="form-control">{{ setting('admin.pedidos_datos_default') }}</textarea>
                            </div>
                                
                            <div class="col-xs-12">
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
                                                        <td>{{ number_format($item->precio * $item->cantidad, 2, ',', ' ') }}</td> 
                                                    </tr>
                                                @endforeach
                                        
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div align="right">
                                    <button type="submit" class="btn btn-primary">Finalizar</button>
                                </div>
                            </div>
                        </form>
                    
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