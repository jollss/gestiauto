package gestion

class PedidoController {

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
                println("Params: " + params +"\n")
                def fechaActual = new Date()
                def objRefaccionDem = new Refaccion()
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
}
