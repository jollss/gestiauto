package gestion

class Tiposervicio {
    
    String nombreServicio
    
    static mapping= {
        id generate  : 'sequence', column:'id_tiposer', params:[sequence:'tiposervicios']
    }
}
