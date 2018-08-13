@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('mis_pedidos_sales'); ?>

@if($permits)
    @section('page_header')
    <!-- <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Mis Solicitudes
        </h1>
        <a href="{{ route('solicitud.create') }}" class="btn btn-primary">Nuevo</a>
    </div> -->
    @endsection

    @section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="col-xs-6">
                            <font color="{{ config('voyager.primary_color') }}"><h3>Mis Solicitudes</h3></font>
                        </div>
                        <div class="col-xs-6" align="right">
                            <a href="{{ route('solicitud.create') }}" class="btn btn-primary">Nuevo</a>                        </div>
                        <div class="col-xs-12"><hr></div>
                        
                        <div class="col-xs-12">
                        <input type="search"  id="criterio" onkeypress="return items_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
                        <br>
                            <div class="table-responsive">
                                <table id="dataTable" class="table table-hover">
                                    <thead>
                                        <tr>
                                            <!-- <th>#</th> -->
                                            <th>Creada</th>
                                            <th>Entregar</th>
                                            <th>cliente</th>
                                            <th>direccion</th>
                                            <th>total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($solicitudes as $item)
                                            <tr class='clickable-row' data-href='{{ route('solicitud.edit', $item->id) }}'>
                                                <!-- <td><a>{{ $item->id }}</a></td> -->
                                                <td><a>{{ $item->created_at }}</a><br><small>{{  \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</small></td>
                                                <td><a>{{ $item->fecha_entrega }}</a><br><small>{{  \Carbon\Carbon::parse($item->fecha_entrega)->diffForHumans() }}</small></td>
                                                <td><a>{{ $item->nombre_completo }}</a></td>
                                                <td><a>{{ $item->direccion_entrega }}</a></td>
                                                <td><a>{{  number_format($item->total, 2, ',', ' ') }}</a></td>
                                                
                                            </tr>
                                        @endforeach      
                                    </tbody>
                                </table>
                                <div align="center">
                                    {{ $solicitudes->links() }}
                                </div>
                            </div>
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
            $(".clickable-row").click(function() {
                window.location = $(this).data("href");
            });
        </script>
    @endsection