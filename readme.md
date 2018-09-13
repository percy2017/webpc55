<h1>Proyecto Turiro - Webpc 1.1</h1>

## Introducción
    El proyecto turiro es software realizado por la empresa LoginWeb, para la empresa Turiro SA.
    para el control y seguimiento proyectos de Obras Civiles y ventas de Hormigon.

-   Dominio:    http://turiro.com
-   Correo:     soporte@turiro.com
-   repositorio https://github.com/percy2017/webpc55.git
## Instalación
-   <h2>Servidor Local</h2>Para realizar la instalacion local la applicacion necesita estos requerimientos.
    -   PHP ^7.1.3
    -   Composer
    -   Git

    Una Vez cumplidos estos requerimientos, clonar el repositorio.

    <code>git clone https://github.com/percy2017/webpc55.git</code>

    Descargar Dependencias

    <code>composer install</code>

    El el archivo .env, configurar su conexion a la base de datos Mysql y Restaurar desde el archivo <code>db_webpc.sql</code>

    <code>DB_DATABASE=homestead</code><br>
    <code>DB_USERNAME=homestead</code><br>
    <code>DB_PASSWORD=secret</code>

    Generar una Key

    <code>php artisan key:generate</code>

    Login:

    <code>admin@admin.com</code><br>
    <code>password</code><br>
-   <h2>Servidor Compartido</h2>para realizar el despliegue en servidor compoartido, debes dividir el proyecto en 2 carpetas 

    -   1.- webpc
    -   2.- public_html

    El el archivo  /app/providers/AppServiceProvider.php agregar a en la funcion <code>function register()</code> la instruccion.

    <code>
        $this->app->bind('path.public', function() {
            return base_path().'/public_html';
        });
    </code> 

    El el archivo /public_html/index.php, debes reemplazar y agregar las instrucciones.

    <code>
        require __DIR__.'/../webpc/vendor/autoload.php';
    </code>
    <br>
    <code>
        $app = require_once __DIR__.'/../webpc/bootstrap/app.php';
    </code>
    <br>
    <br>
    <code>
       $app->bind('path.public', function() {
            return __DIR__;
        });
    </code>

## Creditos
    LoginWeb - Diseño y Desarrollo de Hardware & Software.
