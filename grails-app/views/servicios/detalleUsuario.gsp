<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ADMIN</title>
</head>

<body>
    <g:render template="/layouts/navbar" />
    <g:render template="/layouts/header" />

<div class="container col-sm-9">
        <button class="btn btn-primary" onclick="verActivos()">Ver Usuarios Activos</button>
        <button  class="btn btn-primary" onclick="verDesactivos()">Ver Usuarios Desactivados</button> 
<div id="verActivos">    
     <h1>Usuarios Activos</h1>
   <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>      <th>Role de Usuario</th>  
                    <th>Nombre de Usuario</th>
                                
                      <th>Estatus</th>    
    <th>  Servicios Pendientes</th>
      
                    <th>Acciones</th>
                 
                </tr>
            </thead>
 
          
 <g:each in="${detalles}" var="act">
 <g:if test="${act.usuarios[0].secAppRole.authority != 'ROLE_ADMIN'}">
            <tbody>   <td>${act.usuarios[0].secAppRole.authority}</td>
                        <td> ${act.usuarios[0].secAppUser.username}</td>
                          <td>  
                              ${act.usuarios[0].secAppUser.enabled ? "Activo":"NO"}
                           </td>
                           
                           <td>  
                              ${act.cuantos ? "Servicos pendientes":"Sin Servicio"}
</td>
                          
                        <td>
   <g:link style="background-color: #E65100; color: white;" class="btn btn-success " controller="Servicios" action="editarUsuario" id="${act.usuarios[0].secAppUser.id}"> Desactivar</g:link>
<g:if test="${act.cuantos==0}">
   <g:link style="background-color: #009688; color: white;" class="btn btn-success " controller="Servicios" action="eliminarUsuario" id="${act.usuarios[0].secAppUser.id}"> Eliminar</g:link>

                        </td>
                         </g:if>
                    </tr>
                
            </tbody>
        </g:if>
             
</g:each>
       
        </table>
        </div>
<!-- ------------------------------------------------------------------------------------------------- -->
<div style="display:none;" id="verDesactivos">    
     <h1>Usuarios Desactivados</h1>
   <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                     <th>Nombre de Usuario</th>
                    <th>Role de Usuario</th>                    
                          <th>Estatus</th>         
<th>  Servicios Pendientes</th>
                    <th>Acciones</th> </tr>
            </thead>
            <tbody>
                <g:each in="${deta}" var="des">
                     <g:if test="${des.usuarios.secAppRole.authority != 'ROLE_ADMIN'}">
                    <tr>                  
        <td>${des.usuarios[0].secAppUser.username}</td>
                        <td>${des.usuarios[0].secAppRole.authority}</td>
                        
 <td>${des.usuarios[0].secAppUser.enabled ? "Activo":"Desactivado"}</td> 
 <td>  
                              ${des.cuantos}
                     
                           </td>

                      <td>
<g:link style="background-color: #E65100; color: white;" class="btn btn-success " controller="Servicios" action="editarUsuario" id="${des.usuarios[0].secAppUser.id}"> Activar</g:link>
<g:if test="${des.cuantos==0}">
<g:link style="background-color: #009688; color: white;" class="btn btn-success " controller="Servicios" action="eliminarUsuario" id="${des.usuarios[0].secAppUser.id}"> Eliminar</g:link>
 </g:if>
                        </td>
                    </tr>
                     </g:if>
                </g:each>
            </tbody>
        </table>
        
        </div>



        <g:link controller="Servicios" action="crearUsuario" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar Usuario</g:link>

      </div>

      <g:render template="/layouts/footer"/>
         
 <g:render template="/layouts/footer"/>
</body>

</html>
