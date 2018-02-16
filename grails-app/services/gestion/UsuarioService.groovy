package gestion

import grails.transaction.Transactional

@Transactional
class UsuarioService {

    def springSecurityService

    def getTipoUsuarioActual(){
        def tipoUsuario = springSecurityService.getAuthentication().getAuthorities()
        return String.valueOf(tipoUsuario)
    }
}
