<nav class="navbar navbar-default sidebar col-sm-3 py-4" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-sidebar-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
            <h3>Controladores</h3>
            <sec:ifAnyGranted roles="ROLE_USUARIO">
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name }}">
                    <g:if test="${c.name != 'Dbdoc' &&
                            c.name != 'Logout' &&
                            c.name != 'Login' &&
                            c.name != 'Rol' &&
                            c.name != 'Dashboard' &&
                            c.name != 'Usuario' &&
                            c.name != 'Automovil' &&
                            c.name != 'Automovil' &&
                            c.name != 'Marcas' &&
                            c.name != 'Tiposervicio' &&
                            c.name != 'Refaccion' &&
                            c.name != 'UsuarioRol'}">
                        <ul class="nav navbar-nav">
                            <li>
                                <g:if test="${c.name == 'Servicios'}">
                                    <ul class="nav navbar-nav">
                                        <li>
                                            <g:link controller="${c.logicalPropertyName}">Crear cita</g:link>
                                        </li>
                                    </ul>
                                </g:if>
                                <g:if test="${c.name == 'Servicios'}">
                                    <ul class="nav navbar-nav">
                                        <li>
                                            <g:link controller="${c.logicalPropertyName}"
                                                    action="citasUsuario">Historial citas</g:link>
                                        </li>
                                    </ul>
                                </g:if>
                            </li>
                        </ul>
                    </g:if>
                </g:each>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_MECANICO">
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name }}">
                    <g:if test="${c.name != 'Dbdoc' &&
                            c.name != 'Logout' &&
                            c.name != 'Login' &&
                            c.name != 'Rol' &&
                            c.name != 'Dashboard' &&
                            c.name != 'Usuario' &&
                            c.name != 'Refaccion' &&
                            c.name != 'UsuarioRol'}">
                        <ul class="nav navbar-nav">
                            <li>
                                <g:link controller="${c.logicalPropertyName}">${c.name}</g:link>
                            </li>
                        </ul>
                    </g:if>
                </g:each>
            </sec:ifAnyGranted>
             <sec:ifAnyGranted roles="ROLE_ADMIN">
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name }}">
                    <g:if test="${c.name != 'Dbdoc' &&
                            c.name != 'Logout' &&
                                 c.name != 'Marcas' &&
                                  c.name != 'Automovil' &&
                                  c.name != 'Pedido' &&
                                    c.name != 'Tiposervicio' &&
                            c.name != 'Login' &&
                            c.name != 'Rol' &&
                            c.name != 'Dashboard' &&
                            c.name != 'Usuario' &&
                            c.name != 'Refaccion' &&
                            c.name != 'UsuarioRol'}">
                        <ul class="nav navbar-nav">
                            <li>
                                <g:link controller="${c.logicalPropertyName}" action="crearUsuario">Alta Usuario</g:link>
                            </li>
                             <li>
                                <g:link controller="${c.logicalPropertyName}" action="detalleUsuario">Consultar Usuarios</g:link>
                              
                            </li>
                        </ul>
                    </g:if>
                </g:each>
            </sec:ifAnyGranted>
            <ul class="nav navbar-nav">
                <li>
                    <a id="btnCerrarSesion" type="button">Cerrar sesión</a>
                </li>
            </ul>

        </div>

        <g:if test="${flash.error}">
            <div class="alert alert-error" style="display: block;background-color: #B71C1C; color: white;">${flash.error}</div>
        </g:if>
        <g:if test="${flash.message}">
            <div class="alert alert-success message" style="display: block; background-color: #00695C; color: white;" >${flash.message}</div>
        </g:if>
    </div>
</nav>