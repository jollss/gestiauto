<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>citas terminadas</title>
</head>

<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
        
              <h1>Citas</h1>
        
            <table class="table table-bordered table-striped col-sm-4">
                 <thead class="thead-inverse">
                    <tr>
                        <th>Fecha de Termiacion</th>
                        <th>observaciones</th>
                        <th>Servicio Realizado</th>
                        <th>modelo</th>
                        <th>marca del auto</th>
                        <th>nombre del Mecanico</th>
                         <th>nombre del usuario</th>
                        
                        <th>estatus</th>
                          <th>Reagendar</th>
                          <th>Acciones sobre la Cita</th>
                    </tr>
                </thead>
                <tbody>
                  
                    <g:each in="${detalleservicio}" var="deta">
                        <tr>
                            <td>${deta.servicios.fechaterminacion}</td>
                            <td>
                                <g:if test="${deta.servicios.observacionesMecanico == ''}">
                                    Ninguna
                                </g:if>
                                <g:if test="${deta.servicios.observacionesMecanico != ''}">
                                    ${deta.servicios.observacionesMecanico}
                                </g:if>
                            </td>
                             <td>${deta.servicios.tiposervicio.nombreServicio}</td>
                            <td>${deta.servicios.marca.nombreMarca}</td>
                            <td>${deta.servicios.automovil.nombreAuto}</td>
                            <td>${deta.servicios.usuarios.username}</td>
                            <td>${deta.usuarios.username}</td>
                            <g:if test="${deta.servicios.estatus == 'terminado'}" >
                                <td style="color:red";>${deta.servicios.estatus}</td>
                            </g:if>
                            <g:if test="${deta.servicios.estatus == 'pendiente'}" >
                                <td style="color:darkcyan"; >${deta.servicios.estatus}</td>
                            </g:if>
                             <g:if test="${deta.servicios.estatus == 'reagendar'}" >
                                <td>${deta.servicios.estatus}</td>
                            </g:if>
                             <td>
                                 <g:if test="${deta.servicios.estatus =='terminado'}" >
<g:link controller="Servicios" action="reagendarCita" style="background-color: #E65100; color: white;" class="btn btn-success " id="${deta.servicios.id}" > Hacer</g:link>  </g:if></td> 
    <td><g:if test="${deta.servicios.estatus =='terminado'}" >
    <g:link controller="Servicios" action="eliminarCita" style="background-color: #E65100; color: white;" class="btn btn-success " id="${deta.servicios.id}"> Eliminar</g:link>
   </g:if>
                             </td>
                       
                        </tr>
                               
                    </g:each>
                </tbody>
            </table>
    </div>
     <g:render template="/layouts/footer"/>
</center>
</body>
</html>