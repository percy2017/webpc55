@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('contabilidad_project'); ?>

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
                        <div class="table-responsive">
                        <table id="dataTable" class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <!-- <th>estado</th> -->
                                    <th>proyecto</th>
                                    <th>tipo</th>
                                    <!-- <th>proveedor</th> -->
                                    <th>Solicitador</th>
                                    <th>creado</th>
                                    <th>Total</th>
                                    <th>Items</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($pedidos as $item)
                                    <tr class='clickable-row' data-href='{{ route('pedidos.filtros', $item->id) }}'>
                                        <td>{{ $loop->index + 1 }} - {{ $item->id }}</td>
                                        <td><font color="{{ config('voyager.primary_color') }}"><strong>{{ $item->proyecto }}</strong></font></td>
                                        <td><font color="{{ config('voyager.primary_color') }}"><strong>{{ $item->tipo }}</strong></font></td>
                                        <td><font color="{{ config('voyager.primary_color') }}"><strong>{{ $item->name }}</strong></font></td>
                                        <td><a href="#">{{ $item->created_at }}</a><br><small>{{  \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</small></td>
                                        <td><a href="#">{{ number_format($item->total, 2, ',', ' ') }}</a></td>
                                        <td><button onclick="cargar('{{ route('pedidos.conta.detalle', $item->id) }}', {{ $item->id }})" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#myModal">Items</button></td>
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

    <!-- Modal -->
<div class="modal modal-info fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Detalle del pedido</h4>
      </div>
      <div class="modal-body">
        <input type="text" id="pedido_id" hidden>
        <div id="modal_body"></div>
      </div>
      <div class="modal-footer">
        <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        <button onclick="archivar('{{ route('pedidos.archivar', ':pedido_id') }}')" type="button" class="btn btn-primary">Archivar</button>
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
    function cargar(urli, pedido_id)
    {
        
        document.getElementById('pedido_id').value = pedido_id;
        $.ajax({
            url: urli,
            success: function(result){
                $('#modal_body').empty().html(result);
            },
        });
    }

    function archivar(urli) 
    {
        var pedido_id = document.getElementById('pedido_id').value;
        urli = urli.replace(':pedido_id', pedido_id);
        //alert(urli);
;        location.href= urli;
    }
</script>
@endsection