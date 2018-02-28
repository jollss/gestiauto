package gestion

class Refaccion implements Serializable {

    int tempIdRefaccion
    String nombreRefaccion
    String modeloRefaccion
    double precioRefaccion
    static belongsTo = [pedido: Pedido]

}

