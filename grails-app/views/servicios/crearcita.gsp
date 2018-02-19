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
            <g:hiddenField name="estatus" value="pendiente"/><br/>
            
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
                        <select name="selectmarcas">
                            <g:each in="${marcas}" var="marca">
                                <option value= ${marca.id}>${marca.nombreMarca}</option>
                            </g:each>
                        </select>
                    </div>
                </div>
                <%@ page import="gestion.Marcas" %>
                <g:select name="marca.id" from="${Marcas.list()}" optionKey="id" optionValue="nombreMarca"
                noSelection="['':'Choose Marca']"
                onchange="${remoteFunction (
                            controller: 'Servicios', 
                            action: 'findAutoByMarca', 
                            params: 'marca.id=' + this.value, 
                            update: 'autoSelection')}"
                />

                <td id="autoSelection" valign="top">
                    <select>
                        <option>Choose auto</option>
                    </select>
                </td>

                <div class="form-group row col-sm-6">
                    <label class="col-sm-12 col-form-label">Modelo del auto:</label>
                    <div class="col-sm-4">
                        <select name="selectaut">
                            <g:each in="${automoviles}" var="aut">
                                <option value= ${aut.id}>${aut.nombreAuto}</option>
                            </g:each><br>
                        </select>
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
                            <g:each in="${rol}" var="usr">
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

            <g:hiddenField name="observacionesMecanico" value="hacer"/>

            <div class="form-group row col-sm-4 col-md-offset-6">
                <div class="col-sm-8">
                     <button type="submit" class="btn btn-primary" value="guardar">
                        <i class="fas fa-save"></i> Guardar
                    </button>
                </div>
            </div>
            </div>
        </g:form>
    </div>
 <g:render template="/layouts/footer"/>
</body>

</html>
