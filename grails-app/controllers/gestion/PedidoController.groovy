package gestion

import grails.converters.JSON
import grails.converters.XML

/**
 * Controla el flujo de información entre la vista y el modelo de Pedido
 */
class PedidoController {
    // Definición de tipo de métodos para que puedan ser utilizados mediante AJAX.
    static allowedMethods = [guardaRefaccion: 'POST', eliminaRefaccion: 'POST', consultaRefacciones: 'GET']

    // Definición de variables para almacenar datos en memoria.
    def objArrayRefacciones = []
    def objPedidoGral = new Pedido()

    /**
     * pedirRefaccionFlow: Uso de el plugin Web Flow.
     * -- Crea un flujo para realizar pedidos, tiene dos opciones de manera visual,
     *    por 'demanda' o 'siniestro'.
     */
    def pedirRefaccionFlow = {
        refaccionPor {

            //Demanda
            on("submitPorDemanda") {

                // Elimina todos los datos en el arreglo
                if (objArrayRefacciones.removeIf { it instanceof Refaccion }) {
                    println "Se elimino"
                } else {
                    println "No se elimino"
                }

                // Crea objeto Pedido, sera utilizado durante el flujo.
                def fechaActual = new Date()

                // Declara solo las variables que seran obtenidas de 'params'.
                def validFields = ["tipoPedido", "folioPedido", "create_at"]

                def temBindData = [tipoPedido: "Por demanda", folioPedido: params.folio, create_at: fechaActual]
                bindData(objPedidoGral, temBindData, [include: validFields])

                // Pasa los valores del flujo en memoria a la memoria del flujo.
                flow.pedidoGral = new Pedido()
                bindData(flow.pedidoGral, temBindData, [include: validFields])

            }.to "detallesRefaccionPorDemanda" // Redirecciona a la vista de refacciones por demanda.

            //Siniestro
            on("submitPorSiniestro") { Refaccion objRefaccion ->

                // Elimina todos los datos en el arreglo
                if (objArrayRefacciones.removeIf { it instanceof Refaccion }) {
                    println "Se elimino"
                } else {
                    println "No se elimino"
                }

                // Crea objeto Pedido, sera utilizado durante el flujo.
                def fechaActual = new Date()

                // Declara solo las variables que seran obtenidas de 'params'.
                def validFieldsPedido = ["tipoPedido", "folioPedido", "create_at"]

                // Declara solo las variables que seran obtenidas de 'params'.
                def temBindData = [tipoPedido: "Por siniestro", folioPedido: params.folio, create_at: fechaActual]
                bindData(objPedidoGral, temBindData, [include: validFieldsPedido])

                // Pasa los valores del flujo en memoria a la memoria del flujo.
                flow.pedidoGral = new Pedido()
                bindData(flow.pedidoGral, temBindData, [include: validFieldsPedido])

                // Crea un objeto de tipo Refaccion que será utilizado en la memoria del flujo.
                flow.refacciones = new Refaccion()
                flow.refacciones.pedido = objPedidoGral

            }.to "detallesRefaccionPorSiniestro" // Redirecciona a la vista de refacciones por siniestro.

        }
        detallesRefaccionPorDemanda {

            //Detalle
            on("submitDetalle") {

                // Carga todos nuestros objetos de Refacciones en memoria, a la memoria del flujo.
                flow.refacciones = objArrayRefacciones.findAll()

            }.to "resumenPeticion" // Redirecciona a la vista de resumen.

            //Regresar
            on("submitRegresar") {
                //flow.clear()
            }.to "refaccionPor" // Redirecciona a la primer vista.
        }
        detallesRefaccionPorSiniestro {

            //Detalle
            on("submitDetalle") {

                // Declara solo las variables que seran obtenidas de 'params'.
                def validFields = ["nombreRefaccion", "precioRefaccion", "modeloRefaccion", "tempIdRefaccion"]

                // Si encuentra el objeto en memoria le agrega los datos en 'params'.
                if (flow.refacciones != null) {
                    bindData(flow.refacciones, params, [include: validFields])
                } else {
                    println("\n\nFlow no tiene valores")
                }
            }.to "resumenPeticion" // Redirecciona a la vista de resumen.

            //Regresar
            on("submitRegresar") {
                //flow.clear()
            }.to "refaccionPor" // Redirecciona a la primer vista.
        }
        resumenPeticion {
            on("submitGuardarPedido") {
                try {

                    //Obtiene valores del flujo y los asigna a un nuevo objeto para guardarlo.
                    def objFlujoPedido = new Pedido(tipoPedido: flow.pedidoGral.tipoPedido, folioPedido: flow.pedidoGral.folioPedido, create_at: flow.pedidoGral.create_at)
                    objFlujoPedido.save()

                    // Ordena por id y busca el ultimo registro.
                    def objPedidoFind = Pedido.last(sort: 'id')

                    // Valida si el arreglo tiene más de 1 registro de objeto Refaccion, si es así recorre el arreglo y los guarda en la base de datos.
                    if (objArrayRefacciones.size() <= 0) {

                        // Crea objeto Refaccion y lo guarda en la base de datos.
                        def objFlujoRefaccion = new Refaccion(pedido: objPedidoFind, nombreRefaccion: flow.refacciones.nombreRefaccion, modeloRefaccion: flow.refacciones.modeloRefaccion, precioRefaccion: flow.refacciones.precioRefaccion, tempIdRefaccion: flow.refacciones.tempIdRefaccion)
                        objFlujoRefaccion.save(flush: true)

                    } else {

                        // Recorre el arreglo y almacena sus objetos en base de datos.
                        for (int i = 0; i < objArrayRefacciones.size(); i++) {

                            // Crea objeto a partir de los valores en el arreglo, lo almacena en la base de datos.
                            def objFlujoRefacFor = new Refaccion(pedido: objPedidoFind,
                                    nombreRefaccion: objArrayRefacciones.get(i).nombreRefaccion,
                                    modeloRefaccion: objArrayRefacciones.get(i).modeloRefaccion,
                                    precioRefaccion: objArrayRefacciones.get(i).precioRefaccion,
                                    tempIdRefaccion: objArrayRefacciones.get(i).tempIdRefaccion)
                            objFlujoRefacFor.save(flush: true)

                        }
                    }
                } catch (Exception e) {
                    log.info("Error guardando: " + e)
                }

            }.to "terminaPeticion" // Redirecciona a terminaPeticion
            //Regresar
            on("submitRegresar") {
                //flow.clear()
            }.to "refaccionPor" // Redirecciona a la primer vista.

        }
        terminaPeticion {
            // Termina el flujo y redirecciona a la lista de los pedidos.
            redirect(controller: "pedido", action: "listaPedidos")
        }
    }

    /**
     * listaPedidos:
     * -- Consulta registros del domain Pedido y Refaccion en la BD y los retorna como modelo, en la vista listaPedidos.
     * @return render con vista y modelos.
     */
    def listaPedidos() {
        def listPedidos = Pedido.list()
        def listRefacciones = Refaccion.list()
        ["refacciones": listRefacciones, "pedidos": listPedidos]
    }

    def guardaRefaccion() {

        // Declara solo las variables que seran obtenidas de 'params'.
        def validFields = ["tempIdRefaccion", "nombreRefaccion", "precioRefaccion", "modeloRefaccion"]

        // Crea el objeto y agrega valores de 'params'.
        Refaccion objRefaccion = new Refaccion()
        bindData(objRefaccion, params, [include: validFields])

        // Copia los datos de objPedidoGral al objeto, esto para mantener la relación.
        objRefaccion.pedido = objPedidoGral

        // Agrega el objeto a nuestra lista de objetos.
        objArrayRefacciones.add(objRefaccion)
    }

    /**
     * eliminaRefaccion:
     * -- Recibe el parámetro de ID, para buscar en nuestro arreglo de refacciones en memoria y eliminarlo.
     * @return
     */
    def eliminaRefaccion() {

        // Define una variable temporal que sera utilizada para la eliminación de nuestro objeto.
        def idELiminar = params.tempIdRefaccion as Integer

        //Busca y elimina el objeto en el arreglo.
        if (objArrayRefacciones.removeIf { it.tempIdRefaccion == idELiminar }) {
            println "Se elimino"
        } else {
            println "No se elimino"
        }
    }

    /**
     * consultaRefacciones:
     * -- Consulta todos nuestros registros en memoria almacenados en el arreglo de Refacciones y los
     *    regresa en formato JSON.
     * @return render con valores en formato JSON.
     */
    def consultaRefacciones() {
        // Obtiene todos los valores en memoria del arreglo de Refacciones y los almacena en una variable temporal
        def objArrayRefacciones = objArrayRefacciones.findAll()

        // Define un objeto y conversiones html/json/xml
        def object = [objArrayRefacciones: objArrayRefacciones]
        withFormat {
            html { object }
            json { render object as JSON }
            xml { render object as XML }
        }

        // Regresa el objeto con los datos y los convierte a JSON.
        render object as JSON
    }

    /**
     * consultaPedido:
     * -- Recibe parámetro ID y lo usa para realizar una consulta en la base de datos de Pedido.
     * @param id Parámetro necesario para la consulta individual del registro.
     * @return regresa modelos resultado de la consulta.
     */
    def consultaPedido(long id) {
        // Obtiene registro pedido de la base de datos, mediante el ID.
        def pedido = Pedido.get(id)
        def refacciones = pedido.refacciones
        def arr = pedido.refacciones.precioRefaccion
        def precioTotal = 0

        // Recorre en busca de los precios por refacción y hace una suma total.
        for (int i = 0; i < arr.size(); i++) {
            precioTotal += arr[i]
        }

        // Regresa modelos resultado de la consulta.
        ["pedido": pedido, 'refacciones': refacciones, 'precioTotal': precioTotal]
    }
}
