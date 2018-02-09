<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Realizar servicio</title>
    </head>
    <body>
    <center><h1>Hacer servicio</h1></center>
         <g:form controller="Servicios" action="save"> 
             
            <g:hiddenField name="id" value="${servicios.id}"/> <br>
    
    fecha:<g:textField name="diaServicio" value="${servicios.diaServicio}"  disabled="diaServicio"/> <br><br>
    
    hora: <g:textField name="horaServicio" value="${servicios.horaServicio}" disabled="horaServicio"/> <br><br>
    
     Observaciones del mecanico  <g:textField name="observaciones" placeholder="${servicios.observacionesMecanico}"/> <br><br>
     
          marca  <g:textField name="marca" value="${servicios.marca.nombreMarca}" disabled="marca"/> <br><br>
          
          automovil  <g:textField name="automovil" value="${servicios.automovil.nombreAuto}" disabled="automovil"/> <br><br>
          
          tipo  de servicio  <g:textField name="tiposervicio" value="${servicios.tiposervicio.nombreServicio}" disabled="tiposervicio"/><br><br>  

        <!--status <g:textField name="estatus" placeholder="${servicios.estatus} o terminado"/>   <br><br> -->
        
        estatus:<select name="estatus"> 
     
     <option value=${servicios.estatus}> ${servicios.estatus} </option> 
       <option value=terminado> terminado </option> 
</select>
       <br><br>
        <g:actionSubmit value="save"/>
       
    </g:form>  
        <g:link  action="index">regresar</g:link><br>
    </body> 
</html>