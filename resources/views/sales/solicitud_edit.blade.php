@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('mis_pedidos_sales'); ?>

@if($permits)
    @section('page_header')
    <!-- <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Solicitud # {{ $solicitud->id }}
            <?php $estado = DB::table('ventas')->where('solicitud_id',$solicitud->id)->first(); ?>
     
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
                            <font color="{{ config('voyager.primary_color') }}"><h3>Solicitud # {{ $solicitud->id }}</h3></font>
                        </div>
                        <div class="col-xs-12"><hr></div>
                        <div class="col-xs-12">
                            <fieldset @if($estado) disabled @endif>
                                <div class="col-xs-12 col-md-6">
                                    <h4 align="center"><a>Envios</a></h4>
                                    <div id="envios_ajax"></div>

                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <h4 align="center"><a>Mapa</a></h4>
                                    <div id="map" style="height: 300px;"></div>
                                    <div class="form-group">
                                        <label for="">Direccion</label>
                                        <input type="text" name="" id="" class="form-control" value="{{ $solicitud->direccion_entrega }}" readonly>
                                    </div>
                                </div>
                                <div class="col-xs-12"><hr></div>
                                <div class="col-xs-12">
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>nombre</th>
                                                    <th>descripcion</th>
                                                    <th>cantidad</th>
                                                    <th>precio</th>
                                                    <th>subtotal</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $total=0; ?>
                                            
                                                @foreach($detalle_solicitud as $item)
                                                    <tr>
                                                        <td><a>{{ $item->id }}</a></td>
                                                        <td><a>{{ $item->nombre }}</a></td>
                                                        <td><a>{{ $item->descripcion }}</a></td>
                                                        <td><a>{{ $item->cantidad }}</a></td>
                                                        <td><a>{{ $item->precio }}</a></td>
                                                        
                                                        <td><a>{{ number_format(($item->cantidad * $item->precio), 2, ',', ' ') }}</a></td>
                                                        
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
                                <div class="col-xs-12">
                                    
                                    <form action="{{ route('ventas.storage') }}" method="post">  
                                        {{ csrf_field() }}
                                        <input type="text" name="solicitud_id" value="{{ $solicitud->id }}" hidden>
                                        <div class="form-group">
                                            <a>Detalle de la Venta</a>
                                            <textarea name="descripcion" id="" rows="3" class="form-control" required></textarea>
                                        </div>
                                        <div align="right">
                                            <button class="btn btn-primary" type="submit">Finalizar Venta</button>
                                        </div>
                                    </form>
                                </div>
                            </fieldset>
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
    <script>

        $(document).ready(function(){
            envios_index();
        });

        //envios--------------------------------------------------------
        //-------------------------------------------------------------
        function envios_index()
        {
            $.ajax({
                url: '{{ route('solicitud.envios.index', $solicitud->id) }}',
                beforesend: function()
                {
                    $('#envios_ajax').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');
                },
                success: function(result) {
                    //$( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
                    $('#envios_ajax').empty().html(result);
                }
            });
        }
        function envios_create()
        {
           
           $.ajax({
                url: '{{ route('solicitud.envios.create', $solicitud->id) }}',
                beforesend: function()
                {
                    $('#envios_ajax').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');
                },
                success: function(result) {
                    $('#envios_ajax').empty().html(result);                    
                }
            });
        }
     
        function envios_storage()
        {
           
           $.ajax({
                url: '{{ route('solicitud.envios.storage') }}',
                type: 'post',
                data: $('#envios-form').serialize(),
                
                beforesend: function()
                {
                    $('#envios_ajax').empty().html('<img src="{{ asset('storage/'.setting('admin.load')) }}" class="img-responsive">');
                },
                success: function(data) { 
                                     
                    envios_index();                    
                }
            });
        }

        

        //mapa--------------------------------------------------------
        //-------------------------------------------------------------
        var map;
        function initMap() {
            //var geo_options = {enableHighAccuracy:true, maximumAge:30000, timeout:27000};
            //navigator.geolocation.getCurrentPosition(mapear,showError,geo_options);
            
            var latitud = {{ $solicitud->latitud }};
            var longitud = {{ $solicitud->longitud }};
           
            map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: latitud, lng: longitud},
            zoom: 13
            });
            
            marker = new google.maps.Marker({
            map: map,
            draggable: false,
            animation: google.maps.Animation.DROP,
            position: {lat: latitud, lng: longitud}
            });
        }
    </script>
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNWZnAhzMWHtZTackIMS6pJO8wOYOKR2o&callback=initMap"
    async defer></script>
@endsection