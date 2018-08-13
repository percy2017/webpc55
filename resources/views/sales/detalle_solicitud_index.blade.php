<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <!-- <th>#</th> -->
                <th>nombre</th>
                <th>descripcion</th>
                <th>cantidad</th>
                <th>precio</th>
                <th>subtotal</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <?php $total=0; ?>
           
            @foreach($materiales as $item)
                <tr>
                    <!-- <td><a>{{ $item->id }}</a></td> -->
                    <td><a>{{ $item->nombre }}</a></td>
                    <td><a>{{ $item->descripcion }}</a></td>
                    <td>
                        <input type="number" id="cant-{{ $item->id }}" class="form-control" value="{{ $item->cantidad }}" oninput="detalle_solicitud_edit('{{ $item->id }}' ,'{{ route('ds.edit', array($item->id,'cantidad')) }}')">
                    </td>
                    <td><a>{{ $item->precio }}</a></td>
                    
                    <td><a>{{ number_format(($item->cantidad * $item->precio), 2, ',', ' ') }}</a></td>
                    <td><a onclick="detalle_solicitud_delete('{{ route('ds.delete', $item->id) }}')" class="btn btn-danger"><i class="voyager-trash"></i></a></td>
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