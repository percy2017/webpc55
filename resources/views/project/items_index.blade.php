<input type="search"  id="criterio" onkeypress="return items_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
<br>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th>nombre</th>
                <th>descripcion</th>
                <th>categoria</th>
                <th>unidad</th>
                <th>accion</th>
            </tr>
        </thead>
        <tbody>
            @if(count($items) > 0)
                @foreach($items as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->nombre }}</td>
                        <td>{{ $item->descripcion }}</td>
                        <td>{{ $item->categoria }}</td>
                        <td>{{ $item->unidad }}</td>
                        <td><button onclick="detalle_pedido_storage('{{ route('detalle_pedido.storage',$item->id) }}')" class="btn btn-primary"><i class="voyager-pen"></i></button></td>
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
        {{ $items->links() }}
    </div>
</div>