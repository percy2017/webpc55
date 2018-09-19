
@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('mis_pedidos_project'); ?>

@if($permits)
    @section('page_header')

    @endsection

    @section('content')

    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="col-xs-12" align="center">
                            
                            <font color="{{ config('voyager.primary_color') }}"><h3>Nuevo Material <i class="voyager-basket"></i> </h3></font>
                        </div>
                        <div class="col-xs-12"><hr></div>
                        <div class="col-xs-12">
                            <form action="{{ route('pedidos.storage') }}" method="post">
                                {{ csrf_field() }}
                                <!-- <div class="col-xs-12 col-md-6"> -->
                                    
                                
                                
                                  

                                    <div class="form-group col-md-6">
                                        <a>Nombre</a>
                                        <input type="text" class="form-control">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <a>Precio</a>
                                        <input type="number" name="" id="" class="form-control">
                                    </div>

                                    
                                    <div class="form-group col-md-12">
                                        <a>Descripcion</a>
                                        <textarea name="referencia" id="" rows="3" class="form-control">{{ setting('admin.pedidos_referencia_default') }}</textarea>
                                    </div>

                                
                                <div class="col-xs-12">
                                    <hr>
                                </div>
                                <div class="col-xs-12">
                                    <button type="button" onclick="materiales_index()"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                        <i class="voyager-plus"></i> Agregar items
                                    </button>
                                    <button type="button" onclick="detalle_pedido_trash('{{ route('detalle_pedido.trash') }}')"  class="btn btn-warning">
                                        <i class="voyager-trash"></i> Vaciar
                                    </button>
                                    <div id="table_tipos_insumos"></div>
                                </div>
                                <div class="col-xs-12">
                                    <hr>
                                </div> 
                                <div align="right">    
                                    
                                    <button type="submit" class="btn btn-primary"><i class="voyager-data"></i> Guardar</button>
                                       
                                    
                                </div>
                            </form>
                        </div>
                        
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
                    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="body_modal"></div> 
            </div>
        </div>
    </div>


    @endsection


@else 
    @section('content')
        <div aling="center">
            <h2>
                {{ setting('admin.mensaje_no_autorizado') }}
            </h2>        
        </div>
    @endsection
@endif


@section('javascript')
    <script>

        $(document).ready(function(){
            tipo_insumos_index();
            
        });

        //materiales--------------------------------------------------------
        //-------------------------------------------------------------
        function materiales_index()
        {
            $('#body_modal').empty().html('<center><img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive"></center>');
            $.ajax({
                url: '{{ route('warehouse_insumo_index') }}',
                success: function(result) {
                    
                    $('#body_modal').empty().html(result);
                }
            });
        }

        //paginacion--------------------------------------------------------
        //------------------------------------------------------------------
        $(document).on('click', '.pagination li a', function(event) {
            event.preventDefault();
            $('#body_modal').empty().html('<center><img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive"></center>');
            var url = $(this).attr("href");
            $.ajax({
                url: url,
                
                success: function(result) {
                   
                    $('#body_modal').empty().html(result);
                }
            });
        });
  
        function tipo_insumos_storage(urli)
        {
            $('#table_tipos_insumos').empty().html('<center><img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive"></center>');
            $.ajax({
                url: url,
                
                success: function(result) {
                    $('#table_tipos_insumos').empty().html(result);
                    
                   
                }
            });
        }
        function tipo_insumos_index()
        {
            $('#table_tipos_insumos').empty().html('<center><img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive"></center>');
            $.ajax({
                url: '{{ route('warehouse_tipo_insumos_index') }}',
                
                success: function(result) {
                    $('#table_tipos_insumos').empty().html(result);
                    
                   
                }
            });
        }

        function warehouse_tipo_insumos_update(urli, id)
        {
            
            valor = document.getElementById("cant-"+id).value;
            
            urli = urli.replace(':cant',valor);
            $.ajax({
                url: urli,
                
                success: function(result) {
                    
                    tipo_insumos_index();
                   
                }
            });
        }
       
    </script>
@endsection