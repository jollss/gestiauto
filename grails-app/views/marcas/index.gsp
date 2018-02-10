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
                            <g:link class="btn btn-warning " controller="Marcas" action="modificarmarca" id="${marca.id}"><i class="fas fa-edit"></i> Modificar</g:link>

<<<<<<< refs/remotes/origin/master
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcas</title>
    </head>
    <body>
        <h1>marcas</h1>
  
        <g:each in="${marcas}" var="marca">
             <table>
  <tr>
    <th>marcas</th>
    <th>acciones</th>
    
  </tr>
  <tr>
    <td>${marca.nombreMarca}</td>
    <td><g:link controller="Marcas" action="modificarmarca" id="${marca.id}">modificar</g:link>
    /<g:link controller="Marcas" action="eliminar" id="${marca.id}">eliminar</g:link></td>
    
 
 
  </tr>
 

</table>
      
        </g:each>
    
        
        <g:link controller="Marcas" action="guardarmarca">agregar marca</g:link></td><br>
    <g:link url="[action:'index',controller:'Servicios']">regresar a realizar servicio</g:link>
    <g:link controller='logout'>Logout</g:link>
    </body>
</html>
=======
                            <g:link class="btn btn-danger" controller="Marcas" action="eliminar" id="${marca.id}"><i class="fas fa-ban "></i> Eliminar</g:link>

                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>

        <g:link controller="Marcas" action="guardarmarca" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar marca</g:link>
      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>
>>>>>>> Diseño / Permisos
