@switch($table)
    @case(1)
        @switch($table_option)
            @case(1)
                <input type="search"  id="criterio" onkeypress="return pedidos_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
                <br>
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    @foreach($proyectos as $item)
                        <div class="panel panel-primary">
                        
                                <div class="panel-heading" role="tab" id="{{ $item->id }}h">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#{{ $item->id }}" aria-expanded="false" aria-controls="collapseOne">
                                            Proyecto: {{ $item->nombre }}, Pres.: {{ number_format($item->presupuesto, 2, ',', ' ') }}
                                        </a>
                                    </h4>
                                </div>
                                <div id="{{ $item->id }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="{{ $item->id }}h">
                                    <div class="panel-body">
                                        <?php 
                                            $pedidos = DB::table('pedidos')                                                   
                                                            ->join('tipos', 'tipos.id', 'pedidos.tipo_id')
                                                            ->join('proveedores', 'proveedores.id', 'pedidos.proveedor_id')
                                                            ->join('estados', 'estados.id', 'pedidos.estado_id')
                                                            ->join('users', 'users.id', 'pedidos.user_id')
                                                            ->select('pedidos.*', 'estados.nombre as estado', 'tipos.nombre as tipo', 'proveedores.nombre as proveedor', 'users.name')
                                                            ->where('pedidos.proyecto_id', $item->id)
                                                            ->orderBy('pedidos.created_at','desc')
                                                            ->get(); 
                                        ?>
                                        
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>created_at</th>
                                                        <th>estado</th>
                                                        <th>tipo</th>
                                                        <th>proveedor</th>
                                                        <th>usuario</th>
                                                        <th>total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <?php $subtotal = 0; ?>
                                                    @foreach($pedidos as $item2)
                                                        <tr>
                                                            <td><a>{{ $loop->index + 1 }}</a></td>
                                                            <td><a>{{ $item2->created_at }}</a><br><small>{{  \Carbon\Carbon::parse($item2->created_at)->diffForHumans() }}</small></td>
                                                            <td><a>{{ $item2->estado }}</a></td>
                                                            <td><a>{{ $item2->tipo }}</a></td>                                                    
                                                            <td><a>{{ $item2->proveedor }}</a></td>      
                                                            <td><a>{{ $item2->name }}</a></td>                                                                                             
                                                            <td><a>{{ number_format($item2->total, 2, ',', ' ') }}</a></td>
                                                            <?php $subtotal = $subtotal +  $item2->total ?>
                                                        </tr>
                                                    @endforeach      
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td>Total :</td>
                                                        <td><a>{{ number_format($subtotal, 2, ',', ' ') }}</a></td>
                                                        
                                                    </tr>
                                                </tbody>

                                            </table>
                                            <div align="center">
                                                <?php $t = ($subtotal * 100) /  $item->presupuesto; ?>
                                                <h4>Avance del {{ $t }}%</h4>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>                                       
                        </div>
                    @endforeach             
                </div>
                <div align="center">
                    {{ $proyectos->links() }}
                </div>            
                @break

            @case(2)
                <input type="search"  id="criterio" onkeypress="return pedidos_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
                <br>
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    @foreach($proyectos as $item)
                        <div class="panel panel-info">
                        
                                <div class="panel-heading" role="tab" id="{{ $item->id }}h">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#{{ $item->id }}" aria-expanded="false" aria-controls="collapseOne">
                                            Proyecto: {{ $item->nombre }}, Pres.: {{ number_format($item->presupuesto, 2, ',', ' ') }}
                                        </a>
                                    </h4>
                                </div>
                                <div id="{{ $item->id }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="{{ $item->id }}h">
                                    <div class="panel-body">
                                        <?php 
                                            $ingresos = DB::table('ingresos')                                                   
                                                            ->join('empresas', 'empresas.id', 'ingresos.empresa_id')
                                                            ->select('ingresos.*', 'empresas.nombre as empresa')
                                                            ->where('ingresos.proyecto_id', $item->id)
                                                            ->orderBy('ingresos.created_at','desc')
                                                            ->get(); 
                                        ?>
                                        
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>created_at</th>
                                                        <th>empresa</th>
                                                        <th>detalle</th>
                                                        <th>monto</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <?php $subtotal = 0; ?>
                                                    @foreach($ingresos as $item2)
                                                        <tr>
                                                            <td><a>{{ $loop->index + 1 }}</a></td>
                                                            <td><a>{{ $item2->created_at }}</a><br><small>{{  \Carbon\Carbon::parse($item2->created_at)->diffForHumans() }}</small></td>
                                                            <td><a>{{ $item2->empresa }}</a></td>
                                                            <td><a>{{ $item2->detalle }}</a></td>                                                                                                                                              
                                                            <td><a>{{ number_format($item2->monto, 2, ',', ' ') }}</a></td>
                                                            <?php $subtotal = $subtotal +  $item2->monto ?>
                                                        </tr>
                                                    @endforeach      
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td>Total :</td>
                                                        <td><a>{{ number_format($subtotal, 2, ',', ' ') }}</a></td>
                                                        
                                                    </tr>
                                                </tbody>

                                            </table>
                                            <div align="center">
                                                <?php $t = ($subtotal * 100) /  $item->presupuesto; ?>
                                                <h4>Avance del {{ $t }}%</h4>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>                                       
                        </div>
                    @endforeach             
                </div>
                <div align="center">
                    {{ $proyectos->links() }}
                </div> 
                @break

            @default
                Default case...
        @endswitch
        @break

    @case(2)
    @switch($table_option)
            @case(1)
                <input type="search"  id="criterio" onkeypress="return pedidos_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
                <br>
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    @foreach($pedidos as $item)
                        <div class="panel panel-primary">
                        
                                <div class="panel-heading" role="tab" id="{{ $item->id }}h">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#{{ $item->id }}" aria-expanded="false" aria-controls="collapseOne">
                                            Pedido: {{ $item->id }}, {{ $item->referencia }}
                                        </a>
                                    </h4>
                                </div>
                                <div id="{{ $item->id }}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="{{ $item->id }}h">
                                    <div class="panel-body">
                                        <?php 
                                            $detalle_pedidos = DB::table('detalle_pedidos')                                                   
                                                            ->join('items', 'items.id', 'detalle_pedidos.item_id')
                                                            ->select('detalle_pedidos.*', 'items.nombre as item')
                                                            ->where('detalle_pedidos.pedido_id', $item->id)
                                                            ->orderBy('detalle_pedidos.created_at','desc')
                                                            ->get(); 
                                        ?>
                                        
                                        <div class="table-responsive">
                                            <table id="dataTable" class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>created_at</th>
                                                        <th>item</th>
                                                        <th>cantidad</th>
                                                        <th>precio</th>
                                                        <th>subtotal</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <?php $subtotal = 0; ?>
                                                    @foreach($detalle_pedidos as $item2)
                                                        <tr>
                                                            <td><a>{{ $loop->index + 1 }}</a></td>
                                                            <td><a>{{ $item2->created_at }}</a><br><small>{{  \Carbon\Carbon::parse($item2->created_at)->diffForHumans() }}</small></td>
                                                            <td><a>{{ $item2->item }}</a></td>
                                                                                                              
                                                            <td><a>{{ $item2->cantidad }}</a></td>      
                                                            <td><a>{{ $item2->precio }}</a></td>                                                                                             
                                                            <td><a>{{ number_format($item2->subtotal, 2, ',', ' ') }}</a></td>
                                                            <?php $subtotal = $subtotal +  $item2->subtotal ?>
                                                        </tr>
                                                    @endforeach      
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        
                                                        <td>Total :</td>
                                                        <td><a>{{ number_format($subtotal, 2, ',', ' ') }}</a></td>
                                                        
                                                    </tr>
                                                </tbody>

                                            </table>
                                            <div align="center">
                                                
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>                                       
                        </div>
                    @endforeach             
                </div>
                <div align="center">
                    {{ $pedidos->links() }}
                </div>            
                @break

            @case(2)
                <input type="search"  id="criterio" onkeypress="return pedidos_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
                <br>

                @break

            @default
                Default case...
        @endswitch
        @break

    @default
        Default case...
@endswitch