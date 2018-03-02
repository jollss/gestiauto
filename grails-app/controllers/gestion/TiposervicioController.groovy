package gestion


class TiposervicioController {


    def index() {
        def objTipoServicio = Tiposervicio.list()
        return ["tipoServicios": objTipoServicio]
    }


    def crearServicio() {
        def objTipoServicio = new Tiposervicio(params)
        objTipoServicio.save()
        redirect(action: "index", id: objTipoServicio.id)
    }


    def modificarTipoServicio(Long id) {
        def objTipoServicio = Tiposervicio.get(id)
        [tipoServicio: objTipoServicio]
    }


    def actualizaServicio(Long id) {
        def objTipoServicio = Tiposervicio.get(id)
        objTipoServicio.nombreServicio = params.nombreServicio
        objTipoServicio.save(flush: true)
        redirect(action: "index")
    }


    def eliminaServicio(Long id) {
        def objTipoServicio = Tiposervicio.get(params.id as long)
        def consultarTipoServicio=Servicios.findAllByTiposervicio(objTipoServicio)
        if (consultarTipoServicio) {
            flash.error = "Tiene un servicio, no se puede eliminar"
       } else {
            flash.message = "Se ha eliminado correctamente"
          objTipoServicio.delete(flush: true)
        }
        redirect(action: "index")
    }


    def nuevoTipoServicio() {

    }

}
