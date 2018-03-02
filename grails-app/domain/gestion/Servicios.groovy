package gestion

import gestion.secureapp.SecAppUser

class Servicios {
    
    String observacionesMecanico
    String estatus
    String comentariosUsuario
    String diaServicio
    String horaServicio
    Marca marca
    Automovil automovil
    SecAppUser usuarios
    Tiposervicio tiposervicio
    
    static mapping= {
        id generate  : 'sequence', column:'id_servicio', params:[sequence:'servicio']
    }
 
}
