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
        <h1>Automovil</h1>
         <g:form controller="Automovil" action="guardarauto">
            <label>nombre del automovil: </label>
            <g:textField name="nombreAuto"/><br/>
         
            <g:actionSubmit value="guardarauto" align="center" style="border:0px;background:transparent"/>
        </g:form>
             <g:link  action="index">consultar automoviles</g:link><br>
        <g:link url="[action:'index',controller:'Servicios']">regresar hacer servicio</g:link>
    </body>
</html>
