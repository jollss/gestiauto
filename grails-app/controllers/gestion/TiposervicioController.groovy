package gestion

import grails.plugin.springsecurity.annotation.Secured


class TiposervicioController {
    
    @Secured(['ROLE_ADMIN'])
    def index() 
    { 
        def tiposervicios = Tiposervicio.findAll()
        println tiposervicios.nombreServicio
    }
}
