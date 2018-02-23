<%--
  Created by IntelliJ IDEA.
  User: nuup3
  Date: 21/02/18
  Time: 02:18 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Solicitar refacción</title>
</head>

<body>
<g:render template="/layouts/navbar"/>
<g:render template="/layouts/header"/>
<div class="container col-sm-9">
    <h1>Pedir refacción - Estado 1</h1>

    <h2>Tipo de pedido</h2>
    <g:form action='pedirRefaccion'>
        <div class="container">
        <div class="form-group row col-sm-6">
            <label class="col-sm-12 col-form-label">Folio:</label>

            <div class="col-sm-8">
                <input placeholder="Folio" type="text" name="folio"/>
            </div>
        </div>
        </div>
        <div class="form-group row col-sm-4">
            <div class="col-sm-4 col-md-offset-2">
                <g:submitButton name="submitPorDemanda" value="Demanda" class="btn btn-primary"><i
                        class="fas fa-save"></i> Demanda</g:submitButton>
            </div>
            <div class="col-sm-4">
                <g:submitButton name="submitPorSiniestro" value="Siniestro" class="btn btn-primary"><i
                        class="fas fa-save"></i> Siniestro</g:submitButton>
            </div>
        </div>

        <g:link controller="Pedido" action="listaPedidos" class="btn btn-primary"><i class="fas fa-list"></i> Pedidos</g:link>

    </g:form>
</div>
</body>
</html>