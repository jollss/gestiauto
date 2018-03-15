package gestion

/*import
import:Este import es del package gestion.secureapp que permite utilizar los domains de SecAppUser,SecAppRole y su SecAppUserSecAppRole,
ya que sin este packge no se podria utilizar las propiedades de estos objetos ya que como tal no existen en el package de gestion.
 */
import gestion.secureapp.SecAppUser
import gestion.secureapp.SecAppUserSecAppRole
import gestion.secureapp.SecAppRole
class ServiciosController {
    /*Service
     * springSecurityService:Es la forma de inyectar un service,este service en particular se utiliza para poder ver 
    que usuarios esta logeado en ese instante 
     *UsuarioService:De igual manera es un service(UsuarioService) que permite ver que rol del usuario logeado tiene  
     */
    def springSecurityService
    def UsuarioService
    /*Index:En este metodo se pinta los servicios que tiene ese usuario logeado  y con ROLE_MECANICO,ademas muestra los servcios activos e inactivos,
    donde se utiliza un JS llamado funciones.js
     *Variables:
     *usuarios:Se declara usuarios porque asi en el domains de servicio se hace referencia SecAppUser=usuarios
     *tipoUsuarioActual:de igual manera en el service(UsuarioService) se declaro para conocer el rol del usaurio logeado
     *IF:Se genera un condicion para que especificamente el usuario con ROLE_MECANICO  pueda ver lo enviado para esa vista
     *servicios:En esta varible se hace la consulta de los servicios que tiene el usuario logeado y por el estatus pendiente,se empuja 
    la variable usuarios ya que esa contiene el usuario que esta logeado,y hara la busqueda de ese usuario por sus servicios pendientes
     *serviciosTerminados:En esta varible se hace la consulta de los servicios que tiene el usuario logeado y por el estatus Terminado,se empuja 
    la variable usuarios ya que esa contiene el usuario que esta logeado,y hara la busqueda de ese usuario por sus servicios terminados
     *detalles:Se declara esta variable para empujar ahi todos sus servicios y su detalle 
     *servicios:Se recorre la varible para ver todos los servicios de ese usuario 
     *detalle:se hace la consulta del servicios y se busca por el detalle de servicio  
     *detalles << detalle: De esta manera se empuja toda la consulta de la variable detalle 
     *[servicios: servicios, serviciosTerminados: serviciosTerminados, detalles: detalles]:de esta manera se emṕuja pára que en la vista
    se pueda visualizar lo obtenido de la consulta
     *elseif:se valida otro rol para poder mostrale otro tipo de informacion a la vista 
     */
    def index() {
        def usuarios = springSecurityService.currentUser
        def tipoUsuarioActual = UsuarioService.tipoUsuarioActual    
        if (tipoUsuarioActual == "[ROLE_MECANICO]") {
            def bitacora=Bitacora.findAllWhere(usuarios:usuarios)
            def servicios = Servicios.findAllWhere(usuarios: usuarios, estatus: "pendiente")
            def serviciosTerminados = Servicios.findAllWhere(usuarios: usuarios, estatus: "terminado")
            def serviciosReagendados = Servicios.findAllWhere(usuarios: usuarios, estatus: "reagendar")
            def detalles = []
            servicios.each {
                def mapa=[:]
                def detalle = DetalleServicio.findAllByServicios(it)
                mapa.usuarios = detalle
                mapa.cuantosPendientes = servicios.size()
                detalles << mapa
            }
            def detalleServicioTerminados=[]
            serviciosTerminados.each {
                def mapa=[:]
                def detalleterminado = DetalleServicio.findAllByServicios(it)
                mapa.usuarios = detalleterminado
                mapa.cuantosTerminados = serviciosTerminados.size()
                detalleServicioTerminados << mapa
            }
            def detalleserviciosReagendados=[]
            serviciosReagendados.each {
                def mapa=[:]
                  
                def detallereagendado = DetalleServicio.findAllByServicios(it)
                mapa.usuarios = detallereagendado
                mapa.cuantosReagendados = serviciosReagendados.size()                 
                detalleserviciosReagendados << mapa
            }            
            [bitacora:bitacora,servicios: servicios, serviciosTerminados: serviciosTerminados, detalles: detalles,detalleServicioTerminados:detalleServicioTerminados,detalleserviciosReagendados:detalleserviciosReagendados]
        } else if (tipoUsuarioActual == "[ROLE_USUARIO]") {
            redirect(action: "crearcita")
        } else {
            println "No existe el tipo de usuario: Controller Servicios - Index"
        }
    }
    /*
     * hacerservicio:Metodo donde se muestra un formulario con el detalle de ese servico 
     * variables:
     * servicios:Se ocupa la variable para poder en el formulario mandar todo los datos de la tabla servicio para pintalos en la vista de hacerservico,
    ademas se obtiene el valor enviado de la vista del index
     *[servicios: servicios]:Se empuja de esta manera a la vista 
     */
    def hacerservicio(long id) {
        def servicios = Servicios.get(id)
        def consultardetadelservicio=DetalleServicio.findAllWhere(servicios:servicios)
        [servicios: servicios,consultardetadelservicio:consultardetadelservicio]
    }
    def save(long id ) {
        def usuarios = springSecurityService.currentUser
        def servicios = Servicios.get(id )
        servicios.observacionesMecanico=params.observaciones
        servicios.estatus = params.estatus
        servicios.fechaterminacion=new Date() 
       servicios.save(flush: true)
        def bitacoraservicioterminado= new Bitacora()
        bitacoraservicioterminado. nombreUsuario= SecAppUser.get(params.usuario as long)
        bitacoraservicioterminado.diaServicio=params.diaServicio
        bitacoraservicioterminado.horaServicio=params.horaServicio
        bitacoraservicioterminado.observacionesMecanico=params.observaciones
        bitacoraservicioterminado.marca=Marca.get(params.marcas as long )
        bitacoraservicioterminado.automovil=Automovil.get(params.automovils as long )
        bitacoraservicioterminado.tiposervicio=Tiposervicio.get(params.tiposervicios as long )
        bitacoraservicioterminado.estatus=params.estatus
        bitacoraservicioterminado.folio=params.folio
        bitacoraservicioterminado.fechaterminacion = new Date() 
        bitacoraservicioterminado.usuarios = springSecurityService.currentUser
        bitacoraservicioterminado.comentariosUsuario ="Servicio Terminado "
        bitacoraservicioterminado.save(flush:true)
        redirect(action: "index")
    }
    def crearcita() {
        def rol = SecAppRole.findByAuthority("ROLE_MECANICO")
        def usuario = SecAppUserSecAppRole.findAllBySecAppRole(rol)
        def usuarios = springSecurityService.currentUser
        [marcas: Marca.findAll(), automoviles: Automovil.findAll(), tiposervicios: Tiposervicio.findAll(), usuario: usuario]
    }
    def guardar(long id) {
        def usuarios = springSecurityService.currentUser
        def verCode = UUID.randomUUID().toString()
def cortarudd=verCode.substring(9,13)
        def p = new Servicios()
        p.estatus = 'pendiente'
        p.comentariosUsuario = params.comentariosUsuario
        p.diaServicio = params.diaServicio
        p.horaServicio = params.horaServicio
        p.marca = Marca.get(params.selectmarcas as long)
        p.automovil = Automovil.get(params.selectaut as long)
        p.tiposervicio = Tiposervicio.get(params.selecttipo as long)
        p.folio=usuarios.username+params.selecttipo+params.selectaut+params.selectusu+cortarudd
        p.observacionesMecanico = params.observacionesMecanico
        p.usuarios = SecAppUser.get(params.selectusu as long)
        if (p.save()) {    
            def detalleservicio = new DetalleServicio()
            detalleservicio.servicios = p
            detalleservicio.usuarios = springSecurityService.currentUser
            detalleservicio.save(flush: true)
            def guardarbitacora = new Bitacora()
            guardarbitacora.folio=usuarios.username+params.selecttipo+params.selectaut+params.selectusu+cortarudd
            guardarbitacora.comentariosUsuario=params.comentariosUsuario
            guardarbitacora.diaServicio=params.diaServicio  
            guardarbitacora.horaServicio=params.horaServicio
            guardarbitacora.marca=Marca.get(params.selectmarcas as long)
            guardarbitacora.automovil = Automovil.get(params.selectaut as long)
            guardarbitacora.tiposervicio = Tiposervicio.get(params.selecttipo as long)
            guardarbitacora.observacionesMecanico = params.observacionesMecanico
            guardarbitacora.usuarios = SecAppUser.get(params.selectusu as long)
            guardarbitacora.estatus = 'pendiente '     
            guardarbitacora.nombreUsuario = springSecurityService.currentUser
            guardarbitacora.usuarios = SecAppUser.get(params.selectusu as long)
            guardarbitacora.save(flush: true)
         flash.message = "tu numero de folio es"+p.folio

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
    def citasUsuario()  {
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
            mapa.cuanto=servicio.size()
            detalles << mapa
        }
        def deta = []
        desactivo.each {
            def mapa = [:]
            def servicios = Servicios.findAllWhere(usuarios: it)
            def servicio = DetalleServicio.findAllWhere(usuarios: it)
            def detal = SecAppUserSecAppRole.findAllBySecAppUser(it)
            mapa.usuarios = detal
            mapa.cuantos = servicios.size()
            mapa.cuanto=servicio.size()
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
    def eliminarCita()
    {        
        def eliminarcitadetalle=Servicios.get(params.id as long)
        def consultar=DetalleServicio.findAllWhere(servicios:eliminarcitadetalle)
        consultar[0].delete(flush:true)
        def eliminarcitaservicio=Servicios.get(params.id as long)
        eliminarcitaservicio.delete(flush:true)
        redirect(action: "citasUsuario")        
    }
    def reagendarCita()
    {
        def rol = SecAppRole.findByAuthority("ROLE_MECANICO")
        def usuario = SecAppUserSecAppRole.findAllBySecAppRole(rol)   
        def consultarreagendacion=Servicios.get(params.id as long)
        [consultarreagendacion:consultarreagendacion,usuario:usuario,tiposervicios: Tiposervicio.findAll(),]   
    }
    def guardarReagendacion(){
        def usuarios = springSecurityService.currentUser
        def modificarservicio = Servicios.get(params.id as long)
        if(params.selectusu !=0 as long ) {
            modificarservicio.comentariosNuevoUsuario=params.comentariosNuevoUsuario
            modificarservicio.horaServicio=params.horaServicio
            modificarservicio.diaServicio=params.diaServicio
            modificarservicio.estatus='reagendar'
            modificarservicio.usuarios=SecAppUser.get(params.selectusu as long)
            modificarservicio.save(flush:true) 
            def bitacoraservicioreagendado= new Bitacora()
            bitacoraservicioreagendado. nombreUsuario=springSecurityService.currentUser 
            bitacoraservicioreagendado.diaServicio=params.diaServicio
            bitacoraservicioreagendado.horaServicio=params.horaServicio
            bitacoraservicioreagendado.folio=params.folio
            bitacoraservicioreagendado.observacionesMecanico='Servicio Reagendado'
            bitacoraservicioreagendado.marca=Marca.get(params.marcas as long )
            bitacoraservicioreagendado.automovil=Automovil.get(params.automovils as long )
            bitacoraservicioreagendado.tiposervicio=Tiposervicio.get(params.tiposervicios as long )
            bitacoraservicioreagendado.estatus='reagendar'
            bitacoraservicioreagendado.usuarios =SecAppUser.get(params.selectusu as long)
            bitacoraservicioreagendado.comentariosUsuario =params.comentariosNuevoUsuario
            bitacoraservicioreagendado.save(flush:true)   
        }
        else {
            modificarservicio.comentariosNuevoUsuario=params.comentariosNuevoUsuario
            modificarservicio.horaServicio=params.horaServicio
            modificarservicio.diaServicio=params.diaServicio
            modificarservicio.estatus='reagendar' 
            modificarservicio.usuarios=SecAppUser.get(params.selectusu as long)
            modificarservicio.save(flush:true) 
            def bitacoraservicioreagendados= new Bitacora()
            bitacoraservicioreagendados. nombreUsuario=springSecurityService.currentUser 
            bitacoraservicioreagendados.diaServicio=params.diaServicio
            bitacoraservicioreagendados.horaServicio=params.horaServicio
            bitacoraservicioreagendados.observacionesMecanico='Servicio Reagendado'
            bitacoraservicioreagendados.marca=Marca.get(params.marcas as long )
            bitacoraservicioreagendados.automovil=Automovil.get(params.automovils as long )
            bitacoraservicioreagendados.tiposervicio=Tiposervicio.get(params.tiposervicios as long )
            bitacoraservicioreagendados.estatus='reagendar'
            bitacoraservicioreagendados.fechaterminacion = new Date() 
            bitacoraservicioreagendados.usuarios =SecAppUser.get(params.selectusu as long)
            bitacoraservicioreagendados.comentariosUsuario =params.comentariosNuevoUsuario
            bitacoraservicioreagendados.save(flush:true)                
        }
        redirect(action: "citasUsuario")
    }    
    def hacerReagendacion(){  
        def consultarreagendacion=Servicios.get(params.id as long)
        def consultarserviciodetallereagendacion=DetalleServicio.findAllWhere(servicios:consultarreagendacion)
        def consultarsoloesefolio=s
        // def consultaranterirormecanico=Bitacora.findAllByEstatus("terminado")
         //  def consultaranterioresusuario=Bitacora.findAllByEstatus("pendiente")

       
       // [consultaranterirormecanico:consultaranterirormecanico,consultarserviciodetallereagendacion:consultarserviciodetallereagendacion]
    }
    def guardarReagendacionTerminada(){
        println params
    }
    
}
