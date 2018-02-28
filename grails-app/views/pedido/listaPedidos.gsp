<%--
  Created by IntelliJ IDEA.
  User: nuup3
  Date: 22/02/18
  Time: 11:54 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Pedidos</title>
</head>

<body>
<g:render template="/layouts/navbar"/>
<g:render template="/layouts/header"/>
    <div class="container col-sm-9">
        <h1>Pedidos</h1>
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
            <g:each in="${refacciones}" var="refaccion">
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
            </g:each>
            </tbody>
        </table>

    <g:link controller="Pedido" event="pedirRefaccionFlow" class="btn btn-primary"><i class="fas fa-plus"></i> Nuevo pedido</g:link>
    </div>
</body>
</html>