<%--
  Created by IntelliJ IDEA.
  User: nuup3
  Date: 27/02/18
  Time: 10:05 AM
--%>
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
    <div class="card">
        <div class="card-header">
            <h2>Pedido ${pedido.folioPedido}</h2>
        </div>
        <div class="card-block">
            <h4 class="card-title">Detalles</h4>
            <div class="card-text">
                <table class="table table-bordered table-striped col-sm-4">
                    <thead class="thead-inverse">
                    <tr>
                        <th>Folio</th>
                        <th>Fecha</th>
                        <th>Tipo</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${pedido.folioPedido}</td>
                        <td>${pedido.create_at}</td>
                        <td>${pedido.tipoPedido}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h2>Refacciones</h2>
        </div>
        <div class="card-block">
            <h4 class="card-title">Detalles</h4>
            <div class="card-text">
                <table class="table table-bordered table-striped col-sm-4">
                    <thead class="thead-inverse">
                    <tr>
                        <th>Nombre</th>
                        <th>Modelo</th>
                        <th>Precio</th>
                    </tr>
                    </thead>
                        <tbody>
                        <g:each in="${refacciones}" var="refaccion">
                            <tr>
                                <td>${refaccion.nombreRefaccion}</td>
                                <td>${refaccion.modeloRefaccion}</td>
                                <td>${refaccion.precioRefaccion}</td>
                            </tr>
                        </g:each>
                        <tr><th></th>
                            <th>Total</th>
                            <th>${precioTotal}</th>
                        </tr>
                        </tbody>

                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>