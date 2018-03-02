import gestion.secureapp.SecAppRole
import gestion.secureapp.SecAppUser
import gestion.secureapp.SecAppUserSecAppRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = new SecAppRole(authority: 'ROLE_ADMIN').save(flush: true)
        def mecanicRole = new SecAppRole(authority: 'ROLE_MECANICO').save(flush: true)
        def userRole = new SecAppRole(authority: 'ROLE_USUARIO').save(flush: true)

        def userAdmin = new SecAppUser(username: 'admin', enabled: true, password: 'admin')
        userAdmin.save(flush: true)

        def userMecanico = new SecAppUser(username: 'mecanico', enabled: true, password: 'mecanico')
        userMecanico.save(flush: true)


        def userComun = new SecAppUser(username: 'user', enabled: true, password: 'user')
        userComun.save(flush: true)

        SecAppUserSecAppRole.create userMecanico, mecanicRole, true
        SecAppUserSecAppRole.create userAdmin, adminRole, true
        SecAppUserSecAppRole.create userComun, userRole, true
    }
    def destroy = {
    }
}