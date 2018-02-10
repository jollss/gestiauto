<link rel="stylesheet" href="/gestion/css/bootstrap.min.css">		
<link rel="stylesheet" href="/gestion/css/myEstilo.css">
<link rel="stylesheet" href="/gestion/css/libs/fontawesome-all.min.css">

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${createLink(uri:'/')}">Control Autos</a>
        </div>
        <ul class="nav navbar-nav">
			<g:remoteLink class="logout btn" controller="logout" method="post" asynchronous="false" onSuccess="location.reload()">Cerrar sesión</g:remoteLink>
        </ul>
    </div>
</nav>