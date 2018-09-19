
<div class="table-responsive">
    <table class="table table-hover">
        <thead>
            <tr>
                <!-- <th scope="col">#</th> -->
                <!-- <th>elegir</th> -->
                <th>#</th>
                <th>nombre</th>
                <th>cantidad</th>
                <th>unidad</th>
                <th>Accion</th>
                
            </tr>
        </thead>
        <tbody>
           
                @foreach($aux as $item)
                    <tr>
                        <!-- <td><a>{{ $item->id }}</a></td> -->
                       <td>{{ $item->id }}</td>
                        <td><font color="{{ config('voyager.primary_color') }}">{{ $item->nombre }}</font></td>
                        <td><input id="cant-{{ $item->id }}" type="number" min="0" step="0.01" value="{{ $item->cantidad }}"> 
                            <a href="#" onclick="warehouse_tipo_insumos_update('{{ route('warehouse_tipo_insumos_update', array($item->id, ':cant')) }}','{{ $item->id }}')" class="btn btn-primary btn-xs"><i class="voyager-plus"></i> </a>
                        </td>
                        <td><font color="{{ config('voyager.primary_color') }}">{{ $item->unidad }}</font></td>
                        <td>
                            <a href="#" class="btn btn-danger btn-xs"><i class="voyager-trash"></i> </a>
                        </td>
                    </tr>
                @endforeach
        
            
        </tbody>
        </table>
    </div>
 
</div>