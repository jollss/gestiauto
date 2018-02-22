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
    <h1>Refacción por demanda - Estado 2</h1>
    <g:form action='pedirRefaccion'>
        <input placeholder="Nombre" type="text" name="nombreRefaccion"/>
        <input placeholder="Precio" type="text" name="precioRefaccion"/>
        <g:submitButton name="submitDetalle" value="Detalle"/>
        <g:submitButton name="submitRegresar" value="Regresar"/>
    </g:form>
</body>
</html>