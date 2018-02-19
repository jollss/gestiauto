package gestion

<<<<<<< HEAD
import grails.plugin.springsecurity.annotation.Secured


=======
>>>>>>> angel-dev
class AutomovilController {

    def index() {
        render(view: 'index', model: [automoviles:Automovil.findAll()])
    }

    def guardarauto()
    {
        render(view: 'guardarauto', model: [marcas:Marcas.findAll()])
    }

<<<<<<< HEAD
=======
    def guardarAutoMarca()
    {
        println("ReAuto: " + params)
        def auto = new Automovil(nombreAuto: params.nombreAuto, marcas: params.id_marca)
        auto.save(flush:true)
        redirect (action:"index")
    }

>>>>>>> angel-dev
    def eliminar(long id)
    {
        def auto=Automovil.get(params.id as long )
        auto.delete(flush:true)
        redirect (action:"index")
    }

    def modificarauto(long id )
    {
        println id 
        def auto=Automovil.get(id)
        [auto:auto]
    }

    def guardar(long id)
    {     
        def auto=Automovil.get(id)
        auto.nombreAuto = params.nombre
        auto.save(flush:true) 
        redirect (action:"index")
    }
}
    