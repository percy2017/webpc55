
@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('mis_pedidos_project'); ?>

@if($permits)
    @section('page_header')
    <!-- <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Editar Pedido
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
                            <font color="{{ config('voyager.primary_color') }}">
                            <h3>Pedido #{{ $pedido->id }} 
                                <br><small>{{ $pedido->estado }} - <a href="{{ route('pedidos.pdf', $pedido->id) }}" target="_blank"><i class="voyager-treasure-open"></i></a></small> 
                            </h3>
                            </font>

                        </div>
                        <div class="col-xs-12"><hr></div>
                        <div class="col-xs-12">
                            <fieldset @if($pedido->estado_id <> 1 and $pedido->estado_id <> 3) disabled @endif>
                                <form action="{{ route('pedidos.update') }}" method="post">
                                    {{ csrf_field() }}
                                        <input type="text" name="pedido_id" value="{{ $pedido->id }}" hidden>
                                        <div class="form-group col-md-4">
                                            <!-- <a>Proyectos</a> -->
                                            <font color="{{ config('voyager.primary_color') }}">Proyectos</font>
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
                                        <font color="{{ config('voyager.primary_color') }}"><a href="#" id="pedidos_proveedor_create" data-toggle="modal" data-target="#exampleModal">Proveedores <i class="voyager-paper-plane"></i></a>
                                        </font>
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
                                            <!-- <a>Tipo de pedido</a> -->
                                            <font color="{{ config('voyager.primary_color') }}">Tipo de pedido</font>
                                            <select name="tipo_id" id="" class="form-control select2">
                                                @foreach($tipos as $item)
                                                    @if($item->id == $pedido->tipo_id)
                                                        <option value="{{ $item->id }}" selected>{{ $item->nombre }}</option>
                                                    @else
                                                        <option value="{{ $item->id }}">{{ $item->nombre }}</option>
                                                    @endif
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <!-- <a>Referencia<a> -->
                                            <font color="{{ config('voyager.primary_color') }}">Referencia</font>
                                            <textarea name="referencia" id="" rows="3" class="form-control">{{ $pedido->referencia }}</textarea>
                                        </div>
                                    
                                        <div class="form-group col-md-6">
                                            <!-- <a>Observaciones</a> -->
                                            <font color="{{ config('voyager.primary_color') }}">Observaciones</font>
                                            <textarea name="observacion" id="" rows="3" class="form-control">{{ $pedido->observacion }}</textarea>
                                        </div>
                                        @if($pedido->estado_id === 3)
                                            <div class="form-group col-md-12">
                                            <font color="{{ config('voyager.primary_color') }}">Motivo del Rechazo</font>
                                                <!-- <label for="" class="label label-danger">Motivo del Rechazo</label> -->
                                                <textarea name="motivo" id="" rows="3" class="form-control">{{ $rechazo->motivo }}</textarea>
                                            </div>
                                        @endif
                                
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                    <div class="col-xs-12">
                                        <button type="button" onclick="items_index('{{ route('items.index') }}')"  class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                        <i class="voyager-plus"></i> Agrega items
                                        </button>
                                        <button type="button" onclick="detalle_pedido_trash('{{ route('detalle_pedido.trash') }}')"  class="btn btn-warning">
                                        <i class="voyager-trash"></i> Vaciar
                                        </button>
                                        <div id="detalle_pedido_index"></div>
                                    </div>
                                    <div class="col-xs-12">
                                        <hr>
                                    </div>
                                    <div align="right">                   
                                        
                                        <button type="submit" class="btn btn-primary"><i class="voyager-data"></i> Enviar</button>
                                    </div>
                                
                                </form>
                            </fieldset>
                            <!-- <a href="#" class="btn btn-default"><i class="voyager-treasure-open"></i> PDF</a>          -->
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

     <div class="modal modal-info fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- <font color="{{ config('voyager.primary_color') }}">Items</font> -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="items_ajax"></div>
                <!-- <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    
                    <button type="button" onclick="items_index('{{ route('items.index') }}')" class="btn btn-primary">Lista</button>
                </div> -->
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
        $('#items_ajax').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');
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
        $('#items_ajax').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');
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
        $('#detalle_pedido_index').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');
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
                case 'maquinaria_id':
                    valor = document.getElementById("maquinaria_id-"+item_id).value;
                  break;
              default:
                  break;
          }
          
          if(valor)
          {
              urli = urli.replace('valor',valor);
              //alert(urli);
              //console.log(urli);
              $.ajax({
                  url: urli,
                  type: 'get',
                  success: function(result) {
                      detalle_pedido_index();
                  }
              });
          }
          
      }

      //paginacion--------------------------------------------------------
      $(document).on('click', '.pagination li a', function(event) {
          event.preventDefault();

          $('#items_ajax').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');
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

        //proveedores--------------------------------------------------------
        //------------------------------------------------------------------

        $( "#pedidos_proveedor_create" ).click(function() {
            
            //alert('{{ route('pedidos.proveedor.create') }}');
            
            $('#items_ajax').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');

            $.ajax({
                url: '{{ route('pedidos.proveedor.create') }}',
                
                success: function(result) 
                {
                    $('#items_ajax').empty().html(result);   
                }
            });
        });

</script>
@endsection