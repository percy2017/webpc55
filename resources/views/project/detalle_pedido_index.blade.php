
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>#</th>
                <th>nombre</th>
                <!-- <th>descripcion</th> -->
                <th>cantidad</th>
                <th>precio</th>
                <th>maquinaria</th>
                <th>subtotal</th>
                <th>eliminar</th>
            </tr>
        </thead>
        <tbody>
        <?php $total=0; ?>
            @foreach($dp as $item)
                <tr>
                    <td><a>{{ $loop->index + 1}}</a></td>
                    <td><a>{{ $item->nombre }}</a></td>
                    <!-- <td><a>{{ $item->descripcion }}</a></td> -->
                    <td><input type="number" id="cant-{{ $item->aux_id }}" class="form-control" min="0" step="1" placeholder="cantidad" value="{{ $item->cantidad }}" oninput="detalle_pedido_edit('{{ $item->aux_id }}', 'cantidad', '{{ route('detalle_pedido.edit', array($item->aux_id, 'cantidad', 'valor')) }}')"></td>
                    <td><input type="number" id="precio-{{ $item->aux_id }}" class="form-control" min="0" step="0.01" placeholder="precio" value="{{ $item->precio }}" oninput="detalle_pedido_edit('{{ $item->aux_id }}', 'precio', '{{ route('detalle_pedido.edit', array($item->aux_id, 'precio', 'valor')) }}')"></td>
                    <td>
                        <select name="maquinaria_id" id="maquinaria_id-{{ $item->aux_id }}" class="form-control" onchange="detalle_pedido_edit('{{ $item->aux_id }}', 'maquinaria_id', '{{ route('detalle_pedido.edit', array($item->aux_id, 'maquinaria_id', 'valor')) }}')">
                            @foreach($maquinarias as $item2)
                                <option value="{{ $item2->id }}" @if($item2->id == $item->maquinaria_id) selected @endif>{{ $item2->codigo }} - {{ $item2->modelo }}</option>
                            @endforeach
                        </select>
                    </td>
                    <td><a>{{ number_format(($item->cantidad * $item->precio), 2, ',', ' ') }}</a></td>
                    <td><a onclick="detalle_pedido_delete('{{ route('detalle_pedido.delete',$item->aux_id) }}')" class="btn btn-danger"><i class="voyager-trash"></i></a></td>
                    <?php $total = $total + ($item->cantidad * $item->precio); ?>
                </tr>
            @endforeach
            <tr>
                <td></td>
                <td></td>
                <td></td>
                
                <td><a>Total:</a></td>
                <td><a>{{ number_format($total, 2, ',', ' ') }}</a></td>
            </tr>
        </tbody>
    </table>
</div>