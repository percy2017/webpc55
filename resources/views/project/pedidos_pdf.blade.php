
<!DOCTYPE html>
<html lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
        <title>{{ setting('admin.title') }}</title>

        <!-- Bootstrap CSS -->
        <!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.3/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            {{ setting('pdf.style_table') }}
            body { 
            
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: center; 
            }

            .page-break {
                page-break-after: always;
            }

            .footer{
                position:absolute;
                bottom:5px;
                right:10px;
            }

           
        </style>
    </head>
    <body  @if(setting('pdf.activar_marca_agua')) background="{{ asset('storage/'.setting('pdf.marca_agua')) }}" @endif>
        <!-- <h1 class="text-center">Hello World</h1> -->

        
        <!-- <table border="0" style="width: 100%;">
            <tbody>
                <tr align="center">
                    <td>
                        <font color="{{ config('voyager.primary_color') }}" style="font-size: 30px;">
                            Pedido #{{ $pedido->id }}
                            
                        </font>
                        <br>
                        {{ $pedido->estado }}                
                    </td>
                </tr>
            </tbody>
        </table> -->

        <!-- <div align="center">
            <h1>Pedido #{{ $pedido->id }}</h1>
            <small> {{ $pedido->estado }}</small>
        </div> -->
        <small>{{ setting('pdf.header') }} </small> 
        <br>
        <br>
        <div class="datagrid">
        <table>
            <thead>
                <tr>
                    <th># Pedido</th>
                    <th>Estado</th>
                    <th>Fecha Impresión</th>
                </tr>
            </thead>
            <tbody>
                <td>
                    {{ $pedido->id }} 
                </td>
                <td>
                    {{ $pedido->estado }}
                </td>
                <td>
                    {{ \Carbon\Carbon::now() }}
                </td>
            </tbody>
        </table>
        </div>
        <br>
        
        <div class="datagrid">
        <table>
            <thead>
                    <tr>
                        <th>Proyecto</th>
                        <th>Proveedor</th>
                        <th>Tipo de pedido</th>
                
                    </tr>
                </thead>
            <tbody>
                <tr>
                    <td>
                                              
                            @foreach($proyectos as $item)
                                @if($item->id == $pedido->proyecto_id)
                                    {{ $item->nombre }}
                                @endif                                                
                            @endforeach
                    </td>
                    <td>
                                            
                            @foreach($proveedores as $item)
                                @if($item->id == $pedido->proveedor_id)
                                  {{ $item->nombre }}
                                @endif                                                
                            @endforeach
                    </td>
                    <td>
                                               
                            @foreach($tipos as $item)
                                @if($item->id == $pedido->tipo_id)
                                    {{ $item->nombre }}
                                @endif                                                
                            @endforeach
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        <br>
        
        <div class="datagrid">
            <table>
            <thead>
                <tr>
                    <th>Solicitante</th>
                    <th>Fecha de Solicitud</th>
                    <th>Ultima Modificacion</th>
                </tr>
            </thead>
                <tbody>
                    <tr>
                        <td>
                            {{ $solicitante->name }}
                        </td>
                        <td>
                           {{ $pedido->created_at }}
                           <br>
                           <small>{{  \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</small>
                        </td>
                        <td>
                           {{ $pedido->updated_at }}
                           <br>
                           <small>{{  \Carbon\Carbon::parse($item->updated_at)->diffForHumans() }}</small>
                        </td>
                    </tr>
                </tbody>
                
            </table>
        </div>

        
            
        <br>
        <div class="datagrid">
            <table>
            <thead>
                <tr>
                    <th>Referencia</th>
                    <th>Observacion</th>
                </tr>
            </thead>
                <tbody>
                    <tr>
                        <td>
                            {{ $pedido->referencia }}
                        </td>
                        <td>
                            {{ $pedido->observacion }}
                        </td>
                    </tr>
                </tbody>
                
            </table>
        </div>
        <br>
        
        <!-- <small>Detalles del Pedido</small> -->
         <div class="datagrid">
            <table>

                <thead>
                    <tr>
                        <th>#</th>
                        <th>nombre</th>
                        <!-- <th>descripcion</th> -->
                        <th>cantidad</th>
                        <th>precio</th>
                        <th>maquinaria</th>
                        <th>subtotal</th>
                
                    </tr>
                </thead>
                <tbody>
                <?php $total=0; ?>
                    @foreach($dp as $item)
                        <tr>
                            <td><a>{{ $loop->index + 1}}</a></td>
                            <td><a>{{ $item->nombre }}</a></td>
                            
                            <td>{{ $item->cantidad }}</td>
                            <td>{{ $item->precio }}</td>
                            <td>
                                @foreach($maquinarias as $item2)
                                    @if($item2->id == $item->maquinaria_id)
                                    {{ $item2->codigo }} - {{ $item2->modelo }}
                                    @endif
                                @endforeach
                            
                            </td>
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

        
            <small class="footer">{{ setting('pdf.footer') }} </small>
            <!-- <div class="page-break"></div>
            <small class="footer">{{ setting('pdf.footer') }} </small> -->
<!-- <small>Pagina 1</small> -->
        <!-- jQuery -->
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
        <!-- Bootstrap JavaScript -->
        <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
    </body>
</html>
