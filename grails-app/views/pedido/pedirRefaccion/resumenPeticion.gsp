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
    
    <div class="card">
      <div class="card-header">
        <h2>Pedido</h2>
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
                    <td>${pedidoGral.folioPedido}</td>
                    <td>${pedidoGral.create_at}</td>
                    <td>${pedidoGral.tipoPedido}</td>
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
                <th>Folio</th>
                <th>Fecha</th>
                <th>Tipo</th>
            </tr>
            </thead>
                <g:each in="${refacciones}" var="refaccion">
                    <tbody>
                    <tr>
                        <td>${refaccion.nombreRefaccion}</td>
                        <td>${refaccion.modeloRefaccion}</td>
                        <td>${refaccion.precioRefaccion}</td>

                        <td>${refaccion.pedido.folioPedido}</td>
                        <td>${refaccion.pedido.create_at}</td>
                        <td>${refaccion.pedido.tipoPedido}</td>
                    </tr>
                    </tbody>
                </g:each>
        </table>
        </div>
      </div>
    </div>

    <g:form action='pedirRefaccion'>
        <div class="col-sm-8">
            <g:submitButton name="submitGuardarPedido" value="Guardar" class="btn btn-primary"/>
        </div>
    </g:form>
</div>
</body>
</html>