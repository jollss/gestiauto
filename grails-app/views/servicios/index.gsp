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
        <button class="btn btn-primary" onclick="verPendientes()">Ver  Pendientes</button>
        <button  class="btn btn-primary" onclick="verTerminados()">Ver  Terminados</button> 
         <button  class="btn btn-primary" onclick="Bitacora()">Ver Bitacora</button> 
         <button  class="btn btn-primary" onclick="Reagendacion()">Ver Servicios Reagendados</button> 
 <!-- -----------------------------------------------------inicio de verPendientes-------------------------------------------- -->
   
<div id="verPendientes">    
       <h1>Servicios Pendientes</h1>
   <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                     <th>Dia Asiganado</th>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del Mecanico</th>
                    <th>Nombre del usuario</th>
                       
                    <th>Estatus del Servicio</th>
                    <th>Hacer</th>
                </tr>
            </thead>
 <g:each in="${detalles}" var="serv">
            <tbody>
               
                    <tr>
                        <td>${serv[0].servicios.diaServicio}</td>
                        <td>${serv[0].servicios.observacionesMecanico} </td>
                        <td>${serv[0].servicios.estatus}</td>
                        <td>${serv[0].servicios.comentariosUsuario}</td>
                        <td>${serv[0].servicios.automovil.nombreAuto}</td>
                        <td>${serv[0].servicios.usuarios.username}</td>
                        <td>${serv[0].usuarios.username}</td>
                        <td >${serv[0].servicios.estatus}</td>
                        <td>
  <g:link style="background-color: #E65100; color: white;" class="btn btn-success " controller="Servicios" action="hacerservicio" id="${serv[0].servicios.id}"> Hacer</g:link>

                        </td>
                    </tr>
                
            </tbody>
</g:each>
        </table>
        </div>
         <!-- -----------------------------------------------------fin de verPendientes-------------------------------------------- -->
<!-- -----------------------------------------------------Inicio de verTerminados-------------------------------------------- -->
<div style="display:none;" id="verTerminados">    
       <h1>Servicios Terminados</h1>
   <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                    <th>Dia Terminado</th>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                     
                  
                </tr>
            </thead>
            <tbody>
                <g:each in="${detalleServicioTerminados[0]}" var="servi">
                    <tr>
                         <td>${servi.servicios.fechaterminacion } </td>
                        <td>${servi.servicios.observacionesMecanico} </td>
                        <td>${servi.servicios.estatus}</td>
                        <td>${servi.servicios.comentariosUsuario}</td>
                        <td>${servi.servicios.automovil.nombreAuto}</td>
                        <td>${servi.usuarios.username}</td>
                        <td style="background-color: #009688; color: white;">${servi.servicios.estatus}</td>
                      
                    </tr>
                </g:each>
            </tbody>
        </table>
        </div>
        <!-- -----------------------------------------------------fin de verTerminados-------------------------------------------- -->
<!-- -----------------------------------------------------Inicio de Bitacora-------------------------------------------- -->
    <div style="display:none;" id="Bitacora">    
       <h1>Ver Bitacora</h1>
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
                <g:each in="" var="">
                    <tr>
                        <td> </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="background-color: #009688; color: white;"></td>
                      
                    </tr>
                </g:each>
            </tbody>
        </table>
        </div>
<!-- -----------------------------------------------------fin de bitacora-------------------------------------------- -->
    <!-- -----------------------------------------------------Inicio de Reagendacion-------------------------------------------- -->
    <div style="display:none;" id="Reagendacion">    
       <h1>Ver Servicios Reagendados</h1>
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
                <g:each in="" var="">
                    <tr>
                        <td> </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td style="background-color: #009688; color: white;"></td>
                      
                    </tr>
                </g:each>
            </tbody>
        </table>
        </div>
<!-- -----------------------------------------------------fin de Reagendacion-------------------------------------------- -->


        <g:link controller="Marca" action="nuevaMarca" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar marca</g:link>

        <g:link controller="Automovil" action="nuevoAuto" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar automóvil</g:link>

      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>