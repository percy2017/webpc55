@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('browse_pedidos'); ?>

@if($permits)
    @section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Mis Pedidos
        </h1>
        <a href="{{ route('pedidos.create') }}" class="btn btn-primary">Nuevo</a>
    </div>
    @endsection

    @section('content')
    <div class="page-content browse container-fluid">
        @include('voyager::alerts')
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table id="dataTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>estado</th>
                                        <th>proyecto</th>
                                        <th>creado</th>
                                        <th>monto</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($pedidos as $item)
                                        <tr class='clickable-row' data-href='url://'>
                                            <td><a href="#">{{ $item->id }}</a></td>
                                            <td><a href="#">{{ $item->estado }}</a></td>
                                            <td><a href="#">{{ $item->proyecto }}</a></td>
                                            <td><a href="#">{{ $item->created_at }}</a></td>
                                            <td><a href="#">{{ $item->total }}</a></td>
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
@section('javascrtipt')
    <script>
        $(".clickable-row").click(function() {
            window.location = $(this).data("href");
        });
    </script>
@endsection
