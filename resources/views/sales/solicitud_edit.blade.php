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
                                    <h4 align="center"><a>Venta</a></h4>
                                    <form action="{{ route('ventas.storage') }}" method="post">  
                                        {{ csrf_field() }}
                                        <input type="text" name="solicitud_id" value="{{ $solicitud->id }}" hidden>
                                        <div class="form-group">
                                            <a>Detalle</a>
                                            <textarea name="descripcion" id="" rows="3" class="form-control"></textarea>
                                        </div>
                                        <div align="right">
                                            <button class="btn btn-primary" type="submit">Enviar</button>
                                        </div>
                                    </form>
                                    
                                </div>
                                <div class="col-xs-12 col-md-6">
                                    <h4 align="center"><a>Mapa</a></h4>
                                    <div id="map" style="height: 300px;"></div>
                                    
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
                                                    <th>Eliminar</th>
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
                                                        <td><a onclick="detalle_solicitud_delete('{{ route('ds.delete', $item->id) }}')" class="btn btn-danger"><i class="voyager-trash"></i></a></td>
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