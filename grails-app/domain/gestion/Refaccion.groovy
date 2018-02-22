package gestion

class Refaccion implements Serializable {

    String nombreRefaccion
    String modeloRefaccion
    double precioRefaccion
    static belongsTo = [pedido: Pedido]

}

