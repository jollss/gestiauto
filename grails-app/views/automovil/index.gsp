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
         <h1>Automóviles</h1>
         
            <table class="table table-bordered table-striped col-sm-4">
             <thead class="thead-inverse">
               <tr>
                 <th>Nombre</th>
                 <th>Acciones</th>
               </tr>
             </thead>
             <tbody>
              <g:each in="${automoviles}" var="auto">
               <tr>
                 <td>${auto.nombreAuto}</td>
                 <td>
                  <g:link class="btn btn-warning " controller="Automovil" action="modificarauto" id="${auto.id}"><i class="fas fa-edit"></i> Modificar</g:link>

                   <g:link class="btn btn-danger" controller="Automovil" action="eliminar" id="${auto.id}"><i class="fas fa-ban "></i> Eliminar</g:link>
                   
                 </td>
               </tr>
                 </g:each>
             </tbody>
           </table>
       
         <g:link controller="Automovil" action="guardarauto" class="btn btn-primary"><i class="fas fa-plus"></i> Agregar automóvil</g:link>
         </td><br>
      </div>
      <g:render template="/layouts/footer"/>
   </body>
</html>

