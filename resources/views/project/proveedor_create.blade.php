

<form action="{{ route('pedidos.proveedor.storage') }}" method="post">
{{ csrf_field() }}
    <center>
        <h3><i class="voyager-shop"></i> Nuevo Proveedor</h3>
    </center>
    <!-- <hr> -->
    <div class="form-group">
        <!-- <label for="">Nombre</label> -->
        <input type="text" name="nombre" id="" class="form-control" placeholder="nombre" required>
    </div>
    <div class="form-group">
        <!-- <label for="">Correo</label> -->
        <input type="text" name="corre" id="" class="form-control" placeholder="correo" required>
    </div>
    <div class="form-group">
        <!-- <label for="">Telefono</label> -->
        <input type="text" name="telefono" id="" class="form-control" placeholder="telefono" required>
    </div>
    <div class="form-group">
        <!-- <label for="">Celular</label> -->
        <input type="text" name="celular" id="" class="form-control" placeholder="celular" required>
    </div>
    <div class="form-group">
        <!-- <label for="">Direccion</label> -->
        
        <textarea name="direccion" id="" cols="" rows="3" class="form-control" placeholder="direccion" required></textarea>
    </div>
    <!-- <hr> -->
    <div align="center">
        <button type="submit"  class="btn btn-primary"> <i class="voyager-data"></i> Guardar</button>
    </div>
</form>
