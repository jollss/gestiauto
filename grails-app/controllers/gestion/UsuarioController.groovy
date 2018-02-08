package gestion

import grails.plugin.springsecurity.annotation.Secured

class UsuarioController {
    
    @Secured(['ROLE_ADMIN'])
    def index() 
    { 
        def usuarios = Usuario.findAll()
        println usuarios.nombreUsuario
    }
}
