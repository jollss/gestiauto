<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Marcas</title>
</head>

<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <div class="container col-sm-9">
 
        <h1>Crear cita</h1>
        <g:form controller="Servicios" action="guardar">
            
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

            <div class="form-group row col-sm-12">
                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Marca:</label>
                    <div class="col-sm-4">
                        <%@ page import="gestion.Marca" %>
                        <g:select name="selectmarcas" from="${marcas}" optionKey="id" optionValue="nombreMarca" noSelection="['':'Choose Marca']" onchange="${remoteFunction(controller: 'Servicios', action: 'findAutoByMarca', params: '\'marca.id=\' + this.value', update: 'autoSelection')}" id="selectMarcas"/>
                    </div>
                </div>        

                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Modelo del auto:</label>
                    <div class="col-sm-4">
                        <div id="autoSelection">
                            <g:render template="/servicios/autoSelection" />
                        </div>
                    </div>
                </div>

                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Tipo del servicio: </label>
                    <div class="col-sm-4">
                         <select name="selecttipo">
                            <g:each in="${tiposervicios}" var="tipo">
                                <option value= ${tipo.id}>${tipo.nombreServicio}</option>
                            </g:each>
                        </select>
                    </div>
                  
                </div>

                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Mecánico: </label>
                    <div class="col-sm-4">
                        <select name="selectusu">
                            <g:each in="${usuario}" var="usr">
                                <option value= ${usr.secAppUser.id}> ${usr.secAppUser.username}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group row col-sm-12">
                <label class="col-sm-12 col-form-label">Comentarios:</label>
                <div class="col-sm-10">
                    <g:textArea class="form-control" name="comentariosUsuario" placeholder="Comentarios" id="datepicker"/>
                </div>
            </div>

            <g:hiddenField name="observacionesMecanico" value="En proceso"/>

            <div class="form-group row col-sm-4 col-md-offset-6">
                <div class="col-sm-8">
                     <button type="submit" class="btn btn-primary" value="guardar">
                        <i class="fas fa-save"></i> Guardar
                    </button>
                </div>
            </div>
          
        </g:form>
    </div>
 <g:render template="/layouts/footer"/>
</body>

</html>
