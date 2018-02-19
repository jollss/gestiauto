<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>citas terminadas</title>
</head>

<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
        <h1>Citas</h1>
        
            <table class="table table-bordered table-striped col-sm-4">
                 <thead class="thead-inverse">
                    <tr>
                        <th>observaciones</th>
                        <th>modelo</th>
                        <th>marca del auto</th>
                        <th>nombre del usuario</th>
                        <th>estatus</th>
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
                            <g:if test="${serv.estatus == 'terminado'}" >
                                <td style="background-color: #009688; color: white;">${serv.estatus}</td>
                            </g:if>
                            <g:if test="${serv.estatus == 'pendiente'}" >
                                <td style="background-color: #E65100; color: white;">${serv.estatus}</td>
                            </g:if>
                        </tr>
                    </g:each>
                </tbody>
            </table>
    </div>
     <g:render template="/layouts/footer"/>
</center>
</body>
</html>