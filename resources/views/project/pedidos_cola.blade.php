@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('pedidos_cola_project'); ?>

@if($permits)
    @section('page_header')
    <!-- <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Pedidos en Cola
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
                            
                            <font color="{{ config('voyager.primary_color') }}"><h3>Pedidos en Cola</h3></font>
                        </div>
                        
                        
                        <div class="col-xs-12"><hr></div>
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <table id="dataTable" class="table table-hover">
                                    <thead>
                                        <tr>
                                            <!-- <th>#</th>
                                            <th>estado</th> -->
                                            <th>proyecto</th>
                                            <th>tipo</th>
                                            <!-- <th>proveedor</th> -->
                                            <th>Solicitador</th>
                                            <th>creado</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($pedidos as $item)
                                            <tr class='clickable-row' data-href='{{ route('pedidos.filtros', $item->id) }}'>
                                                <!-- <td><a href="#">{{ $item->id }}</a></td>
                                                <td><a href="#"><label for="" class="{{ $item->color }}">{{ $item->estado }}</label></a></td> -->
                                                <td><a href="#">{{ $item->proyecto }}</a></td>
                                                <td><a href="#">{{ $item->tipo }}</a></td>
                                                <!-- <td><a href="#">{{ $item->proveedor }}</a></td> -->
                                                <td><a href="#">{{ $item->name }}</a></td>
                                                <td><a href="#">{{ $item->created_at }}</a><br><small>{{  \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</small></td>
                                                <td><a href="#">{{ number_format($item->total, 2, ',', ' ') }}</a></td>
                                            </tr>
                                        @endforeach      
                                    </tbody>
                                </table>
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