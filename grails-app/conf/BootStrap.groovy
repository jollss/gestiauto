<<<<<<< refs/remotes/origin/master
import com.yourapp.Role
import com.yourapp.Usuario
import com.yourapp.UsuarioRole
class BootStrap {

    def init = { servletContext ->
 /*  def user = new Usuario(username: 'joel', password: 'joel').save(flush:true)
   def admin = new Usuario(username: 'luis', password: 'luis').save(flush:true)
   def userRole = new Role(authority: "ROLE_MECANICO").save(flush:true)
   def adminRole = new Role(authority: "ROLE_USUARIO").save(flush:true)
   new UsuarioRole(user:user, role:userRole).save(flush:true)
   new UsuarioRole(user:admin, role:adminRole).save(flush:true)  */ 
=======

import gestion.secureapp.SecAppRole
import gestion.secureapp.SecAppUser
import gestion.secureapp.SecAppUserSecAppRole

class BootStrap {

    def init = { servletContext ->
    	def adminRole = new SecAppRole(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new SecAppRole(authority: 'ROLE_USER').save(flush: true)

		def userAdmin = new SecAppUser(username: 'admin', enabled: true, password: 'admin')
		userAdmin.save(flush: true)

		def userComun = new SecAppUser(username: 'user', enabled: true, password: 'user')
		userComun.save(flush: true)

		SecAppUserSecAppRole.create userAdmin, adminRole, true
		SecAppUserSecAppRole.create userComun, userRole, true

		assert SecAppUser.count() == 2
		assert SecAppRole.count() == 2
		assert SecAppUserSecAppRole.count() == 2
>>>>>>> Spring Security / Logout
    }
    def destroy = {
    }
}
