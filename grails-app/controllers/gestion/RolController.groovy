package gestion

import grails.plugin.springsecurity.annotation.Secured

class RolController {
    
    @Secured(['ROLE_ADMIN'])
    def index() {
     def roles = Rol.findAll()
        println roles.nombreRol
    }
}
