@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('mis_pedidos_project'); ?>

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
                    <input type="search"  id="criterio" onkeypress="return pedidos_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
                    <br>
                        <div class="table-responsive">
                            <table id="dataTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>estado</th>
                                        <th>proyecto</th>
                                        <th>tipo</th>
                                        <th>proveedor</th>
                                        <th>creado</th>
                                        <th>monto</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($pedidos as $item)
                                        <tr class='clickable-row' data-href='{{ route('pedidos.edit', $item->id) }}'>
                                            <td><a href="#">{{ $item->id }}</a></td>
                                            <td><a href="#"><label for="" class="{{ $item->color }}">{{ $item->estado }}</label></a></td>
                                            <td><a href="#">{{ $item->proyecto }}</a></td>
                                            <td><a href="#">{{ $item->tipo }}</a></td>
                                            <td><a href="#">{{ $item->proveedor }}</a></td>
                                            <td><a href="#">{{ $item->created_at }}</a><br><small>{{  \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</small></td>
                                            <td><a href="#">{{ number_format($item->total, 2, ',', ' ') }}</a></td>
                                        </tr>
                                    @endforeach      
                                </tbody>
                            </table>
                            <div align="center">
                                {{ $pedidos->links() }}
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

            function pedidos_search(e)
            {
                if (e.keyCode == 13)
                {
                    var criterio = document.getElementById('criterio').value;
                    // var criterio = $('#criterio').value;
                    
                    var urli = '{{ route('pedidos.search', 'criterio') }}';
                        urli = urli.replace('criterio', criterio);
                    if(criterio)
                    {
                        location.href= urli;
                    }else{
                        location.href= '{{ route('pedidos.index') }}';
                    }
                        
                }
                
            }

        </script>


    @endsection