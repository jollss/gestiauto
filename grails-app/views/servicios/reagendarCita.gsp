<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <title>Reagendacion</title>
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
<script>
$(function () {
$.datepicker.setDefaults($.datepicker.regional["es"]);
$("#datepicker").datepicker({
firstDay: 1
});
});
</script>
    </head>

    <body>
        <g:render template="/layouts/navbar" />
        <g:render template="/layouts/header" />
        <div class="container col-sm-9">

            <h1>Reagendar cita</h1>
            <g:form controller="Servicios" action="guardarReagendacion">
                <input type="hidden" name="folio" value="${consultarreagendacion.folio}">
                 <g:hiddenField name="id" value="${consultarreagendacion.id}" />
                <div class="col-sm-7">
                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Fecha y Hora de Inicio del Servicio:</label>
                    <div class="col-sm-4">
                        <g:textField name="tiempo" placeholder="${consultarreagendacion.diaServicio} ${consultarreagendacion.horaServicio}" disabled="tiempo" />
                    </div>
                </div>
                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Fecha y Hora de Termiacion del Servicio:</label>
                    <div class="col-sm-12">
                        <g:textField name="fechaterminacion" placeholder="${consultarreagendacion.fechaterminacion}" disabled="fechaterminacion" />
                    </div>
                </div>
                </div>
            
              <div class="col-sm-7">
                    <div class="form-group row col-sm-6">
                        <label class="col-sm-12 col-form-label">Marca de Modelo Seleccionada</label>
                        <div class="col-sm-12">
                            <g:textField name="marca" placeholder="${consultarreagendacion.marca.nombreMarca}" disabled="marca" />
                             <input type="hidden" name="marcas" value="${consultarreagendacion.marca.id}">
                        </div>
                    </div>
                        <div class="form-group row col-sm-6">
                        <label class="col-sm-12 col-form-label">Modelo de Auto Seleccionado </label>
                        <div class="col-sm-4">
 <g:textField name="automovil" placeholder="${consultarreagendacion.automovil.nombreAuto}" disabled="automovil" />
 <input type="hidden" name="automovils" value="${consultarreagendacion.automovil.id}">
                        </div>

                    </div> 
               <div class="form-group row col-sm-6">
                        <label class="col-sm-12 col-form-label">Mecanico que Realizo Servicio</label>
                        <div class="col-sm-12">
                            <g:textField name="usuario" placeholder="${consultarreagendacion.usuarios.username}" disabled="usuario" />
                        </div>
                    </div>
                     <div class="form-group row col-sm-6">
                        <label class="col-sm-12 col-form-label">Tipo de Servicio Seleccionado</label>
                        <div class="col-sm-12">
                            <g:textField  name="tiposervicio" placeholder="${consultarreagendacion.tiposervicio.nombreServicio}" disabled="tiposervicio" />
                           <input type="hidden" name="tiposervicios" value="${consultarreagendacion.tiposervicio.id}">
                        </div>
                    </div>
              </div>
               <div class="form-group row col-sm-12">
                    <label class="col-sm-12 col-form-label">Comentarios Anterirores del Servicio Terminado</label>
                    <div class="col-sm-10">
                        <g:textArea class="form-control" name="comentariosUsuario" placeholder="${consultarreagendacion.observacionesMecanico}" disabled="comentariosUsuario"/>
                    </div>
                </div>
 <div class="col-sm-7">
          

      
      
            <div class="form-group row col-sm-6">
                <label class="col-sm-12 col-form-label">Fecha:</label>
                <div class="col-sm-12">
                    <g:textField class="form-control" name="diaServicio" placeholder="dia/mes/año" id="datepicker"/>
                </div>
            </div>

            <div class="form-group row col-sm-6">
                <label class="col-sm-12 col-form-label">Hora:</label>
                <div class="col-sm-8">
                    <input type="time" class="form-control" name="horaServicio" placeholder="ejem:15:30"></div>
                </div>
            </div>



       <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Puedes Elejir un Nuevo Mecanico: </label>
                    <div class="col-sm-4">
                           
                
                        
                        <select name="selectusu">
                            <option selected value="${consultarreagendacion.usuarios.id}">${consultarreagendacion.usuarios.username}</option> 
                            <g:each in="${usuario}" var="usr">
                     <g:if test="${usr.secAppUser.username != consultarreagendacion.usuarios.username}">
 </option> <option value= ${usr.secAppUser.id} > ${usr.secAppUser.username}</option>
                                </g:if> 
                            </g:each>
                                    
                        </select>
                        
                    </div>
                </div>
                 <div class="form-group row col-sm-12">
                    <label class="col-sm-12 col-form-label">Comentarios Nuevos</label>
                    <div class="col-sm-10">
                        <g:textArea class="form-control" name="comentariosNuevoUsuario" placeholder="Redacta el Porque de la Reagendacion??" id="datepicker" />
                    </div>
                </div>
             
 
       
  <div class="form-group row col-sm-4 col-md-offset-6">
                    <div class="col-sm-8">
                        <button type="submit" class="btn btn-primary" value="guardar">
                            <i class="fas fa-save"></i> Guardar
                        </button>
                    </div>
                </div>
            </g:form>
        </div>
        
    </body>

</html>
