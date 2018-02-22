<%--
  Created by IntelliJ IDEA.
  User: nuup3
  Date: 21/02/18
  Time: 02:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:render template="/layouts/navbar"/>
<g:render template="/layouts/header"/>
    <div class="container col-sm-9">
        <h1>Refacción por siniestro - Estado 2</h1>
        <g:form action='pedirRefaccion'>
            <input placeholder="Nombre" type="text" name="nombreRefaccion"/>
            <input placeholder="Precio" type="text" name="precioRefaccion"/>
            <input placeholder="Modelo" type="text" name="modeloRefaccion"/>
            <g:submitButton name="submitDetalle" value="Detalle"/>
            <g:submitButton name="submitRegresar" value="Regresar"/>
        </g:form>
    </div>
</body>
</html>