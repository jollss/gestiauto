package gestion



class UsuarioController {
    
   
    def index() 
    { 
        def usuarios = Usuario.findAll()
        println usuarios.nombreUsuario
    }

}
