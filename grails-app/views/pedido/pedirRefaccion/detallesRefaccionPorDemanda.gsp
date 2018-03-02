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
<div class="container col-sm-10">
    <h1>Refacción por demanda - Estado 2</h1>
    <g:form action='pedirRefaccion'>
        <div class="rowTabla col-md-12 col-sm-12">
            <table class="table table-bordered table-striped col-sm-4" id="tblRefacciones">
                <thead class="thead-inverse tab-header-background">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Modelo</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${refacciones}" var="refaccion">
                    <tr>
                        <td>${refaccion.pedido.folioPedido}</td>
                        <td>${refaccion.nombreRefaccion}</td>
                        <td>${refaccion.modeloRefaccion}</td>
                        <td>${refaccion.precioRefaccion}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>

            <div style="float: right; color: #fff;" >
                <button id="btnAgregarCampo" type="button" class="btn btn-warning btn-sm" data-toggle="tooltip"
                        data-placement="top" title="Agregar">
                    <i class="fas fa-plus"></i> Agregar
                </button>
                <button id="btnGuardarCampo" type="button" class="btn btn-primary btn-sm" data-toggle="tooltip"
                        data-placement="top" title="Guardar">
                    <i class="fas fa-save"></i> Guardar
                </button>
            </div>
        </div>

        <br>

        <div class="col-md-12 col-sm-12">
            <div class="botonesFlujo" style="float: right; padding: 2em 0em 0em 0em;">
                <g:submitButton class="btn btn-info" name="submitRegresar" value="Regresar"/>
                <g:submitButton class="btn btn-success" name="submitDetalle" value="Siguiente"/>
            </div>
        </div>

    </g:form>
</div>
</body>
</html>