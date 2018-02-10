<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample title</title>
    </head>
    <body>
        <g:each in="${servicios}" var="serv">
            <table>
                <tr>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios</th>
                    <th>Marca</th>
                    <th>Accion</th>
                    <th>Estatus</th>
                    <th>Usuario</th>
                </tr>
                <tr>
                    <td>${serv.observacionesMecanico} </td>
                    <td>${serv.estatus}</td>
                    <td>${serv.comentariosUsuario}</td>
                    <td>${serv.automovil.nombreAuto}</td>
                    <td>${serv.usuario.nombreUsuario}</td>
                    usuario
                    <td>${serv.estatus}</td>
                    <td>Hacer</td>
                </tr>
            </table>
        </g:each>
    </body>
</html>