

<form action="{{ route('pedidos.proveedor.storage') }}" method="post">
{{ csrf_field() }}
    <div class="form-group">
        <label for="">Nombre</label>
        <input type="text" name="nombre" id="" class="form-control" requered>
    </div>
    <div class="form-group">
        <label for="">Correo</label>
        <input type="text" name="corre" id="" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="">Telefono</label>
        <input type="text" name="telefono" id="" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="">Celular</label>
        <input type="text" name="celular" id="" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="">Direccion</label>
        
        <textarea name="direccion" id="" cols="" rows="3" class="form-control" required></textarea>
    </div>
    <hr>
    <div align="center">
        <button type="submit"  class="btn btn-primary"> Guardar</button>
    </div>
</form>
