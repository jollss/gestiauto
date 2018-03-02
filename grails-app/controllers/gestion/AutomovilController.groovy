package gestion

/**
 * Controla el flujo de información entre la vista y el modelo de Automóvil
 */
class AutomovilController {

    /**
     * Index: Action principal, se ejecuta por defecto cuando se llama al Controlador.
     * -- Consulta registros del domain Automóvil en la BD y los retorna como modelo, en la vista index.
     * @return render con vista y modelo.
     */
    def index() {
        def automoviles = Automovil.createCriteria().list {
            order("nombreAuto", "asc")
        }
        //def automoviles=Automovil.executeQuery ( " from Automovil")
        // [automoviles:automoviles]
        // println automoviles
        render(view: 'index', model: [automoviles: automoviles])
    }

    /**
     * nuevoAuto:
     * -- Consulta datos del domain Marca en la BD, y los devuelve como modelo para
     *    auxiliar a la creación de un Auto.
     * @return render con vista y modelo.
     */
    def nuevoAuto() {
        def marcas = Marca.executeQuery(" from Marca")
        render(view: 'nuevoAuto', model: [marcas: marcas])
    }

    /**
     * guardarAuto:
     * -- Recibe params, crea un nuevo registro del domain Automovil con los
     *    datos recibidos, y almacena en la base de datos.
     * @return redirect; Redirecciona a action 'index'.
     */
    def guardarAuto() {
        def auto = new Automovil(nombreAuto: params.nombreAuto, marcas: params.id_marca)
        auto.save(flush: true)
        redirect(action: "index")
    }

    /**
     * eliminarAuto:
     * -- Recibe el parámetro de ID, para buscar en los registros de la base de datos y eliminarlo.
     * @param id - Parámetro necesario para la eliminación de un registro.
     * @return redirect; Redirecciona a action 'index'.
     */
    def eliminarAuto(long id) {
        def auto = Automovil.get(id as long)
        def autos = Servicios.findByAutomovil(auto)
        if (autos) {
            flash.error = "Tiene un servicio, no se puede eliminar"
        } else {
            flash.message = "Se ha eliminado correctamente"
            auto.delete(flush: true)
        }
        redirect(action: "index")
    }

    /**
     * modificarAuto:
     * -- Recibe el parámetro de ID, para buscar en los registros de la base de datos y mostrar pantalla
     *    para modificarlo.
     * @param id - Parámetro necesario para la modificación de un registro.
     * @return render con vista y modelos.
     */
    def modificarAuto(long id) {
        def auto = Automovil.get(id)
        def marca = Marca.findAll()
        [auto: auto, marcas: marca.findAll()]
    }

    /**
     * guardarModificacion:
     * -- Recibe el parámetro de ID(Obligatorio) y datos correspondientes al domain Automovil, para buscar
     *    en los registros de la base de datos, mostrar pantalla y modificarlo.
     * @param id - Parámetro necesario para la modificación de un registro.
     * @return redirect; Redirecciona a action 'index'.
     */
    def guardarModificacion(long id) {
        def autoTemp = Automovil.get(id)
        def marca = Marca.findById(Long.valueOf(params.id_marca))
        println(params)
        if (String.valueOf(params.nombre.trim()) != '') {
            autoTemp.nombreAuto = params.nombre
        }
        autoTemp.marcas = marca
        autoTemp.save(flush: true)
        redirect(action: "index")
    }
}
    
