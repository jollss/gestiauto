<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Automóviles</title>
   </head>
   <body>
      <g:render template="/layouts/navbar"/>
      <g:render template="/layouts/header"/>
      <div class="container col-sm-9">
        <h1>Agregar marca</h1>
         <g:form controller="Marcas" action="save">
            <div class="form-group row">
                <label class="col-sm-12 col-form-label">Nombre de la marca:</label>
                <br/>
                <div class="col-sm-4">
                    <g:textField name="nombreMarca" class="form-control"/><br/>
                </div>
                <button type="submit" class="col-sm-2 btn btn-primary">
                    <i class="fas fa-save"></i> Guardar
                </button>
            </div>
        </g:form>

        <g:link  action="index" class="btn btn-success"><i class="fas fa-search "></i> Consultar marcas</g:link><br>
      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>