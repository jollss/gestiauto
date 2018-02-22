<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Servicios</title>
</head>

<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
        <button class="btn btn-primary" onclick="verPendientes()">Ver Servicios Pendientes</button>
        <button  class="btn btn-primary" onclick="verTerminados()">Ver Servicios Terminados</button> 
   <h1>Servicios pendientes</h1>
<div id="verPendientes">    
   <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                    <th>Hacer</th>
                </tr>
            </thead>
 <g:each in="${servicios}" var="serv">
            <tbody>
               
                    <tr>
                        <td>${serv.observacionesMecanico} </td>
                        <td>${serv.estatus}</td>
                        <td>${serv.comentariosUsuario}</td>
                        <td>${serv.automovil.nombreAuto}</td>
                        <td>${serv.usuarios.username}</td>
                        <td>${serv.estatus}</td>
                        <td>
                            <g:link class="btn btn-success " controller="Servicios" action="hacerservicio" id="${serv.id}"><i class="fas fa-check "></i> Hacer</g:link>

                        </td>
                    </tr>
                
            </tbody>
</g:each>
        </table>
        </div>
<!-- ------------------------------------------------------------------------------------------------- -->
<div style="display:none;" id="verTerminados">    
   <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                     
                  
                </tr>
            </thead>
            <tbody>
                <g:each in="${serviciosTerminados}" var="servi">
                    <tr>
                        <td>${servi.observacionesMecanico} </td>
                        <td>${servi.estatus}</td>
                        <td>${servi.comentariosUsuario}</td>
                        <td>${servi.automovil.nombreAuto}</td>
                        <td>${servi.usuarios.username}</td>
                        <td>${servi.estatus}</td>
                      
                    </tr>
                </g:each>
            </tbody>
        </table>
        </div>



        <g:link controller="Marcas" action="guardarmarca" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar marca</g:link>

        <g:link controller="Automovil" action="guardarauto" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar automóvil</g:link>

      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>