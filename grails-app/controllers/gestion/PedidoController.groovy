package gestion

import grails.converters.JSON
import grails.converters.XML

class PedidoController {

    static allowedMethods = [guardaRefaccion:'POST', eliminaRefaccion: 'POST',consultaRefacciones:'GET']
    def objArrayRefacciones = []
    def objPedidoGral = new Pedido()

    def index() {
        def listPedidos = Pedido.list()
        def listRefacciones = Refaccion.list()
        return ["refacciones":listRefacciones, "pedidos": listPedidos]
    }

    /**
     * [Flujo/Flow]     pedirRefaccionFlow
     * [Estado/State]   refaccionPorDemanda
     * [Estado/State]   refaccionPorSiniestro
     */
    def pedirRefaccionFlow ={
        refaccionPor{

            //Demanda
            on("submitPorDemanda"){
                //println("Params: " + params +"\n")
                println("Eliminando...")
                //objArrayRefacciones.removeAll(flush: true)
                //objArrayRefacciones.removeIf { it instanceof Refaccion }
                if (objArrayRefacciones.removeIf { it instanceof Refaccion }){
                    println "Se elimino"
                }else {
                    println "No se elimino"
                }
                try {
                    println objArrayRefacciones[0]
                }catch (Exception e){
                    println e
                }

                objPedidoGral = null
                def fechaActual = new Date()
                def objRefaccionDem = new Refaccion()
                objPedidoGral = new Pedido(tipoPedido: "Por demanda", folioPedido: params.folio, create_at: fechaActual)
                objRefaccionDem.pedido = new Pedido(tipoPedido: "Por demanda", folioPedido: params.folio, create_at: fechaActual)
                flow.refaccion = new Refaccion()
                flow.refaccion = objRefaccionDem
                println("\n\n| 1. Tiene: " + flow.refaccion.pedido)
            }.to "detallesRefaccionPorDemanda"

            //Siniestro
            on("submitPorSiniestro"){ Refaccion objRefaccion ->
                println("Params: " + params +"\n")
                def fechaActual = new Date()
                def objRefaccionDem = new Refaccion()
                objRefaccionDem.pedido = new Pedido(tipoPedido: "Por siniestro", folioPedido: params.folio, create_at: fechaActual)
                flow.refaccion = new Refaccion()
                flow.refaccion = objRefaccionDem
                println("\n\n| 1. Tiene: " + flow.refaccion.pedido)
            }.to "detallesRefaccionPorSiniestro"

        }
        detallesRefaccionPorDemanda{

            //Detalle
            on("submitDetalle"){
                //println("Params: " + params)
                def validFields = ["nombreRefaccion", "precioRefaccion", "modeloRefaccion"]
                println("\n\n| 2. Tiene: " + flow.refaccion)
                if(flow.refaccion != null){
                    bindData(flow.refaccion, params,  [include: validFields])
                }else {
                    println("\n\n Flow no tiene valores")
                }
            }.to "resumenPeticion"

            //Regresar
            on("submitRegresar"){
                //flow.clear()
            }.to "refaccionPor"
        }
        detallesRefaccionPorSiniestro{

            //Detalle
            on("submitDetalle"){
                //println("Params: " + params)
                def validFields = ["nombreRefaccion", "precioRefaccion", "modeloRefaccion"]
                println("\n\n| 2. Tiene: " + flow.refaccion)
                if(flow.refaccion != null){
                    bindData(flow.refaccion, params,  [include: validFields])
                }else {
                    println("\n\n Flow no tiene valores")
                }
            }.to "resumenPeticion"

            //Regresar
            on("submitRegresar"){
                //flow.clear()
            }.to "refaccionPor"
        }
        resumenPeticion{
            on("submitGuardarPedido"){
                println("\n\n| 3. Tiene: " + flow.refaccion)
                def tempFolio = flow.refaccion.pedido.folioPedido
                def tempTipoPedido = flow.refaccion.pedido.tipoPedido
                def tempNombreRefaccion = flow.refaccion.nombreRefaccion
                def tempModeloRefaccion = flow.refaccion.modeloRefaccion
                def tempPrecioRefaccion = flow.refaccion.precioRefaccion
                def tempFechaActual = new Date()

                def objFlujoPedido = new Pedido(tipoPedido: tempTipoPedido, folioPedido: tempFolio, create_at: tempFechaActual)
                objFlujoPedido.save()
                def objPedidoFind = Pedido.last(sort: 'id')
                def objFlujoRefaccion = new Refaccion(pedido: objPedidoFind, nombreRefaccion: tempNombreRefaccion, modeloRefaccion: tempModeloRefaccion,  precioRefaccion: tempPrecioRefaccion)
                try {

                    println("Guardando...\n" +
                            "Folio: " + objFlujoRefaccion.pedido.folioPedido +
                            "\nTipo: " + objFlujoRefaccion.pedido.tipoPedido +
                            "\nNombre: " + objFlujoRefaccion.nombreRefaccion +
                            "\nPrecio: " + objFlujoRefaccion.precioRefaccion)

                    println("1 A guardar: " + objFlujoRefaccion)
                    objFlujoRefaccion.save(flush:true)
                    if (!objFlujoRefaccion.save(flush:true)) {
                        objFlujoRefaccion.errors.allErrors.each {
                            println it
                        }
                    }
                    println("2 A guardar: " + objFlujoRefaccion)
                }catch (Exception e){
                    log.info("Error guardando: " + e)
                }

            }.to"terminaPeticion"

        }
        terminaPeticion{
            redirect(controller: "pedido", action: "listaPedidos")
        }
    }

    def listaPedidos(){
        def listPedidos = Pedido.list()
        def listRefacciones = Refaccion.list()
        return ["refacciones":listRefacciones, "pedidos": listPedidos]
    }

    def guardaRefaccion(){
        println("Recibi: " + params)
        def validFields = ["tempIdRefaccion", "nombreRefaccion", "precioRefaccion", "modeloRefaccion"]

        Refaccion objRefaccion = new Refaccion()

        println "Obj: " + objRefaccion.nombreRefaccion
        bindData(objRefaccion, params,  [include: validFields])
        objRefaccion.pedido = objPedidoGral
        println "ObjBind: " + objRefaccion.nombreRefaccion

        objArrayRefacciones.add(objRefaccion)
        println(objArrayRefacciones.findAll())
    }

    def eliminaRefaccion(){
        println("Recibi: " + params)
        def idELiminar = params.tempIdRefaccion as Integer
        if (objArrayRefacciones.removeIf { it.tempIdRefaccion == idELiminar }){
            println "Se elimino"
        }else {
            println "No se elimino"
        }
        println(objArrayRefacciones.findAll())
    }

    def consultaRefacciones(){

        println "Consultando..."

        def objArrayRefacciones = objArrayRefacciones.findAll()

        def object = [objArrayRefacciones: objArrayRefacciones]
        withFormat {
            html {object}
            json { render object as JSON }
            xml { render object as XML }
        }

        println object as JSON

        render object as JSON
    }
}
