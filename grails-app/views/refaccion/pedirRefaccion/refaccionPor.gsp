<%--
  Created by IntelliJ IDEA.
  User: nuup3
  Date: 21/02/18
  Time: 02:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <h1>Refacción por - Estado 1</h1>
    <g:form action='pedirRefaccion'>
        <select name="tipoPedido">
            <option value="PorDemanda">Por demanda</option>
            <option value="PorSiniestro">Por siniestro</option>
        </select>
        <g:submitButton name="submitPorDemanda" value="Demanda"/>
        <g:submitButton name="submitPorSiniestro" value="Siniestro"/>
    </g:form>
</body>
</html>