<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN</title>
        
    </head>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />
    <center><h3>Agregar Usuarios</h3></center>
    <form>
        <div class="form-group row col-sm-6">
            <label class="col-sm-12 col-form-label">Nombre Usuario:</label>
            <div  class="col-sm-12">
                <input type="text"  id="username" name="username" placeholder="Nombre Usuario" autocomplete="off"  autofocus>
            </div>
          </div>
            
         <div id="respuestausuarioexi"></div>
<div>
        <div class="form-group row col-sm-6">
            <label class="col-sm-12 col-form-label">Password:</label>
            <div class="col-sm-12">

                <input type="password" id="password" name="password" placeholder="**********" >
            </div>
        </div>
        <div class="form-group row col-sm-6">
            <label class="col-sm-12 col-form-label">ROL: </label>                             
            <div class="col-sm-4">
                <select id="selectusuario" name="selectusuario">
                    <g:each in="${rol}" var="ro">
                        <g:if test="${ro.authority != 'ROLE_ADMIN'}">
                            <option value=${ro.id}>${ro.authority} </option>
                        </g:if>
                    </g:each>
                </select>
            </div>
        </div><br>
        <div class="form-group row col-sm-6">
            <label class="col-sm-12 col-form-label">Activo: </label>
            <div class="col-sm-4">
                <select id="select" name="select">
                    <option value="TRUE"> Si</option>
                    <option value="FALSE">No </option>
                </select>
            </div>
        </div><br>

 <!-- <div class="col-sm-8">
       <button type="submit" class="btn btn-primary" value="guardar">
          <i class="fas fa-save"></i> Guardar
      </button>
  </div>-->
    <!--    <div class="col-sm-8">
            <button class="btn btn-primary"> <i class="fas fa-save"></i> Guardar</button>
        </div>  --> 
</div>
    </form>
  
    <g:render template="/layouts/footer"/>
</body>

</html>
