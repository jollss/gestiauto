<div id="verPendientes">    
   <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
                </tr>
            </thead>
 <g:each in="${servicios}" var="serv">
            <tbody>
               
                    <tr>
                        <td>${serv.observacionesMecanico} </td>
                        <td>${serv.estatus}</td>
                        <td>${serv.comentariosUsuario}</td>
                        <td>${serv.automovil.nombreAuto}</td>
                        <td>${serv.usuarios.username}</td>
                        <td>${serv.estatus}</td>
                        <td>
                            <g:link class="btn btn-success " controller="Servicios" action="hacerservicio" id="${serv.id}"><i class="fas fa-check "></i> Hacer</g:link>

                        </td>
                    </tr>
                
            </tbody>
</g:each>
        </table>
        </div>
<!----------------------------------------------------------------servicios terminados -------------------------------------------------- -->
<div style="display:none;" id="verTerminados">    
   <table class="table table-bordered table-striped col-sm-4">
            <thead class="thead-inverse">
                <tr>
                    <th>Observaciones</th>
                    <th>Estatus</th>
                    <th>Comentarios del usuario</th>
                    <th>Marca del auto</th>
                    <th>Nombre del usuario</th>
                    <th>Estatus</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${serviciosTerminados}" var="servi">
                    <tr>
                        <td>${servi.observacionesMecanico} </td>
                        <td>${servi.estatus}</td>
                        <td>${servi.comentariosUsuario}</td>
                        <td>${servi.automovil.nombreAuto}</td>
                        <td>${servi.usuarios.username}</td>
                        <td>${servi.estatus}</td>
                        <td>
                            <g:link class="btn btn-success " controller="Servicios" action="hacerservicio" id="${servi.id}"><i class="fas fa-check "></i> Hacer</g:link>

                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        </div>
