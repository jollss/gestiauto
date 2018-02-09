
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
                <tr>
                    <th >observaciones</th>
                    <th>estatus</th>
                    <th>comentarios del usuario</th>
                    <th>marca del auto</th>
                    <th>nombre del usuario</th>
                    <th>estatus</th>
                    <th>acciones</th>
                </tr>
                <tr>
                    <td>${serv.observacionesMecanico} </td>
                    <td>${serv.estatus}</td>
                    <td>${serv.comentariosUsuario}</td>
                    <td>${serv.automovil.nombreAuto}</td>
                    <td>${serv.usuario.nombreUsuario}</td>

                    <td>${serv.estatus}</td>
                    <td><g:link controller="Servicios" action="hacerservicio" id="${serv.id}">hacer</g:link>
                    </tr>
            </table>
>>>>>>> Carga dentro de container.
        </g:each>
    </center>
    <g:link controller="Marcas" action="guardarmarca">agregar marca</g:link><br>
    <g:link controller="Automovil" action="guardarauto">agregar automovil</g:link>
    </body>
</html>
