@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('mis_pedidos_sales'); ?>

@if($permits)
    @section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Nueva Solicitud
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

@endsection