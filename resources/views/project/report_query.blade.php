@switch($table)
    @case(1)
        <div align="center">
            <h3>    </h3>
        </div>
      
        @switch($table_option)
            @case(1)
                
                @break

            @case(2)
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
                @break

            @default
                Default case...
        @endswitch
        @break

    @case(2)
        Second case...
        @break

    @default
        Default case...
@endswitch