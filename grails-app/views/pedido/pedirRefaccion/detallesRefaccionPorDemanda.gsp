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
                    <tr>
                        <td>1</td>
                        <td><input placeholder="Nombre" type="text" name="nombreRefaccion"/></td>
                        <th><input placeholder="Precio" type="text" name="precioRefaccion"/></th>
                        <th><input placeholder="Modelo" type="text" name="modeloRefaccion"/></th>
                        <th>
                            <button type="button" class="btn btn-warning btnEditarCampo"><i class="fas fa-edit"></i></button>
                            <button type="button" class="btn btn-primary btnGuardarCampo"><i class="fas fa-save"></i></button>
                            <button type="button" class="btn btn-danger btnEliminarCampo"><i class="fas fa-ban"></i></button>
                        </th>
                    </tr>
                </tbody>
            </table>
            <button type="button" id="addRow" class="btn btn-default"><i class="fas fa-plus"></i></button>
            <g:submitButton name="submitDetalle" value="Detalle"/>
            <g:submitButton name="submitRegresar" value="Regresar"/>
        </g:form>
    </div>
</body>
</html>