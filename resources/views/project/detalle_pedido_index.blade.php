<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>id</th>
                <th>nombre</th>
                <th>descripcion</th>
                <th>cantidad</th>
                <th>precio</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            @foreach($dp as $item)
                <tr>
                    <td>{{ $item->id }}</td>
                    <td>{{ $item->nombre }}</td>
                    <td>{{ $item->descripcion }}</td>
                    <td><input type="number" id="cant-{{ $item->id }}" class="form-control" placeholder="cantidad" value="{{ $item->cantidad }}" oninput="detalle_pedido_edit('{{ $item->id }}', 'cantidad', '{{ route('detalle_pedido.edit', array($item->id, 'cantidad', 'valor')) }}')"></td>
                    <td><input type="number" id="precio-{{ $item->id }}" class="form-control" placeholder="precio" value="{{ $item->precio }}" oninput="detalle_pedido_edit('{{ $item->id }}', 'precio', '{{ route('detalle_pedido.edit', array($item->id, 'precio', 'valor')) }}')"></td>
                    <td><a onclick="detalle_pedido_delete('{{ route('detalle_pedido.delete',$item->id) }}')" class="btn btn-danger"><i class="voyager-trash"></i></a></td>
                </tr>
            @endforeach
       
        </tbody>
    </table>
</div>