@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('browse_pedidos'); ?>

@if($permits)
    @section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Editar Pedido
        </h1>
        <button class="btn btn-primary" data-toggle="modal" data-target="#comfir_modal"  @if($pedido->estado_id <> 1) disabled @endif>Enviar</button>
    </div>
    @endsection

    @section('content')

    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                    <fieldset @if($pedido->estado_id <> 1) disabled @endif>
                    <form action="{{ route('pedidos.storage') }}" method="post" disabled>
                            {{ csrf_field() }}
                            <!-- <div class="col-xs-12 col-md-6"> -->
                                <div class="form-group col-md-4">
                                    <label for="">Proyectos</label>
                                    <select name="proyecto_id" id="" class="form-control select2">
                                        @foreach($proyectos as $item)
                                            @if($item->id == $pedido->proyecto_id)
                                                <option value="{{ $item->id }}" selected>{{ $item->nombre }}</option>
                                            @else
                                                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                            @endif
                                            
                                        @endforeach
                                    </select>
                                </div>
                               
                                <div class="form-group col-md-4">
                                    <label for="">Proveedores</label>
                                    <select name="proveedor_id" id="" class="form-control select2">
                                        @foreach($proveedores as $item)
                                            @if($item->id == $pedido->proveedor_id)
                                                <option value="{{ $item->id }}" selected>{{ $item->nombre }}</option>
                                            @else
                                                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                            @endif
                                            
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="">Tipo de pedido</label>
                                    <select name="tipo_id" id="" class="form-control select2">
                                        @foreach($tipos as $item)
                                            @if($item->id == $pedido->proveedor_id)
                                                <option value="{{ $item->id }}" selected>{{ $item->nombre }}</option>
                                            @else
                                                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                            @endif
                                            
                                            
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="">Referencia</label>
                                    <textarea name="referencia" id="" rows="3" class="form-control">{{ $pedido->referencia }}</textarea>
                                </div>
                            
                            <!-- </div> -->
                            <!-- <div class="col-xs-12 col-md-6"> -->
                                

                                <!-- <div class="form-group">
                                    <label for="">Metodo de Pago</label>
                                        <select name="pago_id" id="" class="form-control select2">
                                            @foreach($pagos as $item)
                                                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                            @endforeach
                                    </select>
                                </div> -->

                                <div class="form-group col-md-6">
                                    <label for="">Observaciones</label>
                                    <textarea name="observacion" id="" rows="3" class="form-control">{{ $pedido->observacion }}</textarea>
                                </div>

                            <!-- </div> -->
                            <div class="col-xs-12">
                                <hr>
                            </div>
                            <div class="col-xs-12">
                                
                                        <button type="button" onclick="items_index('{{ route('items.index') }}')"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                            Agrega items
                                        </button>
                                        <!-- <button type="button" onclick="detalle_pedido_trash('{{ route('detalle_pedido.trash') }}')"  class="btn btn-warning">
                                            Vaciar
                                        </button> -->
                                 
                                
                                
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>nombre</th>
                                                <th>descripcion</th>
                                                <th>cantidad</th>
                                                <th>precio</th>
                                                <th>Eliminar</th>
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
                                                   
                                                        <td><a class="btn btn-danger"><i class="voyager-trash"></i></a></td>
                                           
                                                   
                                                </tr>
                                            @endforeach
                                    
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                            <div class="col-xs-12">
                                <hr>
                            </div>
                            <div align="right">    
                                    <button type="submit" class="btn btn-primary">Actualizar</button>
                            </div>
                        </form>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal modal-info fade" tabindex="-1" id="comfir_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="close"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-pen"></i> Esta seguro de realizar  la accion ?</h4>
                </div>
                <div class="modal-footer">
                    <a href="{{ route('pedidos.estado', array($pedido->id, 2)) }}" class="btn btn-primary">Enviar</a>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

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
