package gestion

class RefaccionController {


    /*
     refaccionPor{
            println 'Estado 1'
            on("submitPorDemanda"){ Refaccion objRefaccion ->
                println("Dem: " + objRefaccion.tipoPedido)
                //flow.objRefaccion = objRefaccion
            }.to "detallesRefaccionPorDemanda"
            on("submitPorSiniestro"){ Refaccion objRefaccion ->
                println("Sin: " + objRefaccion.tipoPedido)
                //flow.objRefaccion = objRefaccion
            }.to "detallesRefaccionPorSiniestro"
        }
     */

    def index() { }

    /**
     * [Flujo/Flow]     pedirRefaccionFlow
     * [Estado/State]   refaccionPorDemanda
     * [Estado/State]   refaccionPorSiniestro
     */
    def pedirRefaccionFlow ={
        refaccionPor{

            //Demanda
            on("submitPorDemanda"){ Refaccion objRefaccion ->
                println("Dem: " + objRefaccion.tipoPedido)
                flow.refaccion = new Refaccion()
                flow.refaccion = objRefaccion
                println("\n\n 1. Tiene: ${flow.refaccion.dump()}")
            }.to "detallesRefaccionPorDemanda"

            //Siniestro
            on("submitPorSiniestro"){ Refaccion objRefaccion ->
                println("Sin: " + objRefaccion.tipoPedido)
                flow.refaccion = new Refaccion()
                flow.refaccion = objRefaccion
                println("\n\n 1. Tiene: ${flow.refaccion.dump()}")
            }.to "detallesRefaccionPorSiniestro"

        }
        detallesRefaccionPorDemanda{

            //Detalle
            on("submitDetalle"){
                println("Params: " + params)
                def validFields = ["nombreRefaccion", "precioRefaccion"]
                println("\n\n 2. Tiene: ${flow.refaccion.dump()}")
                bindData(flow.refaccion, params,  [include: validFields])
            }.to "resumenPeticion"

            //Regresar
            on("submitRegresar"){
                //flow.clear()
            }.to "refaccionPor"
        }
        detallesRefaccionPorSiniestro{

            //Detalle
            on("submitDetalle"){
                println("Params: " + params)
                def validFields = ["nombreRefaccion", "precioRefaccion"]
                println("\n\n 2. Tiene: ${flow.refaccion.dump()}")
                bindData(flow.refaccion, params,  [include: validFields])
            }.to "resumenPeticion"

            //Regresar
            on("submitRegresar"){
                //flow.clear()
            }.to "refaccionPor"
        }
        resumenPeticion{
        }
    }
}
