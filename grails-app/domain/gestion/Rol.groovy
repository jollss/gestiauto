package gestion

class Rol {

    String nombreRol
    
    static mapping= {
        id generate  : 'sequence', column:'id_rol', params:[sequence:'roles']
    }
}
