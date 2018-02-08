package gestion

class Usuario {

    String nombreUsuario
    String password
    
    static mapping= {
        id generate  : 'sequence', column:'id_usuario ', params:[sequence:'usuarios']
    }
}
