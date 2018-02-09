<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>automoviles</title>
    </head>
    <body>
        <h1>Consultar automoviles</h1>
           <g:each in="${automoviles}" var="auto">
             <table>
  <tr>
    <th>marcas</th>
    <th>acciones</th>
    
  </tr>
  <tr>
    <td>${auto.nombreAuto}</td>
    <td><g:link controller="Automovil" action="modificarauto" id="${auto.id}">modificar</g:link>
    /<g:link controller="Automovil" action="eliminar" id="${auto.id}">eliminar</g:link></td>
    

 
  </tr>
 

</table>
      
        </g:each>
            <g:link controller="Automovil" action="guardarauto">agregar automovil</g:link></td><br>
    <g:link url="[action:'index',controller:'Servicios']">regresar a realizar servicio</g:link>
    </body>
</html>
