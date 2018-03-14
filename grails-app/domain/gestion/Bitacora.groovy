package gestion
import gestion.secureapp.SecAppUser
class Bitacora {
    String observacionesMecanico
    String estatus
    String comentariosUsuario
    String diaServicio
    String horaServicio
    Marca marca
    Automovil automovil
    SecAppUser usuarios
    Tiposervicio tiposervicio
    Date  fechaterminacion
    SecAppUser nombreUsuario   
    String folio
     static constraints = {
        fechaterminacion         nullable: true     
        folio                    nullable: true    
    }
}
