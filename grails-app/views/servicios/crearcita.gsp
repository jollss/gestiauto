<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>crear cita</title>
    </head>
    <body>
        <h1>Crear cita</h1>
          <g:form controller="Servicios" action="guardar">              
       <g:hiddenField name="estatus" value="pendiente"/><br/>
           
         <label>dia:</label>
            <g:textField name="diaServicio" placeholder="dia/mes/año"/><br/>
         <br>
         <label>hora:</label>
            <g:textField name="horaServicio"placeholder="ejem:15:30"/><br/>
         <br>   
 <label>comentarios: </label>
            <g:textField name="comentariosUsuario"/><br/>
         <br>
        marca:<select name="selectmarcas"> 
 <g:each in="${marcas}" var="marca">     
     <option value=${marca.id}> ${marca.nombreMarca} </option> 
        </g:each>
</select>
<br><br>
  modelo del auto:<select name="selectaut"> 
 <g:each in= "${automoviles}" var="aut">     
     <option value=${aut.id}> ${aut.nombreAuto}</option> 
        </g:each><br>
</select>
 <br><br>

 tipo del servicio: <select name="selecttipo">
 <g:each in="${tiposervicios}" var="tipo">     
     <option value=${tipo.id}> ${tipo.nombreServicio}</option> 
        </g:each></select><br> 
 <br>
 mecanico:<select name="selectusu"> 
     <g:each in="${usuariosrol}" var="usr">
     <option value=${usr.usuario.id}>${usr.usuario.username}</option> 
        </g:each>   
</select><br>
<g:hiddenField name="observacionesMecanico" value="hacer" /><br/>
<g:actionSubmit value="guardar"/>

        </g:form>
    </body>
</html>
