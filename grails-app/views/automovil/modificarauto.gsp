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
         <h1>Modificar automóvil</h1>
        <g:form Controller="Marcas" action="guardar">
            <g:hiddenField name="id" value="${auto.id}"/><br/>

            <div class="form-group row">
                <label class="col-sm-12 col-form-label">Nombre</label>
                <br/>
                <div class="col-sm-4">
                    <g:textField name="nombre" class="form-control" placeholder="${auto.nombreAuto}"/><br/>
                </div>
                <button type="submit" class="col-sm-2 btn btn-primary">
                    <i class="fas fa-save"></i> Guardar
                </button>
            </div>

        </g:form>
      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>