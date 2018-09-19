@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('pedidos_cola_project'); ?>

@if($permits)
    @section('page_header')
    <!-- <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Pedido para elaboracion
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
                            <!-- <h3>Pedido para elaboracion</h3> -->
                            <font color="{{ config('voyager.primary_color') }}"><h3><i class="voyager-tools"></i> Elaborar Pedido # {{ $pedido->id }}</h3></font>
                        </div>
                        <div class="col-xs-12"><hr></div>
                        <form action="{{ route('pedidos.final') }}" method="POST">
                        {{ csrf_field() }}
                            <input type="text" name="pedido_id" value="{{ $pedido->id }}" hidden>
                            <div class="form-group col-md-6">                                
                                <font color="{{ config('voyager.primary_color') }}">Tipo de Pago</font>
                                <select name="pago_id" id="pago_id" class="form-control select2">
                                    <option value="" disabled selected>Selecciona el metodo de pago</option>
                                    @foreach($pagos as $item)
                                        <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="form-group col-md-6">
                                
                                <font color="{{ config('voyager.primary_color') }}">Datos del Pago</font>
                                <textarea name="datos" id="" rows="3" class="form-control" required>{{ setting('admin.pedidos_datos_default') }}</textarea>
                            </div>
                                
                            <div class="col-xs-12">
                                <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <!-- <th>id</th> -->
                                                    <th>#</th>
                                                    <th>nombre</th>
                                                    <th>descripcion</th>
                                                    <th>cantidad</th>
                                                    <th>precio</th>
                                                    <th>SubTotal</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $total=0; ?>
                                                @foreach($detalle_pedido as $item)
                                                    <tr>
                                                        <!-- <td>{{ $item->id }}</td> -->
                                                        <td>{{ $loop->index + 1 }}</td>
                                                        <td><font color="{{ config('voyager.primary_color') }}">{{ $item->nombre }}</font></td>
                                                        <td><font color="{{ config('voyager.primary_color') }}">{{ $item->descripcion }}</font></td>
                                                        <td><font color="{{ config('voyager.primary_color') }}">{{ $item->cantidad }}</font></td>
                                                        <td><font color="{{ config('voyager.primary_color') }}">{{ $item->precio }}</font></td> 
                                                        <td><font color="{{ config('voyager.primary_color') }}">{{ number_format($item->precio * $item->cantidad, 2, ',', ' ') }}</font></td> 
                                                        <?php $total = $total + ($item->cantidad * $item->precio); ?>
                                                    </tr>
                                                @endforeach
                                                <tr>
                                                    <td></td>
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
                                <div class="col-xs-12"><hr></div>
                                <div align="right">
                                    <button type="submit" class="btn btn-primary"><i class="voyager-check"></i> Enviar a contabilizar</button>
                                    <a href="{{ route('pedidos.pdf', $pedido->id) }}" target="_blank" class="btn btn-default"><i class="voyager-treasure-open"></i> PDF</a>
                                </div>
                            </div>
                            
                        </form>
                    
                </div>
            </div>
        </div>
    </div>




        <!-- Modal -->
    <div class="modal modal-info fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <!-- <h4 class="modal-title" id="myModalLabel">Modal title</h4> -->
            </div>
            <div class="modal-body">
                <div id="body_modal"></div>
            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
                <button type="button" class="btn btn-primary">Guardar</button>
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
    <script>
        	
        $( "#pago_id" ).change(function() {
            if(document.getElementById('pago_id').value == 3) 
            {
                $('#body_modal').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');
                $.ajax({
                    url: '{{ route('project_cheque_create') }}',
                    success: function (result) {
                        $('#body_modal').empty().html(result);
                    }
                });
                $('#myModal').modal('show');
            }
            
        });


    </script>
@endsection