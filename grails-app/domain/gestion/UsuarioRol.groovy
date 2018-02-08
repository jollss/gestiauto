package gestion

class UsuarioRol {
    
    Usuario usuario
    Rol rol
    
    static mapping= {
        id generate  : 'sequence', column:'id_usurol', params:[sequence:'usuario_roles ']
    }
}
