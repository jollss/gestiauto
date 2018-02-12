package gestion
import grails.plugin.springsecurity.annotation.Secured

<<<<<<< refs/remotes/origin/master

<<<<<<< HEAD
@Secured(['ROLE_MECANICO'])
class MarcasController {

   
=======
import grails.plugin.springsecurity.annotation.Secured


class MarcasController {

=======
import grails.plugin.springsecurity.annotation.Secured


class MarcasController {

>>>>>>> angel-dev
    /**
     * Lista todas las marcas que existen en la base de datos.
     * @param id
     * @return
     */
    @Secured(['ROLE_ADMIN'])
<<<<<<< HEAD
>>>>>>> Sintaxis / @Secured
=======
>>>>>>> angel-dev
    def index (long id) {
        def listadomarca = Marcas.list()
        return ["marcas":listadomarca]
    }
   
    @Secured(['ROLE_ADMIN'])
    def guardarmarca(){}

    @Secured(['ROLE_ADMIN'])
    def save() {
        def marca = new Marcas(params)
        marca.save()
        redirect (action:"index",id:marca.id)
    }
  
    @Secured(['ROLE_ADMIN'])
    def eliminar(long id)
    {
        def marca=Marcas.get(params.id as long )
        marca.delete(flush:true)
        redirect (action:"index")
    }
  
<<<<<<< HEAD
<<<<<<< refs/remotes/origin/master
 
      def marca=Marcas.get(id)
     [marca:marca]
  }
  def guardar(long id)
  {
       def marca=Marcas.get(id)
    
      marca.nombreMarca = params.nombre
     
         marca.save(flush:true) 
   
=======
=======
>>>>>>> angel-dev
    @Secured(['ROLE_ADMIN'])
    def modificarmarca(long id)
    {
        def marca=Marcas.get(id)
        [marca:marca]
    }
  
    @Secured(['ROLE_ADMIN'])
    def guardar(long id)
    {
        def marca=Marcas.get(id)
        marca.nombreMarca = params.nombre
        marca.save(flush:true) 
<<<<<<< HEAD
>>>>>>> Sintaxis / @Secured
=======
>>>>>>> angel-dev
        redirect (action:"index")
    }
  
}



