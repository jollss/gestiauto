package gestion
import gestion.secureapp.SecAppUser
import gestion.secureapp.SecAppUserSecAppRole
import gestion.secureapp.SecAppRole
class ServiciosController {
    
   
       
def index()
{     
    def usuario = springSecurityService.currentUser
def servicios = Servicios.findAllWhere(usuario:usuario,estatus:"pendiente")
 [servicios:servicios]
    }
   
   
    def hacerservicio(long id){  
        def servicios=Servicios.get(id )
        [servicios:servicios]
    }
   
   
    def save(long id)
    {
        def servicios=Servicios.get(id)
        servicios.observacionesMecanico = params.observaciones
        servicios.estatus = params.estatus
        servicios.save(flush:true) 
        redirect (action:"index")
    }
  
   
    def crearcita(){
        [marcas:Marcas.findAll(),automoviles:Automovil.findAll(),tiposervicios:Tiposervicio.findAll()
            ,usuarios:SecAppUser.findAll(),rol:SecAppUserSecAppRole.findAll("from SecAppUserSecAppRole where sec_app_role_id=1"),usuariosrol:SecAppRole.findAll()]
    }
   

    def guardar(){
        def p =  new Servicios()
        p.estatus = params.estatus
        p.comentariosUsuario = params.comentariosUsuario
        p.diaServicio = params.diaServicio
        p.horaServicio =  params.horaServicio
        p.marca = Marcas.get(params.selectmarcas as long)
        p.automovil = Automovil.get(params.selectaut as long)
        p.tiposervicio = Tiposervicio.get(params.selecttipo as long)
        p.observacionesMecanico = params.observacionesMecanico
         p.usuario = SecAppUser.get(params.selectusu as long) 
        if(p.save(flush:true)){
            println ""
        }else{
            println "No se guardo nada vale chetos la vida "
        }
    }
   
  
    def citaterminada()
    {
        [servicios:Servicios.findAll("from Servicios where estatus='terminado'")]
    }
   
  
    def delete(long id)
    {
        def servicios=Servicios.get(params.id as long )
        servicios.delete(flush:true)
        redirect (action:"citaterminada")
    }
}

