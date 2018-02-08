package gestion

import grails.plugin.springsecurity.annotation.Secured

class UsuarioRolController {

    @Secured(['ROLE_ADMIN'])
    def index() { 
        def usuario_roles = UsuarioRol.findAll()
        println usuario_roles
        println usuario_roles.rol.nombreRol
        println usuario_roles.usuario.nombreUsuario
        println usuario_roles.usuario.password
    }
}
