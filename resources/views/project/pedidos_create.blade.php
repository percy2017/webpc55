@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('mis_pedidos_project'); ?>

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
                        <form action="{{ route('pedidos.storage') }}" method="post">
                            {{ csrf_field() }}
                            <!-- <div class="col-xs-12 col-md-6"> -->
                                <div class="form-group col-md-4">
                                    <label for="">Proyectos</label>
                                    <select name="proyecto_id" id="" class="form-control select2">
                                        @foreach($proyectos as $item)
                                            <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                        @endforeach
                                    </select>
                                </div>
                               
                                <div class="form-group col-md-4">
                                    <label for="">Proveedores</label>
                                    <select name="proveedor_id" id="" class="form-control select2">
                                        @foreach($proveedores as $item)
                                            <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="">Tipo de pedido</label>
                                    <select name="tipo_id" id="" class="form-control select2">
                                        @foreach($tipos as $item)
                                            <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <!-- <div class="form-group col-md-4">
                                    <label for="">Metodo de Pago</label>
                                        <select name="pago_id" id="" class="form-control select2">
                                            @foreach($pagos as $item)
                                                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                            @endforeach
                                    </select>
                                </div> -->

                                <div class="form-group col-md-6">
                                    <label for="">Observaciones</label>
                                    <textarea name="observacion" id="" rows="3" class="form-control">{{ setting('admin.pedidos_observacion_default') }}</textarea>
                                </div>

                            <!-- </div> -->
                            <!-- <div class="col-xs-12 col-md-6"> -->
                                

                                
                                <div class="form-group col-md-6">
                                    <label for="">Referencia</label>
                                    <textarea name="referencia" id="" rows="3" class="form-control">{{ setting('admin.pedidos_referencia_default') }}</textarea>
                                </div>

                            <!-- </div> -->
                            <div class="col-xs-12">
                                <hr>
                            </div>
                            <div class="col-xs-12">
                                <button type="button" onclick="items_index('{{ route('items.index') }}')"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                    Agregar items
                                </button>
                                <button type="button" onclick="detalle_pedido_trash('{{ route('detalle_pedido.trash') }}')"  class="btn btn-warning">
                                    Vaciar
                                </button>
                                <div id="detalle_pedido_index"></div>
                            </div>
                            <div class="col-xs-12">
                                <hr>
                            </div> 
                            <div align="right">     
                                <input type="checkbox" name="aprobacion"> Enviar para Aprobación          
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

     <!-- Modal -->
    <div class="modal modal-info fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">Items</h3>
                    <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button> -->
                </div>
                <div class="modal-body">
                    <div id="items_ajax"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    
                    <!-- <button type="button" onclick="items_index('{{ route('items.index') }}')" class="btn btn-primary">Lista</button> -->
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

        $(document).ready(function(){
          
            detalle_pedido_index();
        });

        //items--------------------------------------------------------
        function items_index(urli)
        {
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result) {
                    //$( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
                    $('#items_ajax').empty().html(result);
                }
            });
        }
        
        function items_create(urli)
        {
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result) {
                    //$( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
                    $('#items_ajax').empty().html(result);
                }
            });
        }
        function items_storage(urli)
        {
            var miform = $('#form-items-create');
            var data = miform.serialize();
            $.ajax({
                url: urli,
                type: 'post',
                data: data,
                success: function(result) {
                    $('#exampleModal').modal('toggle');
                    detalle_pedido_index();
                }
            });
        }

        function items_search(e)
        {
            if (e.keyCode == 13)
            {
                var criterio = document.getElementById('criterio').value;
                // var criterio = $('#criterio').value;
                 
                var urli = '{{ route('items.search', 'criterio') }}';
                    urli = urli.replace('criterio', criterio);
                    $.ajax({
                        url: urli,
                        type: 'get',
                        success: function(result) {
                            //$( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
                            $('#items_ajax').empty().html(result);
                        }
                    });
            }
            
        }

        //detalle_pedido---------------------------------------------------------------------

        function detalle_pedido_index()
        {
            $.ajax({
                url: '{{ route('detalle_pedido.index') }}',
                type: 'get',
                success: function(result) {
                    $('#detalle_pedido_index').empty().html(result);
                }
            });
        }
        function detalle_pedido_storage(urli)
        {
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result) {
                   
                    $('#exampleModal').modal('toggle');
                    detalle_pedido_index();
                }
            });
        }
        function detalle_pedido_trash(urli)
        {
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result) {
                    detalle_pedido_index();
                }
            });
        }
        function detalle_pedido_delete(urli)
        {
          
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result) {
                    detalle_pedido_index();
                }
            });
        }

        function detalle_pedido_edit(item_id, campo, urli)
        {
            //alert(campo);
            var valor;
            switch (campo) {
                case 'cantidad':
                    valor = document.getElementById("cant-"+item_id).value;
                    break;
                case 'precio':
                    valor = document.getElementById("precio-"+item_id).value;
                    break;
                default:
                    break;
            }
            
            if(valor)
            {
                urli = urli.replace('valor',valor);
                //alert(urli);
                $.ajax({
                    url: urli,
                    type: 'get',
                    success: function(result) {
                        //detalle_pedido_index();
                    }
                });
            }
            
        }

        //paginacion--------------------------------------------------------
        $(document).on('click', '.pagination li a', function(event) {
            event.preventDefault();
            var url = $(this).attr("href");
            $.ajax({
                url: url,
                type: 'get',
                success: function(result) {
                    //$( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
                    $('#items_ajax').empty().html(result);
                }
            });
        });
    </script>
@endsection
