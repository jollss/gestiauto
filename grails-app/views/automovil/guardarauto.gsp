<%@ page contentType="text/html;charset=UTF-8" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Automóviles</title>
   </head>
   <body>
      <g:render template="/layouts/navbar"/>
      <g:render template="/layouts/header"/>
      <div class="container col-sm-9">
        <h1>Agregar automóvil</h1>
         <g:form controller="Automovil" action="guardarAutoMarca">
            <div class="form-group row">
                <label class="col-sm-12 col-form-label">Marca:</label>
                <div class="col-sm-4">
                    <select name="id_marca">
                        <g:each in="${marcas}" var="marca">
                            <option value= ${marca.id}>${marca.nombreMarca}</option>
                        </g:each>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-12 col-form-label">Nombre del automóvil:</label>
                <br/>
                <div class="col-sm-4">
                    <g:textField name="nombreAuto" class="form-control"/><br/>
                </div>
                <button type="submit" class="col-sm-2 btn btn-primary">
                    <i class="fas fa-save"></i> Guardar
                </button>
            </div>
        </g:form>

        <g:link  action="index" class="btn btn-success"><i class="fas fa-search "></i> Consultar automóviles</g:link><br>
      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>