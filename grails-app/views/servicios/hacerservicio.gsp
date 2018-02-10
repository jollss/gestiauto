<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Realizar servicio</title>
</head>

<body>
    <center>
        <h1>Hacer servicio</h1>
    </center>
    <g:form controller="Servicios" action="save">

        <g:hiddenField name="id" value="${servicios.id}" /> <br> Fecha:

        <g:textField name="diaServicio" value="${servicios.diaServicio}" disabled="diaServicio" /> <br><br> Hora:
        <g:textField name="horaServicio" value="${servicios.horaServicio}" disabled="horaServicio" /> <br><br> Observaciones del mecánico
        <g:textField name="observaciones" placeholder="${servicios.observacionesMecanico}" /> <br><br> Marca
        <g:textField name="marca" value="${servicios.marca.nombreMarca}" disabled="marca" /> <br><br> Automóvil
        <g:textField name="automovil" value="${servicios.automovil.nombreAuto}" disabled="automovil" /> <br><br> Tipo de servicio
        <g:textField name="tiposervicio" value="${servicios.tiposervicio.nombreServicio}" disabled="tiposervicio" />

        <br><br>
        Estado:
        <select name="estatus"> 
          <option value=${servicios.estatus}> ${servicios.estatus} </option> 
          <option value=terminado> terminado </option> 
        </select>
        <br><br>
        <g:actionSubmit value="save" />

    </g:form>
    <g:link action="index">regresar</g:link><br>
</body>

</html>