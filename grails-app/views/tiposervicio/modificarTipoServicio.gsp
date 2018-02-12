<%--
  Created by IntelliJ IDEA.
  User: nuup3
  Date: 12/02/18
  Time: 01:58 PM
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
    <h1>Modificar tipo servicio</h1>

    <g:form Controller="Tiposervicio" action="actualizaServicio">
        <g:hiddenField name="id" value="${tipoServicio.id}"/><br/>

        <div class="form-group row">
            <label class="col-sm-12 col-form-label">Nombre</label>
            <br/>
            <div class="col-sm-4">
                <g:textField name="nombreServicio" class="form-control" placeholder="${tipoServicio.nombreServicio}"/><br/>
            </div>
            <button type="submit" class="col-sm-2 btn btn-primary">
                <i class="fas fa-save"></i> Guardar
            </button>

            <g:link class="col-sm-2 btn btn-danger" url="[action: 'index', controller: 'Tiposervicio']"><i class="fas fa-save"></i> Cancelar</g:link>

        </div>

    </g:form>

</div>
<g:render template="/layouts/footer"/>
</body>
</html>