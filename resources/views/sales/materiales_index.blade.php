<input type="search" id="criterio" onkeypress="return items_search(event)"  class="form-control" placeholder="escribe el criterio.." value="{{ $criterio }}">
<br>
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <!-- <th>#</th> -->
                <th>Elegir</th>
                <th>nombre</th>
                <th>descripcion</th>
                <th>Clasificacion</th>
                <th>Precio</th>
                
            </tr>
        </thead>
        <tbody>
            @foreach($materiales as $item)
                <tr>
                    <!-- <td>{{ $item->id }}</td> -->
                    <td>
                        <button onclick="detalle_solicitud_storage('{{ route('ds.storage', $item->id) }}')" class="btn btn-primary"><i class="voyager-forward"></i></button>
                    </td>
                    <td>{{ $item->nombre }}</td>
                    <td>{{ $item->descripcion }}</td>
                    
                    <td>{{ $item->clasificacion }}</td>
                    <td>{{ $item->precio }}</td>
                    
                </tr>
            @endforeach       
        </tbody>
    </table>
    <div align="center">{{ $materiales->links() }}</div>
</div>
