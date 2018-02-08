package gestion

import grails.plugin.springsecurity.annotation.Secured


class AutomovilController {
    @Secured(['ROLE_ADMIN'])
    def index() { 
        [automoviles:Automovil.findAll()]

       
    }
    def guardarauto()
    {
       
        def auto = new Automovil(params)
      
       auto.save(flush:true)
     
        
    }
     def eliminar(long id)
  {
    
      def auto=Automovil.get(params.id as long )
    
      auto.delete(flush:true)
   
       redirect (action:"index")
  }
  def modificarauto(long id )
  {
       println id 
 
      def auto=Automovil.get(id)
     [auto:auto]
  }
   def guardar(long id)
  {
      
 
            def auto=Automovil.get(id)
 
      auto.nombreAuto = params.nombre
       
         auto.save(flush:true) 
     
        redirect (action:"index")
    }
}
    