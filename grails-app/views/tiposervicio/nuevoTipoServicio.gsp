<%--
  Created by IntelliJ IDEA.
  User: nuup3
  Date: 12/02/18
  Time: 01:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Tipo servicio</title>
</head>

<body>
<g:render template="/layouts/navbar"/>
<g:render template="/layouts/header"/>
<div class="container col-sm-9">
    <h1>Agregar tipo servicio</h1>
    <g:form controller="Tiposervicio" action="crearServicio">
        <div class="form-group row">
            <label class="col-sm-12 col-form-label">Nombre del servicio:</label>
            <br/>
            <div class="col-sm-4">
                <g:textField name="nombreServicio" class="form-control"/><br/>
            </div>
            <button type="submit" class="col-sm-2 btn btn-primary">
                <i class="fas fa-save"></i> Guardar
            </button>
        </div>
    </g:form>

    <g:link  action="index" class="btn btn-success"><i class="fas fa-search "></i> Consultar tipo servicios</g:link><br>
</div>
<g:render template="/layouts/footer"/>
</body>
</html>