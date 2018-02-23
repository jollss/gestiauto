package gestion


class Pedido implements Serializable {

    String folioPedido
    String tipoPedido
    Date create_at

    static hasMany = [refacciones: Refaccion]

}
