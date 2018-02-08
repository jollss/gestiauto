package gestion

class Marcas {

    String nombreMarca

    static mapping= {
        id generate  : 'sequence', column:'id_marca', params:[sequence:'marca']
    }
}
