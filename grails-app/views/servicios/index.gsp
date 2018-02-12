<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Servicios</title>
</head>

<<<<<<< HEAD
<<<<<<< refs/remotes/origin/master
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servicios</title>
    </head>
    <body>
    <center><h1>Servicios pendientes</h1>
        <g:each in="${servicios}" var="serv">
<<<<<<< refs/remotes/origin/master
             
  <tr>
    <th >observaciones</th>
    <th>estatus</th>
    <th>comentarios del usuario</th>
    <th>marca del auto</th>
    <th>nombre del usuario</th>
    <th>estatus</th>
    <th>acciones</th>
  </tr>
  
    <td>${serv.observacionesMecanico} </td>
    <td>${serv.estatus}</td>
    <td>${serv.comentariosUsuario}</td>
    <td>${serv.automovil.nombreAuto}</td>
     <td>${serv.usuario.username}</td>

        <td>${serv.estatus}</td>
     <td><g:link controller="Servicios" action="hacerservicio" id="${serv.id}">hacer</g:link>
  
 


      
=======
            <table>
=======
<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
        <h1>Servicios pendientes</h1>

        <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
>>>>>>> Diseño / Permisos
                <tr>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${servicios}" var="serv">
                    <tr>
                        <td>${serv.observacionesMecanico} </td>
                        <td>${serv.estatus}</td>
                        <td>${serv.comentariosUsuario}</td>
                        <td>${serv.automovil.nombreAuto}</td>
                        <td>${serv.usuario.nombreUsuario}</td>
                        <td>${serv.estatus}</td>
                        <td>
                            <g:link class="btn btn-success " controller="Servicios" action="hacerservicio" id="${serv.id}"><i class="fas fa-check "></i> Hacer</g:link>

                        </td>
                    </tr>
<<<<<<< refs/remotes/origin/master
            </table>
>>>>>>> Carga dentro de container.
        </g:each>
    </center>
    <g:link controller="Marcas" action="guardarmarca">agregar marca</g:link><br>
    <g:link controller="Automovil" action="guardarauto">agregar automovil</g:link>
    </body>
</html>
=======
=======
<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
        <h1>Servicios pendientes</h1>

        <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${servicios}" var="serv">
                    <tr>
                        <td>${serv.observacionesMecanico} </td>
                        <td>${serv.estatus}</td>
                        <td>${serv.comentariosUsuario}</td>
                        <td>${serv.automovil.nombreAuto}</td>
                        <td>${serv.usuario.nombreUsuario}</td>
                        <td>${serv.estatus}</td>
                        <td>
                            <g:link class="btn btn-success " controller="Servicios" action="hacerservicio" id="${serv.id}"><i class="fas fa-check "></i> Hacer</g:link>

                        </td>
                    </tr>
>>>>>>> angel-dev
                </g:each>
            </tbody>
        </table>
        
        <g:link controller="Marcas" action="guardarmarca" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar marca</g:link>

        <g:link controller="Automovil" action="guardarauto" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar automóvil</g:link>

      </div>
      <g:render template="/layouts/footer"/>
   </body>
<<<<<<< HEAD
</html>
>>>>>>> Diseño / Permisos
=======
</html>
>>>>>>> angel-dev
