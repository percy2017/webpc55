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
                    <td><input type="number" class="form-control" placeholder="cantidad" value="0"></td>
                    <td><input type="number" class="form-control" placeholder="precio" value="0"></td>
                    <td><a onclick="detalle_pedido_delete('{{ route('detalle_pedido.delete',$item->id) }}')" class="btn btn-danger"><i class="voyager-trash"></i></a></td>
                </tr>
            @endforeach
       
        </tbody>
    </table>
</div>