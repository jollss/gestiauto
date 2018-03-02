package gestion

import grails.converters.JSON
import grails.converters.XML

class PedidoController {

    static allowedMethods = [guardaRefaccion: 'POST', eliminaRefaccion: 'POST', consultaRefacciones: 'GET']
    def objArrayRefacciones = []
    def objPedidoGral = new Pedido()

    def index() {
        redirect(controller: "pedido", action: "listaPedidos")
    }

    /**
     * [Flujo/Flow]     pedirRefaccionFlow
     * [Estado/State]   refaccionPorDemanda
     * [Estado/State]   refaccionPorSiniestro
     */
    def pedirRefaccionFlow = {
        refaccionPor {

            //Demanda
            on("submitPorDemanda") {
                println("Eliminando...")
                if (objArrayRefacciones.removeIf { it instanceof Refaccion }) {
                    println "Se elimino"
                } else {
                    println "No se elimino"
                }
                try {
                    println objArrayRefacciones[0]
                } catch (Exception e) {
                    println e
                }
                def fechaActual = new Date()

                def validFields = ["tipoPedido", "folioPedido", "create_at"]
                def temBindData = [tipoPedido: "Por demanda", folioPedido: params.folio, create_at: fechaActual]
                bindData(objPedidoGral, temBindData, [include: validFields])

                flow.pedidoGral = new Pedido()
                bindData(flow.pedidoGral, temBindData, [include: validFields])

                println("\n\n| 1. Tiene: " + flow.pedidoGral.tipoPedido + " \n| 1.1Mem: " + objPedidoGral.tipoPedido)
            }.to "detallesRefaccionPorDemanda"

            //Siniestro
            on("submitPorSiniestro") { Refaccion objRefaccion ->
                println("Eliminando...")
                if (objArrayRefacciones.removeIf { it instanceof Refaccion }) {
                    println "Se elimino"
                } else {
                    println "No se elimino"
                }
                try {
                    println objArrayRefacciones[0]
                } catch (Exception e) {
                    println e
                }
                def fechaActual = new Date()

                def validFieldsPedido = ["tipoPedido", "folioPedido", "create_at"]
                def temBindData = [tipoPedido: "Por siniestro", folioPedido: params.folio, create_at: fechaActual]

                bindData(objPedidoGral, temBindData, [include: validFieldsPedido])

                flow.pedidoGral = new Pedido()
                bindData(flow.pedidoGral, temBindData, [include: validFieldsPedido])

                println("\n\n| 1. Tiene: " + flow.pedidoGral.tipoPedido + " \n| 1.1Mem: " + objPedidoGral.tipoPedido)

                flow.refacciones = new Refaccion()
                flow.refacciones.pedido = objPedidoGral


            }.to "detallesRefaccionPorSiniestro"

        }
        detallesRefaccionPorDemanda {

            //Detalle
            on("submitDetalle") {
                println("Refacciones:")
                flow.refacciones = objArrayRefacciones.findAll()
                println("\n\n| Refacciones: " + flow.refacciones)
                println("\n\n| 2. Tiene: " + flow.pedidoGral)
            }.to "resumenPeticion"

            //Regresar
            on("submitRegresar") {
                //flow.clear()
            }.to "refaccionPor"
        }
        detallesRefaccionPorSiniestro {

            //Detalle
            on("submitDetalle") {
                println("Params: " + params)
                def validFields = ["nombreRefaccion", "precioRefaccion", "modeloRefaccion", "tempIdRefaccion"]
                println("\n\n| 2. Tiene: " + flow.refacciones)
                if (flow.refacciones != null) {
                    bindData(flow.refacciones, params, [include: validFields])
                    println("\nPedido: " + flow.refacciones.tempIdRefaccion)
                } else {
                    println("\n\n Flow no tiene valores")
                }
            }.to "resumenPeticion"

            //Regresar
            on("submitRegresar") {
                //flow.clear()
            }.to "refaccionPor"
        }
        resumenPeticion {
            on("submitGuardarPedido") {

                try {

                    println("Guardando sig:\n" +
                            "Folio: " + flow.refacciones.pedido.folioPedido +
                            "\nTemp ID: " + flow.refacciones.tempIdRefaccion +
                            "\nNombre: " + flow.refacciones.nombreRefaccion +
                            "\nModelo: " + flow.refacciones.modeloRefaccion +
                            "\nPrecio: " + flow.refacciones.precioRefaccion +
                            "\nTipo: " + flow.refacciones.pedido.tipoPedido +
                            "\nNombre: " + flow.refacciones.pedido.create_at)

                    /** *******************************************************************************/

                    def objFlujoPedido = new Pedido(tipoPedido: flow.pedidoGral.tipoPedido, folioPedido: flow.pedidoGral.folioPedido, create_at: flow.pedidoGral.create_at)
                    println("Guarda Pedido")
                    objFlujoPedido.save()
                    def objPedidoFind = Pedido.last(sort: 'id')
                    if (objArrayRefacciones.size() <= 0) {
                        println("Guarda uno...")
                        def objFlujoRefaccion = new Refaccion(pedido: objPedidoFind, nombreRefaccion: flow.refacciones.nombreRefaccion, modeloRefaccion: flow.refacciones.modeloRefaccion, precioRefaccion: flow.refacciones.precioRefaccion, tempIdRefaccion: flow.refacciones.tempIdRefaccion)
                        objFlujoRefaccion.save(flush: true)
                        if (!objFlujoRefaccion.save(flush: true)) {
                            objFlujoRefaccion.errors.allErrors.each {
                                println it
                            }
                        }
                    } else {
                        /** *************************************************************************/
                        println("Guarda arreglo...")
                        for (int i = 0; i < objArrayRefacciones.size(); i++) {
                            println("For Modelo: " + objArrayRefacciones.get(i).modeloRefaccion)
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

            }.to "terminaPeticion"
            //Regresar
            on("submitRegresar") {
                //flow.clear()
            }.to "refaccionPor"

        }
        terminaPeticion {
            redirect(controller: "pedido", action: "listaPedidos")
        }
    }

    def listaPedidos() {
        def listPedidos = Pedido.list()
        def listRefacciones = Refaccion.list()
        return ["refacciones": listRefacciones, "pedidos": listPedidos]
    }

    def guardaRefaccion() {
        //println("Recibi: " + params)
        def validFields = ["tempIdRefaccion", "nombreRefaccion", "precioRefaccion", "modeloRefaccion"]

        Refaccion objRefaccion = new Refaccion()

        println "Obj: " + objRefaccion.nombreRefaccion
        bindData(objRefaccion, params, [include: validFields])
        objRefaccion.pedido = objPedidoGral
        println "ObjBind: " + objRefaccion.nombreRefaccion

        objArrayRefacciones.add(objRefaccion)
        println(objArrayRefacciones.findAll())
    }

    def eliminaRefaccion() {
        println("Recibi: " + params)
        def idELiminar = params.tempIdRefaccion as Integer
        if (objArrayRefacciones.removeIf { it.tempIdRefaccion == idELiminar }) {
            println "Se elimino"
        } else {
            println "No se elimino"
        }
        println(objArrayRefacciones.findAll())
    }

    def consultaRefacciones() {
        //println "Consultando..."
        def objArrayRefacciones = objArrayRefacciones.findAll()
        def object = [objArrayRefacciones: objArrayRefacciones]
        withFormat {
            html { object }
            json { render object as JSON }
            xml { render object as XML }
        }
        //println object as JSON
        render object as JSON
    }

    def consultaPedido(long id){
        def pedido = Pedido.get(id)
        def refacciones = pedido.refacciones
        def arr = pedido.refacciones.precioRefaccion
        def precioTotal=0
        for (int i = 0; i < arr.size(); i++) {
            precioTotal += arr[i]
        }
        ["pedido":pedido, 'refacciones': refacciones, 'precioTotal':precioTotal]
    }
}
