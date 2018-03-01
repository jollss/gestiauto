package gestion


asdasdasdasdas
class AutomovilController {

    def index() {
        render(view: 'index', model: [automoviles:Automovil.findAll()])
    }

    def guardarauto()
    {
        render(view: 'guardarauto',model: [marcas:Marcas.findAll()])
    }
    def guardarAutoMarca()
    {
       
        def auto = new Automovil(nombreAuto: params.nombreAuto, marcas: params.id_marca)
        auto.save(flush:true)
        redirect (action:"index")
    }

    def eliminar(long id)
    {
        def auto=Automovil.get(params.id as long )
        auto.delete(flush:true)
        redirect (action:"index")
    }

    def modificarauto(long id )
    {
      
        def auto=Automovil.get(id)
        def marca = Marcas.findAll()
        [auto:auto, marcas:marca.findAll()]
    }

    def guardar(long id)
    {     
        def autoOriginal=Automovil.get(id)
        def marca = Marcas.findById(Long.valueOf(params.id_marca))
        println(params)
        if (String.valueOf(params.nombre.trim()) != '') {
            autoOriginal.nombreAuto = params.nombre
        }
        autoOriginal.marcas = marca
        autoOriginal.save(flush: true)
        redirect(action: "index")
    }
}
    