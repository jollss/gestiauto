package gestion

class Automovil {

    String nombreAuto
    static belongsTo = [marcas: Marca]

    static mapping = {
        id generate: 'sequence', column: 'id_auto', params: [sequence: 'automoviles']
    }
}