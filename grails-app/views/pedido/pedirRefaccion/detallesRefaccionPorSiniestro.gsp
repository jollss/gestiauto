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
            <div class="form-group row col-sm-6">
                <label class="col-sm-12 col-form-label">Nombre:</label>
                <div class="col-sm-12">
                    <input class="form-control" placeholder="Nombre" type="text" name="nombreRefaccion"/>
                </div>
            </div>
            <div class="form-group row col-sm-6">
                <label class="col-sm-12 col-form-label">Precio:</label>
                <div class="col-sm-12">
                    <input class="form-control" placeholder="Precio" type="text" name="precioRefaccion"/>
                </div>
            </div>
            <div class="form-group row col-sm-6">
                <label class="col-sm-12 col-form-label">Modelo:</label>
                <div class="col-sm-12">
                    <input class="form-control" placeholder="Modelo" type="text" name="modeloRefaccion"/>
                </div>
            </div>
            <input placeholder="Modelo" type="text" name="tempIdRefaccion" value="1" hidden/>

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