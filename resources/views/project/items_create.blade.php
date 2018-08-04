<form id="form-items-create" action="{{ route('items.storage') }}" method="POST">
    {{ csrf_field() }}
    <div class="form-group col-xs-6">
        <label for="">Categorias</label>
        <select name="categoria_id" class="form-control selector" id="">
            @foreach($categorias as $item)
                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group col-xs-6">
        <label for="">Unidades</label>
        <select name="unidad_id" class="form-control selector" id="">
            @foreach($unidades as $item)
                <option value="{{ $item->id }}">{{ $item->nombre }}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group col-xs-12">
        <label for="">Nombre</label>
        <input type="text" name="nombre" class="form-control" value="{{ $criterio }}">
    </div>
    <div class="form-group col-xs-12">
        <label for="">Descripcion</label>
        <textarea name="descripcion" id="" rows="2" class="form-control">{{ setting('admin.items_descripcion_default') }}</textarea>
    </div>
    <div class="col-xs-12">
        <a onclick="items_storage('{{ route('items.storage') }}')" class="btn btn-success">Enviar</a>
    </div>
</form>

<script>
     $('.selector').select2();
</script>