package gestion

import com.yourapp.Usuario

class Servicios {
    
    String observacionesMecanico
    String estatus
    String comentariosUsuario
    String diaServicio
    String horaServicio
    Marcas marca 
    Automovil automovil
    Usuario usuario
    Tiposervicio tiposervicio
    
    static mapping= {
        id generate  : 'sequence', column:'id_servicio', params:[sequence:'servicio']
    }
 
}
