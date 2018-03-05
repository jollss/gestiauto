package gestion

class Marca {
    String nombreMarca
    static hasMany = [automoviles: Automovil]

    static mapping= {
        id generate  : 'sequence', column:'id_marca', params:[sequence:'marcas']
    }
}
