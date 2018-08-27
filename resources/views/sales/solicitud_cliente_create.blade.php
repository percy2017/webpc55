<form action="{{ route('solicitud.cliente.storage') }}" method="post">
{{ csrf_field() }}
    <div align="center">
        <h3>Nuevo Cliente</h3>
    </div>
    <div class="form-group">
        <label for="">Nombre Completo</label>
        <input type="text" name="nombre_completo" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="">Carnet o Nit</label>
        <input type="text" name="nit" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="">Telefono Movil</label>
        <input type="text" name="telefono_movil" class="form-control" required>
    </div>
    <hr>
    <div align="center">
        <button type="submit" class="btn btn-primary">Guardar</button>
    </div>
</form>