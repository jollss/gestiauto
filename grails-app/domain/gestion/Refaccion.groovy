package gestion

class Refaccion {

    String nombreRefaccion
    double precioRefaccion
    String tipoPedido

    static mapping= {
        id generate  : 'sequence', column:'id_refaccion', params:[sequence:'refaccion']
    }
}

