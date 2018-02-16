package gestion

import grails.plugin.springsecurity.annotation.Secured

class RolController {

    def index() {
     def roles = Rol.findAll()
        println roles.nombreRol
    }
}
