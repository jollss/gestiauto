<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marcas</title>
</head>

<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">

    <h1>Crear cita</h1>
    <g:form controller="Servicios" action="guardar">
        <g:hiddenField name="estatus" value="pendiente"/><br/>


        <label>Día:</label>
        <g:textField name="diaServicio" placeholder="dia/mes/año"/><br/>
        <br>
        <label>Hora:</label>
        <g:textField name="horaServicio" placeholder="ejem:15:30"/><br/>
        <br>
        <label>Comentarios:</label>
        <g:textField name="comentariosUsuario"/><br/>
        <br>
        Marca:
        <select name="selectmarcas">
            <g:each in="${marcas}" var="marca">
                <option value= ${marca.id}>${marca.nombreMarca}</option>
            </g:each>
        </select>

        <br><br>
        Modelo del auto:
        <select name="selectaut">
            <g:each in="${automoviles}" var="aut">
                <option value= ${aut.id}>${aut.nombreAuto}</option>
            </g:each><br>
        </select>
        <br><br>

        Tipo del servicio: 
        <select name="selecttipo">
            <g:each in="${tiposervicios}" var="tipo">
                <option value= ${tipo.id}>${tipo.nombreServicio}</option>
            </g:each>
        </select>
        <br><br>
        Mecánico:
        <select name="selectusu">
            <g:each in="${rol}" var="usr">
                <option value= ${usr.secAppUser.id}> ${usr.secAppUser.username}</option>
            </g:each>
        </select>
        <br>
        <g:hiddenField name="observacionesMecanico" value="hacer"/><br/>
        <g:actionSubmit value="guardar"/>

    </g:form></div><br><br><br><br><br><br><br><br>         
 <g:render template="/layouts/footer"/>
</body>

</html>
