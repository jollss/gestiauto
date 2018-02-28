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
    <h1>Resumen petición - Estado Final</h1>
    <table class="table table-bordered table-striped col-sm-4">
        <thead class="thead-inverse">
        <tr>
            <th>Folio</th>
            <th>Fecha</th>
            <th>Nombre</th>
            <th>Modelo</th>
            <th>Precio</th>
            <th>Tipo</th>
        </tr>
        </thead>
            <tbody>
            <tr>
                <td>${refaccion.pedido.folioPedido}</td>
                <td>${refaccion.pedido.create_at}</td>
                <td>${refaccion.nombreRefaccion}</td>
                <td>${refaccion.modeloRefaccion}</td>
                <td>${refaccion.precioRefaccion}</td>
                <td>${refaccion.pedido.tipoPedido}</td>
            </tr>
            </tbody>
    </table>
    <g:form action='pedirRefaccion'>
        <div class="col-sm-8">
            <g:submitButton name="submitGuardarPedido" value="Guardar" class="btn btn-primary"/>
        </div>
    </g:form>
</div>
</body>
</html>