package gestion

class Automovil {
    
    String nombreAuto
    static belongsTo = [marcas: Marcas]
    
    static mapping= {
        id generate  : 'sequence', column:'id_auto', params:[sequence:'automoviles']
    }
}