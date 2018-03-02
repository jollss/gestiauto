package gestion

class Marca {
    String nombreMarca
    static hasMany = [automoviles: Automovil]
}
