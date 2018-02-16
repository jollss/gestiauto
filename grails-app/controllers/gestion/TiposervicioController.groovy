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
        objTipoServicio.delete(flush: true)
        redirect(action: "index")
    }


    def nuevoTipoServicio() {

    }

}
