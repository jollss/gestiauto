package gestion

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class TiposervicioController {
    
    @Secured(['ROLE_ADMIN'])
    def index() 
    {
        def objTipoServicio = Tiposervicio.list()
        return ["tipoServicios":objTipoServicio]
    }

    @Secured(['ROLE_ADMIN'])
    def crearServicio() {
        def objTipoServicio = new Tiposervicio(params)
        objTipoServicio.save()
        redirect(action: "index", id: objTipoServicio.id)
    }

    @Secured([])
    def modificarTipoServicio(Long id){
        def objTipoServicio=Tiposervicio.get(id)
        [tipoServicio:objTipoServicio]
    }

    @Secured(['ROLE_ADMIN'])
    def actualizaServicio(Long id){
        def objTipoServicio=Tiposervicio.get(id)
        objTipoServicio.nombreServicio = params.nombreServicio
        objTipoServicio.save(flush:true)
        redirect (action:"index")
    }

    @Secured(['ROLE_ADMIN'])
    def eliminaServicio(Long id){
        def objTipoServicio=Tiposervicio.get(params.id as long )
        objTipoServicio.delete(flush:true)
        redirect (action:"index")
    }

    @Secured(['ROLE_ADMIN'])
    def nuevoTipoServicio(){

    }

}
