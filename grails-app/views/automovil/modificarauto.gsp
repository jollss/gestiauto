<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample title</title>
    </head>
    <body>
       
        <h1>Automovil a modificar</h1>
        <g:form Controller="Marcas" action="guardar">
            <g:hiddenField name="id" value="${auto.id}"/><br/>
             
            <label>nombre automovil: </label>
            <g:textField name="nombre" placeholder="${auto.nombreAuto}"/><br/>
         
            <g:actionSubmit value="guardar"/>
        </g:form>
    </body>
</html>
