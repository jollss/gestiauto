<%--
  Created by IntelliJ IDEA.
  User: nuup3
  Date: 12/02/18
  Time: 01:27 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Tipo servicio</title>
</head>

<body>
<g:render template="/layouts/navbar" />
<g:render template="/layouts/header" />
<div class="container col-sm-9">
    <h1>Tipo servicio</h1>

    <table class="table table-bordered table-striped col-sm-4">
        <thead class="thead-inverse">
        <tr>
            <th>Servicio</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${tipoServicios}" var="tipoServicio">
            <tr>
                <td>${tipoServicio.nombreServicio}</td>
                <td>
                    <g:link class="btn btn-warning " controller="Tiposervicio" action="modificarTipoServicio" id="${tipoServicio.id}"><i class="fas fa-edit"></i> Modificar</g:link>

                    <g:link class="btn btn-danger" controller="Tiposervicio" action="eliminaServicio" id="${tipoServicio.id}"><i class="fas fa-ban "></i> Eliminar</g:link>

                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <g:link controller="Tiposervicio" action="nuevoTipoServicio" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar servicio</g:link>
</div>
<g:render template="/layouts/footer"/>
</body>
</html>