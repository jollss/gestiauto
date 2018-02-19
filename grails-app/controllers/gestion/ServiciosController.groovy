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
        if (tipoUsuarioActual == "[ROLE_MECANICO]"){
            servicios = Servicios.findAllWhere(usuarios: usuarios, estatus: "pendiente")
        }else if (tipoUsuarioActual == "[ROLE_USUARIO]"){
            redirect(action: "crearcita")
        }else{
            println "No existe el tipo de usuario: Controller Servicios - Index"
        }
        [servicios: servicios]
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
        [marcas    : Marcas.findAll(), automoviles: Automovil.findAll(), tiposervicios: Tiposervicio.findAll()
         , usuarios: SecAppUser.findAll(), rol: SecAppUserSecAppRole.findAll("from SecAppUserSecAppRole where sec_app_role_id=1"), usuariosrol: SecAppRole.findAll()]
    }


    def guardar() {
        def p = new Servicios()
        p.estatus = params.estatus
        p.comentariosUsuario = params.comentariosUsuario
        p.diaServicio = params.diaServicio
        p.horaServicio = params.horaServicio
        p.marca = Marcas.get(params.selectmarcas as long)
        p.automovil = Automovil.get(params.selectaut as long)
        p.tiposervicio = Tiposervicio.get(params.selecttipo as long)
        p.observacionesMecanico = params.observacionesMecanico
        p.usuarios = SecAppUser.get(params.selectusu as long)
        if (p.save(flush: true)) {
            println ""
            redirect(action: "index")
        } else {
            println "No se guardo nada vale chetos la vida "
        }
    }


    def citaterminada() {
        [servicios: Servicios.findAll("from Servicios where estatus='terminado'")]
    }


    def delete(long id) {
        def servicios = Servicios.get(params.id as long)
        servicios.delete(flush: true)
        redirect(action: "citaterminada")
    }

    def citasUsuario(){
        [servicios: Servicios.findAll()]
    }

    def findAutoByMarca(){
        def paramIdRec = params.marca.id
        paramIdRec.trim()
        if (paramIdRec == ''){
            println("Es null")
            return render(template: 'autoSelection', model:  [automoviles: null])
        }
        def marca = Marcas.get(paramIdRec)
        println("Marca": marca.automoviles.nombreAuto)
        render(template: 'autoSelection', model:  [automoviles: marca.automoviles])
    }
}