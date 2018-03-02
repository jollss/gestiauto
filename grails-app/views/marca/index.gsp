<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marcas</title>
</head>

<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
        <h1>Marcas</h1>

        <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                    <th>Marcas</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${marcas}" var="marca">
                    <tr>
                        <td>${marca.nombreMarca}</td>
                        <td>
                            <g:link class="btn btn-warning " controller="Marca" action="modificarMarca" id="${marca.id}"><i class="fas fa-edit"></i> Modificar</g:link>

                            <g:link class="btn btn-danger" controller="Marca" action="eliminarMarca" id="${marca.id}"><i class="fas fa-ban "></i> Eliminar</g:link>

                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>

        <g:link controller="Marca" action="nuevaMarca" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar marca</g:link>
      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>