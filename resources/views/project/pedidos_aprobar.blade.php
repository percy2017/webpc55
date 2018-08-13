@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('pedidos_cola_project'); ?>

@if($permits)
    @section('page_header')
    <!-- <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Aprobar Pedido
        </h1>
    </div> -->
    @endsection

    @section('content')

    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="col-xs-12" align="center">
                        <font color="{{ config('voyager.primary_color') }}"><h3>Aprobar Pedido # {{ $pedido->id }}</h3></font>
                        </div>
                        <div class="col-xs-12"><hr></div>
                        <div class="col-xs-12 col-md-10">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>nombre</th>
                                            <th class="hidden-xs">descripcion</th>
                                            <th>cantidad</th>
                                            <th>precio</th>
                                            <th>SubTotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php $total=0; ?>
                                        @foreach($detalle_pedido as $item)
                                            <tr>
                                                <td>{{ $loop->index + 1 }}</td>
                                                <td><font color="{{ config('voyager.primary_color') }}">{{ $item->nombre }}</font></td>
                                                <td class="hidden-xs"><font color="{{ config('voyager.primary_color') }}">{{ $item->descripcion }}</form></td>
                                                <td><font color="{{ config('voyager.primary_color') }}">{{ $item->cantidad }}</font></td>
                                                <td><font color="{{ config('voyager.primary_color') }}">{{ $item->precio }}</font></td> 
                                                <td><font color="{{ config('voyager.primary_color') }}">{{ number_format($item->precio * $item->cantidad, 2, ',', ' ') }}</form></t
                                                <?php $total = $total + ($item->cantidad * $item->precio); ?>
                                            </tr>
                                        @endforeach
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            
                                            
                                            <td><a>Total:</a></td>
                                            <td><a>{{ number_format($total, 2, ',', ' ') }}</a></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-2">
                            
                            <div class="form-group">
                                <img src="{{ asset('storage/'.$pedido->avatar) }}" alt="" class="img img-responsive">
                            </div>
                            <div class="form-group" align="center">
                                <p><font color="{{ config('voyager.primary_color') }}">solicitante: </font> <br>{{ $pedido->name }}</p>
                                <p><font color="{{ config('voyager.primary_color') }}">Cant. de Pedidos:</font><br>{{ $solicitar_cant }}</p>
                                
                            </div>
                        </div>
                        
                        <div class="col-xs-12"><hr></div>
                        
                        <div class="col-xs-12" align="center">
                            <button data-toggle="modal" data-target="#aprobar_modal" class="btn btn-primary">Aprobar</button>
                            <button data-toggle="modal" data-target="#comfir_modal" class="btn btn-danger">Rechazar</button>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- rechazar -->
    <div class="modal modal-primary fade" tabindex="-1" id="comfir_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
            <form action="{{ route('pedidos.rechazo') }}" method="post">
                {{ csrf_field() }}
                <input type="text" name="pedido_id" value="{{ $pedido->id }}" hidden>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-pen"></i> Esta seguro de rechazar ?</h4>
                </div>
                <div class="modal-body">
                    
                    <textarea name="motivo" id="" rows="6" class="form-control" placeholder="Escribe las motivo del rechazo"></textarea>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary">Enviar</button>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!-- Aprobar  -->
    <div class="modal modal-info fade" tabindex="-1" id="aprobar_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-pen"></i> Esta seguro de aprobar ?</h4>
                </div>
                <div class="modal-footer">
                    <button onclick="aprobar('{{ route('pedidos.estado', array($pedido->id, 4)) }}')" class="btn btn-primary">Aceptar</button>
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
   <script>
    function aprobar(urli)
    {
        $.ajax({
            type: "get",
            url: urli,
            success: function (response) {
                location.href='{{ route('pedidos.cola') }}';
            }
        });
    }
   </script>
@endsection
