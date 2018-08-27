<form id="form-items-create" action="{{ route('items.storage') }}" method="POST">
    {{ csrf_field() }}
    <div class="form-group">
        <label for="">Categorias</label>
        <select name="categoria_id" class="form-control" id="">
            @foreach($categorias as $item)
                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="">Unidades</label>
        <select name="unidad_id" class="form-control" id="">
            @foreach($unidades as $item)
                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group">
        <label for="">Nombre</label>
        <input type="text" name="nombre" class="form-control" value="{{ $criterio }}">
    </div>
    <div class="form-group">
        <label for="">Descripcion</label>
        <textarea name="descripcion" id="" rows="2" class="form-control">{{ setting('admin.items_descripcion_default') }}</textarea>
    </div>
    <div align="center">
        <a onclick="items_storage('{{ route('items.storage') }}')" class="btn btn-primary">Guardar</a>
    </div>
</form>