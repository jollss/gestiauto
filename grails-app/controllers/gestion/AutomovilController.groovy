package gestion

import grails.plugin.springsecurity.annotation.Secured

@Secured([ "ROLE_USER", "ROLE_ADMIN" ])
class AutomovilController {

    @Secured(['ROLE_USER', "ROLE_ADMIN"])
    def index() {
        render(view: 'index', model: [automoviles:Automovil.findAll()])
    }
    
    @Secured(['ROLE_ADMIN'])
    def guardarauto()
    {
        def auto = new Automovil(params)
        auto.save(flush:true)  
    }
    
    @Secured(['ROLE_ADMIN'])
    def eliminar(long id)
    {
        def auto=Automovil.get(params.id as long )
        auto.delete(flush:true)
        redirect (action:"index")
    }
  
    @Secured(['ROLE_ADMIN'])
    def modificarauto(long id )
    {
        println id 
        def auto=Automovil.get(id)
        [auto:auto]
    }
  
    @Secured(['ROLE_ADMIN'])
    def guardar(long id)
    {     
        def auto=Automovil.get(id)
        auto.nombreAuto = params.nombre
        auto.save(flush:true) 
        redirect (action:"index")
    }
}
    