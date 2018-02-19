<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="/gestion/css/libs/bootstrap.min.css">
    <link rel="stylesheet" href="/gestion/css/libs/myEstilo.css">
    <title>Iniciar sesión</title>
</head>
<body>
    <div class="container">
      <div class="row" style="justify-content: center; ">
         <div class="col-md-4" style="color:white;">-</div>
         <div class="col-md-4">
            <div class="card loginSpring">
               <div class="card-block">
                  <h3 class="card-title">Iniciar sesión</h3>
                  <br/>
                  <div class="card-text">
                    <div class="login_message"></div>
                     <form action='/gestion/j_spring_security_check' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                        <div>
                           <div>
                              <span id="text-login-msg">Escribe tu usuario y contraseña</span>
                           </div>
                           <br/>
                           <input id="username" name="j_username" class="text_ form-control" type="text" placeholder="Usuario" required>
                           <br/>
                           <input id="password" name='j_password' class="text_ form-control" type="password" placeholder="Contraseña" required>
                           <div class="checkbox">
                              <label>
                              <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me' />Recordar
                              </label>
                           </div>
                        </div>
                        <div>
                           <div>
                            <br/>
                              <button type="submit" name="submit" class="btn btn-primary btn-lg btn-block">Iniciar sesión</button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
            <div class="col-md-4" style="color:white;">-</div>
         </div>
      </div>
    </div>
      <div class="footer" role="contentinfo"></div>
      <div id="spinner" class="spinner" style="display:none;">Loading&hellip;</div>
      <script src="/gestion/js/libs/jquery.min.js"></script>
      <script src="/gestion/js/libs/bootstrap.js"></script>
      <script src="/gestion/js/libs/miScript.js"></script>
      <script src="/gestion/js/libs/verificaLogin.js"></script>
</body>
</html>