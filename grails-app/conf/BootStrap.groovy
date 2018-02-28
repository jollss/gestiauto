import gestion.secureapp.SecAppRole
import gestion.secureapp.SecAppUser
import gestion.secureapp.SecAppUserSecAppRole

class BootStrap {

    def init = { servletContext ->
     /*   def adminRole = new SecAppRole(authority: 'ROLE_MECANICO').save(flush: true)
        def userRole = new SecAppRole(authority: 'ROLE_USUARIO').save(flush: true)

        def userAdmin = new SecAppUser(username: 'joel', enabled: true, password: 'joel')
        userAdmin.save(flush: true)

        def userAdminCarlos = new SecAppUser(username: 'angel', enabled: true, password: 'angel')
        userAdminCarlos.save(flush: true)

        def userComun = new SecAppUser(username: 'lili', enabled: true, password: 'lili')
        userComun.save(flush: true)

        SecAppUserSecAppRole.create userAdmin, adminRole, true
        SecAppUserSecAppRole.create userAdminCarlos, adminRole, true
        SecAppUserSecAppRole.create userComun, userRole, true*/
    }
    def destroy = {
    }
}