<%@ page contentType="text/html;charset=UTF-8" %>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Marcas</title>
   </head>
   <body>
      <g:render template="/layouts/navbar"/>
      <g:render template="/layouts/header"/>
      <div class="container col-sm-9">
         <h1>Modificar marca</h1>

        <g:form Controller="Marca" action="guardarModificacion">
            <g:hiddenField name="id" value="${marca.id}"/><br/>

            <div class="form-group row">
                <label class="col-sm-12 col-form-label">Nombre</label>
                <br/>
                <div class="col-sm-4">
                    <g:textField name="nombre" class="form-control" placeholder="${marca.nombreMarca}"/><br/>
                </div>
                <button type="submit" class="col-sm-2 btn btn-primary">
                    <i class="fas fa-save"></i> Guardar
                </button>

                <g:link class="col-sm-2 btn btn-danger" url="[action: 'index', controller: 'Marca']"><i class="fas fa-save"></i> Cancelar</g:link>

            </div>

        </g:form>

      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>