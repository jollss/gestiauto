package gestion

class Marcas {

    String nombreMarca
    static hasMany = [automoviles: Automovil]

    static mapping= {
        id generate  : 'sequence', column:'id_marca', params:[sequence:'marca']
    }
}
