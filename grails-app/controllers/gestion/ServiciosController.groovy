package gestion
<<<<<<< refs/remotes/origin/master
import com.yourapp.Usuario
import com.yourapp.UsuarioRole
import com.yourapp.Role
=======

import grails.plugin.springsecurity.annotation.Secured


>>>>>>> Sintaxis / @Secured
class ServiciosController {
    
    @Secured(['ROLE_ADMIN'])
    def index(){ 
        [servicios:Servicios.findAll("from Servicios where estatus='pendiente'")]
    }
   
    @Secured(['ROLE_ADMIN'])
    def hacerservicio(long id){  
        def servicios=Servicios.get(id )
        [servicios:servicios]
    }
   
    @Secured(['ROLE_ADMIN'])
    def save(long id)
    {
        def servicios=Servicios.get(id)
        servicios.observacionesMecanico = params.observaciones
        servicios.estatus = params.estatus
        servicios.save(flush:true) 
        redirect (action:"index")
    }
  
<<<<<<< refs/remotes/origin/master
  def crearcita(){
    [marcas:Marcas.findAll(),automoviles:Automovil.findAll(),tiposervicios:Tiposervicio.findAll()
          ,usuarios:Usuario.findAll(),usuariosrol:UsuarioRole.findAll("from UsuarioRole where role_id=2")]
         

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
    p.usuario = Usuario.get(params.selectusu as long) 
         if(p.save(flush:true)){
             println "8====================DDDDDDDD"
         }else{
             println "No se guardo nada vale chetos la vida "
         }
   }
   def citaterminada()
   {
       
=======
    @Secured(['ROLE_ADMIN'])
    def crearcita(){
        [marcas:Marcas.findAll(),automoviles:Automovil.findAll(),tiposervicios:Tiposervicio.findAll()
            ,usuarios:Usuario.findAll(),usuariosrol:UsuarioRol.findAll("from UsuarioRol where rol_id=2")]
    }
   
    @Secured(['ROLE_ADMIN'])
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
        p.usuario = Usuario.get(params.selectusu as long) 
        if(p.save(flush:true)){
            println ""
        }else{
            println "No se guardo nada vale chetos la vida "
        }
    }
   
    @Secured(['ROLE_ADMIN'])
    def citaterminada()
    {
>>>>>>> Sintaxis / @Secured
        [servicios:Servicios.findAll("from Servicios where estatus='terminado'")]
    }
   
    @Secured(['ROLE_ADMIN'])
    def delete(long id)
    {
        def servicios=Servicios.get(params.id as long )
        servicios.delete(flush:true)
        redirect (action:"citaterminada")
    }
}

