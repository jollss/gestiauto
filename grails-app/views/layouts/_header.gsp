<nav class="navbar navbar-default sidebar col-sm-3 py-4" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>      
        </div>
        <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
            <h3>Controladores</h3>

            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.name } }">
                <g:if test="${c.name != 'Dbdoc' && c.name != 'Logout' && c.name != 'Login' && c.name != 'Rol'  && c.name != 'Dashboard'  && c.name != 'Tiposervicio'  && c.name != 'Usuario'  && c.name != 'UsuarioRol'}">
                    <ul class="nav navbar-nav">
                        <li>
                            <g:link controller="${c.logicalPropertyName}">${c.name}</g:link>
                        </li>
                    </ul>
                </g:if>
            </g:each>
            <ul class="nav navbar-nav">
                <li> 
                    <a id="btnCerrarSesion" type="button">Cerrar sesión</a>
                </li>
            </ul>

        </div>
    </div>
</nav>