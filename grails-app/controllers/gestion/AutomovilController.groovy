package gestion


class AutomovilController {

//con criteria te vas a traer el nombre del usuario que dio de alta , 
//el nombre del mecanico a quien fue asignado el servicio y los datos de servicio donde los automoviles sean chevy
    def index() {
        def automoviles = Automovil.createCriteria().list{ 
          order ("nombreAuto", "asc")
        }


        //def automoviles=Automovil.executeQuery ( " from Automovil") 
       // [automoviles:automoviles]
       // println automoviles
    render(view: 'index', model: [automoviles:automoviles])
        
    }

    def guardarauto()
    {
        def marcas=Marcas.executeQuery ( " from Marcas") 
        render(view: 'guardarauto',model: [marcas:marcas])
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
    