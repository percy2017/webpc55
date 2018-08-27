<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>#</th>
                <th>Creado</th>
                <th>detalle</th>
                
            </tr>
        </thead>
        <tbody>
            @foreach($envios as $item)
                <tr>
                    <td><a>{{ $loop->index + 1 }}</a></td>
                    <td><a>{{ $item->created_at }}</a><br><small>{{  \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</small></td>
                    <td><a>{{ $item->detalle }}</a></td>
                </tr>
            @endforeach      
        </tbody>
    </table>                                        
</div>
<hr>
<div align="center">
    <button id="envio_create"  onclick="envios_create()" class="btn btn-info">Nuevo Envio</button>
</div>