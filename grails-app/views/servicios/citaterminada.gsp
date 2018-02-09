
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>citas terminadas</title>
    </head>
    <body>
        <h1>Cita terminada</h1>
        <center><h1>Servicios pendientes</h1>
        <g:each in="${servicios}" var="serv">
             <table>
  <tr>
    <th >observaciones</th>
   
<th>modelo</th>
    <th>marca del auto</th>
    <th>nombre del usuario</th>
    <th>estatus</th>
    <th>acciones</th>
    
  </tr>
  <tr>
    <td>${serv.observacionesMecanico} </td>
  <td>${serv.marca.nombreMarca}</td>
    
    <td>${serv.automovil.nombreAuto}</td>
     <td>${serv.usuario.nombreUsuario}</td>

        <td>${serv.estatus}</td>
     <td><g:link controller="Servicios" action="delete" id="${serv.id}">eliminar</g:link>
  </tr>
 

</table>
      
        </g:each>
  </center>
  <!--<g:link controller="Marcas" action="guardarmarca">agregar marca</g:link><br>
   <g:link >agregar automovil</g:link>-->
    </body>
</html>
