
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>#</th>
                <th>nombre</th>
                <th>descripcion</th>
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
                    <td><a>{{ $item->descripcion }}</a></td>
                    <td>{{ $item->cantidad }}</td>
                    <td>{{ $item->precio }}</td>
                    <td>{{ $item->maquinaria }}</td>
                    <td><a>{{ number_format(($item->cantidad * $item->precio), 2, ',', ' ') }}</a></td>
                    <?php $total = $total + ($item->cantidad * $item->precio); ?>
                </tr>
            @endforeach
            <tr>
                <td></td>
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