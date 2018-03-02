package gestion

/**
 *  Controla el flujo de información entre la vista y el modelo de Marca
 */
class MarcaController {

    /**
     * Index: Action principal, se ejecuta por defecto cuando se llama al Controlador.
     * -- Consulta registros del domain Marca en la BD y los retorna como modelo, en la vista index.
     * @return render con vista y modelo.
     */
    def index() {
        def listadoMarca = Marca.list()
        ["marcas": listadoMarca]
    }

    /**
     * nuevaMarca:
     * -- Action que sirve para mostrar la vista de nueva Marca.
     */
    def nuevaMarca() {}

    /**
     * guardarMarca:
     * -- Recibe params, crea un nuevo registro del domain Marca con los
     *    datos recibidos, y almacena en la base de datos.
     * @return redirect; Redirecciona a action 'index'.
     */
    def guardarMarca() {
        def marca = new Marca(params)
        marca.save()
        redirect(action: "index", id: marca.id)
    }

    /**
     * eliminarMarca:
     * -- Recibe el parámetro de ID, para buscar en los registros de la base de datos y eliminarlo.
     * @param id - Parámetro necesario para la eliminación de un registro.
     * @return redirect; Redirecciona a action 'index'.
     */
    def eliminarMarca(long id) {
        def marca = Marca.get(params.id as long)
        def marcas = Servicios.findByMarca(marca)
        if (marcas) {
            flash.error = "Tiene un servicio, no se puede eliminar"
        } else {
            flash.message = "Se ha eliminado correctamente"
            marca.delete(flush: true)
        }
        redirect(action: "index")
    }

    /**
     * modificarMarca:
     * -- Recibe el parámetro de ID, para buscar en los registros de la base de datos y mostrar pantalla
     *    para modificarlo.
     * @param id - Parámetro necesario para la modificación de un registro.
     * @return render con vista y modelos.
     */
    def modificarMarca(long id) {
        def marca = Marca.get(id)
        [marca: marca]
    }

    /**
     * guardarModificacion:
     * -- Recibe el parámetro de ID(Obligatorio) y datos correspondientes al domain Automovil, para buscar
     *    en los registros de la base de datos, mostrar pantalla y modificarlo.
     * @param id - Parámetro necesario para la modificación de un registro.
     * @return redirect; Redirecciona a action 'index'.
     */
    def guardarModificacion(long id) {
        def marca = Marca.get(id)
        marca.nombreMarca = params.nombre
        marca.save(flush: true)
        redirect(action: "index")
    }

}