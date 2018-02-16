<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Servicios</title>
</head>

<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
        <h1>Citas terminadas</h1>
        <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                    <th>Observaciones</th>
                    <th>Modelo</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${servicios}" var="serv">
                    <tr>
                        <td>
                            <g:if test="${serv.observacionesMecanico == ''}">
                                Ninguna
                            </g:if>
                            <g:if test="${serv.observacionesMecanico != ''}">
                                ${serv.observacionesMecanico}
                            </g:if>
                        </td>
                        <td>${serv.marca.nombreMarca}</td>
                        <td>${serv.automovil.nombreAuto}</td>
                        <td>${serv.usuarios.username}</td>
                        <td>${serv.estatus}</td>
                        <td>
                            <g:link controller="Servicios" action="delete" id="${serv.id}">eliminar</g:link>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>