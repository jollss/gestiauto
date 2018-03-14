<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Realizar servicio</title>
</head>

<body>
     <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
    <center>
        <h1>Hacer servicio</h1>
    </center>

    <g:form controller="Servicios" action="save">
        <input type="hidden" name="folio" value="${consultardetadelservicio[0].servicios.folio}">
        <g:hiddenField name="usuario" value="${consultardetadelservicio.usuarios[0].id}" /> 
 <g:hiddenField name="id" value="${consultardetadelservicio[0].servicios.id}" /> <br> Fecha:
 <g:textField name="diaServicio" value="${consultardetadelservicio[0].servicios.diaServicio}" readonly="diaServicio" /> <br><br> Hora:
 <g:textField name="horaServicio" value="${consultardetadelservicio[0].servicios.horaServicio}" readonly="horaServicio" /> <br><br> Observaciones del mecánico
 <g:textField name="observaciones" placeholder="${consultardetadelservicio[0].servicios.observacionesMecanico}"/> <br><br> Marca
  <g:textField name="marca" value="${consultardetadelservicio[0].servicios.marca.nombreMarca}" readonly="marca" /> <br><br> Automóvil
  <g:hiddenField name="marcas" value="${consultardetadelservicio[0].servicios.marca.id}" /> 
  <g:textField name="automovil" value="${consultardetadelservicio[0].servicios.automovil.nombreAuto}" readonly="automovil"/> <br><br> Tipo de servicio
  <g:hiddenField name="automovils" value="${consultardetadelservicio[0].servicios.automovil.id}" /> 
   <g:textField name="tiposervicio" value="${consultardetadelservicio[0].servicios.tiposervicio.nombreServicio}" readonly="tiposervicio" />
   <g:hiddenField name="tiposervicios" value="${consultardetadelservicio[0].servicios.tiposervicio.id}" /> 
 
        <br><br>
        Estado:
        <select name="estatus"> 
          <option value=${consultardetadelservicio[0].servicios.estatus}> ${consultardetadelservicio[0].servicios.estatus} </option> 
          <option value=terminado> terminado </option> 
        </select>
        <br><br>
        <input  type="submit" value="guardar">
     </g:form>
       
   
    
    </div>
    <g:render template="/layouts/footer"/>
</body>

</html>