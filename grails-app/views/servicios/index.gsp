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
        <button class="btn btn-primary" onclick="verPendientes()">Ver  Pendientes ${detalles.cuantosPendientes[0]}</button>
        <button  class="btn btn-primary" onclick="verTerminados()">Ver  Terminados ${detalleServicioTerminados.cuantosTerminados[0]}</button> 
         <button  class="btn btn-primary" onclick="Bitacora()">Ver Bitacora </button> 
         <button  class="btn btn-primary" onclick="Reagendacion()">Ver Servicios Reagendados ${detalleserviciosReagendados.cuantosReagendados[0]}</button> 
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
                        <td>${serv.usuarios[0].servicios.diaServicio}</td>
                        <td>${serv.usuarios[0].servicios.observacionesMecanico} </td>
                        <td>${serv.usuarios[0].servicios.estatus}</td>
                        <td>${serv.usuarios[0].servicios.comentariosUsuario}</td>
                        <td>${serv.usuarios[0].servicios.automovil.nombreAuto}</td>
                        <td>${serv.usuarios[0].servicios.usuarios.username}</td>
                        <td>${serv.usuarios[0].usuarios.username}</td>
                        <td >${serv.usuarios[0].servicios.estatus}</td>
                        <td>
  <g:link style="background-color: #E65100; color: white;" class="btn btn-success " controller="Servicios" action="hacerservicio" id="${serv.usuarios[0].servicios.id}"> Hacer</g:link>

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
                <g:each in="${detalleServicioTerminados}" var="servi">
                    <tr>
                         <td>${servi.usuarios[0].servicios.fechaterminacion } </td>
                        <td>${servi.usuarios[0].servicios.observacionesMecanico} </td>
                        <td>${servi.usuarios[0].servicios.estatus}</td>
                        <td>${servi.usuarios[0].servicios.comentariosUsuario}</td>
                        <td>${servi.usuarios[0].servicios.automovil.nombreAuto}</td>
                        <td>${servi.usuarios[0].usuarios.username}</td>
                        <td style="background-color: #009688; color: white;">${servi.usuarios[0].servicios.estatus}</td>
                      
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
                    <th>Nombre Mecanico</th>
                    <th>Nombre Usuario</th>
                    <th>Comentarios del usuario</th>
                    <th>Observaciones del Mecanico</th>
                    <th>Marca del Autmovil</th>
                    <th>Modelo del Autmovil</th>
                    <th>Tipo del Servicio</th>
                    <th>Dia inicial del Servicio</th>
                    <th>Hora inicial del Servicio</th>
                    <th>Fecha de Terminacion del Servicio</th>
                    <th>Estatus del Servicio</th>
                     
                  
                </tr>
            </thead>
            <tbody>
                <g:each in="${bitacora}" var="bi">
                    <tr>
                        <td> ${bi.servicios.usuarios.username}</td>
                        <td>${bi.detalleservicio.usuarios.username}</td>
                        <td>${bi.servicios.observacionesMecanico}</td>
                         <td>${bi.servicios.marca.nombreMarca}</td>
                        <td>${bi.servicios.comentariosUsuario}</td>
                        <td>${bi.servicios.automovil.nombreAuto}</td>
                      <td>${bi.servicios.tiposervicio.nombreServicio}</td>
                      <td>${bi.servicios.diaServicio}</td>
                      <td>${bi.servicios.horaServicio}</td>
                      <td>${bi.servicios.fechaterminacion}</td>
                      <td>${bi.servicios.estatus}</td>
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
                      <th>fecha</th>
                      <th>fecha de Terminacion por el otro Mecanico</th>
                    <th>Observaciones Anterior del Mecanico</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                     <th>Accion</th>
                     
                  
                </tr>
            </thead>
            <tbody>
                <g:each in="${detalleserviciosReagendados}" var="re">
                    <tr>
                                 <td>${re.usuarios[0].servicios.diaServicio } </td>
                                   <td>${re.usuarios[0].servicios.fechaterminacion } </td>
                        <td>${re.usuarios[0].servicios.observacionesMecanico} </td>
                        <td>${re.usuarios[0].servicios.estatus}</td>
                        <td>${re.usuarios[0].servicios.comentariosNuevoUsuario}</td>
                        <td>${re.usuarios[0].servicios.automovil.nombreAuto}</td>
                        <td>${re.usuarios[0].usuarios.username}</td>
                        <td style="color:darkviolet";">${re.usuarios[0].servicios.estatus}</td>
                      <td><g:link style="background-color: #E65100; color: white;" class="btn btn-success " controller="Servicios" action="hacerReagendacion" id="${re.usuarios[0].servicios.id}"> Hacer</g:link>
</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        </div>
<!-- -----------------------------------------------------fin de Reagendacion-------------------------------------------- -->


        <g:link controller="Marca" action="nuevaMarca" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar marca</g:link>

        <g:link controller="Automovil" action="nuevoAuto" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar automóvil</g:link>

      </div>
      
   </body>
</html>