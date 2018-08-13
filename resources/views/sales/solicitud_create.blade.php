@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('mis_pedidos_sales'); ?>

@if($permits)
    @section('page_header')
    <!-- <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Nueva Solicitud
        </h1>
    </div> -->
    @endsection

    @section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <form action="{{ route('solicitud.storage') }}" method="post">
                    {{ csrf_field() }}
                        <div class="panel-body">
                            <div class="col-xs-12 col-md-6">
                                <h4 align="center"><a> Datos de la Solicitud</a></h4>                             
                                <div class="form-group">
                                    <a>Cliente </a> - <a href="{{ route('voyager.clientes.create') }}"> Nuevo</a>
                                    <select name="cliente_id" id="cliente_id" class="form-control select2">
                                        @foreach($clientes as $item)
                                            <option value="{{ $item->id }}">{{ $item->nombre_completo }}</option>
                                        @endforeach
                                    </select>                                
                                </div>
                                <div class="form-group">
                                    <a>Fecha</a>
                                    <input type="date" name="fecha_entrega" class="form-control" required>                         
                                </div>
                                <div class="form-group">
                                    <a>Hora</a>
                                    <input type="time" name="hora_entrega" class="form-control" required>                         
                                </div>
                                <div class="form-group">
                                    <a>Direccion</a>
                                    <textarea name="direccion_entrega" id="" rows="3" class="form-control" required></textarea>                         
                                </div>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <h4 align="center"><a>Mapa</a></h4>
                                <div id="map" style="height: 320px;"></div>
                                <input type="text" name="latitud" id="latitud" hidden>
                                <input type="text" name="longitud" id="longitud" hidden>
                            </div>
                            <div class="col-xs-12"><hr></div>

                            <div class="col-xs-12">
                                <button type="button" onclick="materiales_index('{{ route('materiales.index') }}')"  class="btn btn-primary" data-toggle="modal" data-target="#materiales_modal">
                                        Agregar Material
                                </button>
                                <button type="button" onclick="detalle_solicitud_trash('{{ route('ds.trash') }}')"  class="btn btn-warning">
                                    Vaciar
                                </button>
                                <div id="materiales_detalles_ajax"></div>
                            </div>
                            <div class="col-xs-12"><hr></div>
                            <div class="col-xs-12" align="right">         
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>
                        </div>  
                    </form>              
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Materiales-->
    <div class="modal modal-info fade" id="materiales_modal" tabindex="-1" role="dialog" aria-labelledby="materiales_modal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="#">Materiales</h3>
                </div>
                <div class="modal-body">
                    <div id="materiales_ajax"></div>
                <div class="modal-footer">
                    <a href="{{ route('voyager.materiales.create') }}" class="btn btn-primary">Nuevo</a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
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
          
            detalle_solicitud_index();
        });

        //Materiales ---------------------------------------------------------------
        //--------------------------------------------------------------------------
        function materiales_index(urli)
        {          
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result){
                    $('#materiales_ajax').empty().html(result);
                } 
            });
        }
        
        //detalle solicitud---------------------------------------------------------
        //--------------------------------------------------------------------------
        function detalle_solicitud_storage(urli)
        {   
            $('#materiales_modal').modal('toggle');
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result){
                    detalle_solicitud_index()
                } 
            });
        }
        function detalle_solicitud_index()
        {   
            $.ajax({
                url: '{{ route('ds.index') }}',
                type: 'get',
                success: function(result){
                    $('#materiales_detalles_ajax').empty().html(result);
                } 
            });
        }
        function detalle_solicitud_delete(urli)
        {
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result) {
                    detalle_solicitud_index();
                }
            });
        }
        function detalle_solicitud_trash(urli)
        {
            
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result) {
                    detalle_solicitud_index();
                }
            });
        }
        function detalle_solicitud_edit(id, urli)
        {
            
            cantidad = document.getElementById("cant-"+id).value;
            urli = urli.replace('cantidad',cantidad);
            console.log(urli);
            $.ajax({
                url: urli,
                type: 'get',
                success: function(result) {
                    detalle_solicitud_index();
                }
            });
        }
      
        //mapa---------------------------------------------------------------------
        //-------------------------------------------------------------------------
        
        var map;
        function initMap() {
            //var geo_options = {enableHighAccuracy:true, maximumAge:30000, timeout:27000};
            //navigator.geolocation.getCurrentPosition(mapear,showError,geo_options);
            
            var latitud = -14.8390304;
            var longitud = -64.9059202;

            map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: latitud, lng: longitud},
            zoom: 13
            });
            
            marker = new google.maps.Marker({
            map: map,
            draggable: true,
            animation: google.maps.Animation.DROP,
            position: {lat: latitud, lng: longitud}
            });

            document.getElementById('latitud').value = latitud;
            document.getElementById('longitud').value = longitud;

            // marker.addListener('click', toggleBounce);
            marker.addListener( 'dragend', function (event)
            {
            document.getElementById('latitud').value = this.getPosition().lat();
            document.getElementById('longitud').value = this.getPosition().lng();

            });
        }
        
        //paginacion--------------------------------------------------------
        //------------------------------------------------------------------
        $(document).on('click', '.pagination li a', function(event) {
            event.preventDefault();
            var url = $(this).attr("href");
            $.ajax({
                url: url,
                type: 'get',
                success: function(result) {
                    //$( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
                    $('#materiales_ajax').empty().html(result);
                }
            });
        });

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNWZnAhzMWHtZTackIMS6pJO8wOYOKR2o&callback=initMap"
    async defer></script>
    

@endsection