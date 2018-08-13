@extends('voyager::master')

@section('css')
@endsection
<?php $permits = Voyager::can('report_sales'); ?>

@if($permits)
    @section('page_header')
    <div class="container-fluid">
        <h1 class="page-title">
            <i class="voyager-pen"></i> Consultas
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
                       
                        <div class="col-xs-3">
                            <div class="form-group">
                                <a>Tabla</a>
                                <select name="table" id="table" class="form-control">
                                    <option value="0">Selecciona una tabla</option>
                                    <option value="1">Proyectos</option>                                    
                                    <option value="2">Pedidos</option>
                                    <option value="3">Maquinarias</option>
                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-9">
                            <div class="form-group">
                                <a>Consulta</a>
                                <select name="table_option" id="table_option" class="form-control">
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <hr>
                        </div>
                        <div class="col-xs-12">
                            <div id="body"></div>
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
        $("#table").change( function(){

            var option = $("#table")[0].value;
            var myobject;
            
            switch (option) {
                case '1':
                    myobject = {
                        0 : 'Selecciona una accion',
                        1 : 'Todos, pedidos(egresos) y Avance',
                        2 : 'Todos, Ingresos',
                    };
                    break;
                case '2':
                    myobject = {
                        0 : 'Seleccione una accion',
                        1 : 'Todos con detalles',
                        2 : 'Por Tipo(categoria)',
                        3 : 'Por Proveeedor',
                        4 : 'Por Usuarios',
                    };
                    break;
                case '3':                    
                    myobject = {
                        0 : 'Seleccione una accion',
                        1 : 'Gatos'
                    };
                    break;
                default:
                    break;
            }
            
            $("#table_option").empty();
            var select = $('#table_option')[0];
            for(index in myobject) 
            {
                select.options[select.options.length] = new Option(myobject[index], index);
            }
        });

        
        $("#table_option").change( function(){
            var table = $("#table")[0].value;
            var table_option = $("#table_option")[0].value;
            var urli = '{{ route('project.query',array('table', 'table_option')) }}';
            urli = urli.replace('table', table);
            urli = urli.replace('table_option', table_option);
           
            $.ajax({
                url: urli,
                success: function(result){
                    $("#body").empty().html(result);
                },
            });

        });

        //paginacion--------------------------------------------------------
        $(document).on('click', '.pagination li a', function(event) {
            event.preventDefault();
            var url = $(this).attr("href");
            $.ajax({
                url: url,
                type: 'get',
                success: function(result) {
                    //$( "#weather-temp" ).html( "<strong>" + result + "</strong> degrees" );
                    $('#body').empty().html(result);
                }
            });
        });

    </script>
@endsection