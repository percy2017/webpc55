<form id="envios-form" action="{{ route('solicitud.envios.storage') }}" method="post">
    {{ csrf_field() }}
    <input type="text" name="solicitud_id" value="{{ $solicitud_id }}" hidden>
    <div class="form-group">
        <label for="">Detalle del Envio</label>
        <textarea name="detalle" id="" cols="" rows="6" class="form-control" required>{{ setting('admin.detalle_envio') }}</textarea>
    </div>
    <hr>
    <div align="center">
        <a onclick="envios_storage()" class="btn btn-primary">Guardar Envio</a>
        <a onclick="envios_index()" class="btn btn-warning">Cancelar</a>
    </div>
</form>

