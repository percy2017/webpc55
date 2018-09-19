<input type="search" id="criterio" onkeypress="return items_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
<br>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <!-- <th scope="col">#</th> -->
                <th>elegir</th>
                <th>nombre</th>
                <th>unidad</th>
                
            </tr>
        </thead>
        <tbody>
            @if(count($tipo_insumos) > 0)
                @foreach($tipo_insumos as $item)
                    <tr>
                        <!-- <td><a>{{ $item->id }}</a></td> -->
                        <td><button onclick="tipo_insumos_storage('{{ route('warehouse_insumo_storage',$item->id) }}')" class="btn btn-success"><i class="voyager-forward"></i></button></td>
                        <td><font color="{{ config('voyager.primary_color') }}">{{ $item->nombre }}</font></td>
                        <td><font color="{{ config('voyager.primary_color') }}">{{ $item->unidad }}</font></td>
                        
                    </tr>
                @endforeach
            @else
            <tr>
                <td>
                    <button type="button" onclick="items_create('{{ route('items.create', $criterio) }}')" class="btn btn-primary">Nuevo</button>
                </td>
            </tr>
            @endif
            
        </tbody>
        </table>
    </div>
    <div align="center">
        {{ $tipo_insumos->links() }}
        <br>
        <small>Total :{{ $tipo_insumos->total() }}</small>
    </div>
</div>