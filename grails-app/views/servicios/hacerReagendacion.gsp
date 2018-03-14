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
             <h1>Reagendar Cita Mecanico</h1>
           
              <g:form controller="Servicios" action="guardarReagendacionTerminada">
                 <g:hiddenField name="id" value="" />
                <div class="col-sm-7">
                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Fecha y Hora de la Nueva Reagendacion del Servicio:</label>
                    <div class="col-sm-4">
                        <g:textField name="tiempo" placeholder="${consultarserviciodetallereagendacion[0].servicios.diaServicio}-${consultarserviciodetallereagendacion[0].servicios.horaServicio}" disabled="tiempo" />
                    </div>
                </div>
                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Fecha y Hora de Termiacion del Servicio Antes de Reagendarse:</label>
                    <div class="col-sm-12">
                        <g:textField name="fechaterminacion" placeholder="${consultarserviciodetallereagendacion[0].servicios.fechaterminacion}" disabled="fechaterminacion" />
                    </div>
                </div>
                </div>
            
              <div class="col-sm-7">
                    <div class="form-group row col-sm-6">
                        <label class="col-sm-12 col-form-label">Marca de Modelo Seleccionada</label>
                        <div class="col-sm-12">
                            <g:textField name="marca" placeholder="" disabled="marca" />
                             <input type="hidden" name="marcas" value="">
                        </div>
                    </div>
                        <div class="form-group row col-sm-6">
                        <label class="col-sm-12 col-form-label">Modelo de Auto Seleccionado </label>
                        <div class="col-sm-4">
 <g:textField name="automovil" placeholder="" disabled="automovil" />
 <input type="hidden" name="automovils" value="">
                        </div>

                    </div> 
               <div class="form-group row col-sm-6">
                        <label class="col-sm-12 col-form-label">Mecanico que esta o Realizo el Servicio Antes de La Reagendacion</label>
                        <div class="col-sm-12">
                            <g:textField name="usuario" placeholder="" disabled="usuario" />
                        </div>
                    </div>
                     <div class="form-group row col-sm-6">
                        <label class="col-sm-12 col-form-label">Tipo de Servicio Seleccionado</label>
                        <div class="col-sm-12">
                            <g:textField  name="tiposervicio" placeholder="" disabled="tiposervicio" />
                           <input type="hidden" name="tiposervicios" value="">
                        </div>
                    </div>
              </div>
               <div class="form-group row col-sm-12">
                    <label class="col-sm-12 col-form-label">Comentarios Anterirores del Servicio Terminado</label>
                    <div class="col-sm-10">
                        <g:textArea class="form-control" name="comentariosUsuario" placeholder="" disabled="comentariosUsuario"/>
                    </div>
                </div>



       
                 <div class="form-group row col-sm-12">
                    <label class="col-sm-12 col-form-label">Comentarios Nuevos de La Reagendacion</label>
                    <div class="col-sm-10">
                        <g:textArea class="form-control" name="comentariosNuevoUsuario" placeholder="EJEMPLO:Se checo nuevamente,todo perfecto" id="datepicker" />
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

