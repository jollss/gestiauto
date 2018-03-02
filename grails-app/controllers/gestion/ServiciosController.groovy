package gestion

import gestion.secureapp.SecAppUser
import gestion.secureapp.SecAppUserSecAppRole
import gestion.secureapp.SecAppRole

class ServiciosController {
    def springSecurityService
    def UsuarioService

    def index() {

        def usuarios = springSecurityService.currentUser
        def tipoUsuarioActual = UsuarioService.tipoUsuarioActual
        def servicios = null
        def serviciosTerminados = null
        def detalle = null
        def deta = null

        if (tipoUsuarioActual == "[ROLE_MECANICO]") {
            servicios = Servicios.findAllWhere(usuarios: usuarios, estatus: "pendiente")
            serviciosTerminados = Servicios.findAllWhere(usuarios: usuarios, estatus: "terminado")
            def detalles = []
            servicios.each {
                detalle = DetalleServicio.findAllByServicios(it)
                detalles << detalle
            }
            [servicios: servicios, serviciosTerminados: serviciosTerminados, detalles: detalles]
        } else if (tipoUsuarioActual == "[ROLE_USUARIO]") {
            redirect(action: "crearcita")
        } else {
            println "No existe el tipo de usuario: Controller Servicios - Index"
        }
    }

    def hacerservicio(long id) {
        def servicios = Servicios.get(id)
        [servicios: servicios]
    }

    def save(long id) {
        def servicios = Servicios.get(id)
        servicios.observacionesMecanico = params.observaciones
        servicios.estatus = params.estatus
        servicios.save(flush: true)
        redirect(action: "index")
    }

    def crearcita() {
        def rol = SecAppRole.findByAuthority("ROLE_MECANICO")
        def usuario = SecAppUserSecAppRole.findAllBySecAppRole(rol)
        def usuarios = springSecurityService.currentUser
        [marcas: Marca.findAll(), automoviles: Automovil.findAll(), tiposervicios: Tiposervicio.findAll(), usuario: usuario]
    }

    def guardar() {
        def usuarios = springSecurityService.currentUser
        def p = new Servicios()
        p.estatus = params.estatus
        p.comentariosUsuario = params.comentariosUsuario
        p.diaServicio = params.diaServicio
        p.horaServicio = params.horaServicio
        p.marca = Marca.get(params.selectmarcas as long)
        p.automovil = Automovil.get(params.selectaut as long)
        p.tiposervicio = Tiposervicio.get(params.selecttipo as long)
        p.observacionesMecanico = params.observacionesMecanico
        p.usuarios = SecAppUser.get(params.selectusu as long)
        if (p.save(flush: true)) {
            def detalleservicio = new DetalleServicio()
            detalleservicio.servicios = p
            detalleservicio.usuarios = springSecurityService.currentUser
            detalleservicio.save(flush: true)
            // [detalleservicio:detalleservicio]
            redirect(action: "citasUsuario")


        } else {
            println "No se guardo nada vale chetos la vida "
        }
    }

    def delete(long id) {
        def servicios = Servicios.get(params.id as long)
        servicios.delete(flush: true)
        redirect(action: "citaterminada")
    }

    def citasUsuario() {
        def usuarios = springSecurityService.currentUser
        [detalleservicio: DetalleServicio.findAllWhere(usuarios: usuarios)]
    }

    def findAutoByMarca() {
        def paramIdRec = params.marca.id
        paramIdRec.trim()
        if (paramIdRec == '') {
            println("Es null")
            return render(template: 'autoSelection', model: [automoviles: null])
        }
        def marca = Marca.get(paramIdRec)

        render(template: 'autoSelection', model: [automoviles: marca.automoviles])
    }

    def crearUsuario() {
        def rol = SecAppRole.findAll()
        [rol: rol]
    }

    def guardarusu() {
        def nuevo = new SecAppUser()
        nuevo.username = params.username
        nuevo.password = params.password
        nuevo.enabled = params.select.toBoolean()
        def rol = SecAppRole.get(params.selectusuario as long)
        nuevo.save(flush: true)
        def nuevorol = new SecAppUserSecAppRole()
        nuevorol.secAppUser = nuevo
        nuevorol.secAppRole = rol
        nuevorol.save(flush: true)
        redirect(action: "detalleUsuario")
    }

    def detalleUsuario() {
        def activo = SecAppUser.findAllWhere(enabled: true)
        def desactivo = SecAppUser.findAllWhere(enabled: false)

        def detalles = []
        activo.each {
            def mapa = [:]

            def servicios = Servicios.findAllWhere(usuarios: it)
            def servicio = DetalleServicio.findAllWhere(usuarios: it)
            def detalle = SecAppUserSecAppRole.findAllBySecAppUser(it)
            mapa.usuarios = detalle
            mapa.cuantos = servicios.size()
            detalles << mapa
        }
        def deta = []
        desactivo.each {
            def mapa = [:]
            def servicios = Servicios.findAllWhere(usuarios: it)
            def detal = SecAppUserSecAppRole.findAllBySecAppUser(it)
            mapa.usuarios = detal
            mapa.cuantos = servicios.size()
            deta << mapa
        }
        [deta: deta, detalles: detalles]
    }

    def editarUsuario() {


        def desactivarusuario = SecAppUser.get(params.id as long)
        if (desactivarusuario.enabled == true) {
            desactivarusuario.enabled = false
        } else if (desactivarusuario.enabled == false) {
            desactivarusuario.enabled = true
        }
        desactivarusuario.save(flush: true)
        redirect(action: "detalleUsuario")


    }

    def eliminarUsuario() {
        def usuarios = SecAppUser.get(params.id as long)
        def consultarservicios = Servicios.findAllWhere(usuarios: usuarios)
        def consultardetalle = DetalleServicio.findAllWhere(usuarios: usuarios)
        if (consultarservicios[0] == null & consultardetalle[0] == null) {
            def eliminarusuariorole = SecAppUser.get(params.id as long)
            def eliminar = SecAppUserSecAppRole.findAllWhere(secAppUser: eliminarusuariorole)
            eliminar.each
                    {
                    }
            eliminar[0].delete(flush: true)
            def eli = SecAppUser.get(params.id as long)
            eli.delete(flush: true)
            redirect(action: "detalleUsuario")
        } else if (consultarservicios != null & consultardetalle != null) {
            //   render(view: "detalleUsuario",  model: [name:"el usuario tiene servicios pendientes "])
            redirect(action: "detalleUsuario")
        }
    }
}
