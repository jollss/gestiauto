var counter = 0;

var campoGuardado = true;
var seleccionoRefaccion = false;
var editandoRefaccion = false;


// Variables temporales a Servlet
var tempIdRefaccion = "";
var tempNombreRefaccion = "";
var tempPrecioRefaccion = "";
var tempModeloRefaccion = "";

$(document).ready(function () {

    counter = 0;
    cargaDatosTabla();
    
    $('#btnCarga').on('click', function () {
        cargaDatosTabla();
    });

    $('#btnAgregarCampo').on('click', function () {
        console.info("Agregando...")
        if (campoGuardado != false) {
            agregarFilaRefaccion();
            campoGuardado = false;
            editandoRefaccion = true;
        } else {
            console.warn("Se esta editando un campo.")
        }
    });

    $("#btnGuardarCampo").click(function () {
        console.info("Guardando...")
        if (editandoRefaccion) {
            console.log("Esta editando");
            tempIdRefaccion = $('#tempIdRefaccion').text();
            tempNombreRefaccion = $('#tempNombreRefaccion').val();
            tempPrecioRefaccion = $('#tempPrecioRefaccion').val();
            tempModeloRefaccion = $('#tempModeloRefaccion').val();
            if (tempIdRefaccion.trim() != "" && 
                tempNombreRefaccion.trim() != "" &&
                tempPrecioRefaccion.trim() != "" && 
                tempModeloRefaccion.trim() != "") {
                guardaRefaccion(tempIdRefaccion, tempNombreRefaccion, tempPrecioRefaccion, tempModeloRefaccion);
                $( "tr" ).remove( ".nuevoTR" );
                seleccionoRefaccion = false;
                editandoRefaccion = false;
                campoGuardado = true;
            }else {
                alert("Rellena todos los campos.")
            }
            
        } else if (editandoRefaccion) {
        } else {
            console.log("Error al guardar", "No se esta editando ningún campo.");
        }
    });

});


function agregarFilaRefaccion() {
    var tempCont = counter + 1;
    console.log('ID Actual: ' + counter);
    counter++;
    var row = $('<tr class="nuevoTR">')
        .append('<td id="tempIdRefaccion">' + tempCont + '</td>')
        .append('<td><input \n\
            id="tempNombreRefaccion" \n\
            name="nombreRefaccion" \n\
            class="infoNuevo" \n\
            input-sm" type="text" \n\
            autocomplete="off" \n\
            required \n\
            maxlength="30" \n\
            style="width: 99%; font-size: 100%">\n\
        </td>')
        .append('<td><input \n\
            id="tempPrecioRefaccion" \n\
            name="precioRefaccion" \n\
            class="infoNuevo" \n\
            input-sm" type="text" \n\
            autocomplete="off" \n\
            required \n\
            maxlength="30" \n\
            style="width: 99%; font-size: 100%">\n\
        </td>')
        .append('<td><input \n\
            id="tempModeloRefaccion" \n\
            name="modeloRefaccion" \n\
            class="infoNuevo" \n\
            input-sm" type="text" \n\
            autocomplete="off" \n\
            required \n\
            maxlength="30" \n\
            style="width: 99%; font-size: 100%">\n\
        </td>');
    $('#tblRefacciones tbody').prepend(row);
    $('#tblRefacciones tbody tr:first-child td:last-child').click();
}

function agregarFileValores(tempIdRefaccion, tempNombreRefaccion, tempPrecioRefaccion, tempModeloRefaccion) {
    var btnEliminar = '<button onclick="eliminaCampo(this)" type="button" class="btn btn-danger btn-sm btnEliminarCampo" data-toggle="tooltip" data-placement="top" title="Eliminar">\n' +
        '                    <i class="fas fa-ban"></i>\n' +
        '                </button>';
    var row = $('<tr class="guardoTD">')
        .append('<td class="idR'+tempIdRefaccion+'">'+tempIdRefaccion+'</td>')
        .append('<td class="nombreRefaccion">'+tempNombreRefaccion+'</td>')
        .append('<td>'+tempPrecioRefaccion+'</td>')
        .append('<td>'+tempModeloRefaccion+'</td>')
        .append('<td>'+btnEliminar+'</td>')
    $('#tblRefacciones tbody').append(row);
    $('#tblRefacciones tbody tr:first-child td:last-child').click();
}

function guardaRefaccion(tempIdRefaccion, tempNombreRefaccion, tempPrecioRefaccion, tempModeloRefaccion){
    //console.log("ID: " + tempIdRefaccion + "\nNombre: " + tempNombreRefaccion + "\nPrecio: " + tempPrecioRefaccion + "\nModelo: " + tempModeloRefaccion);
    var dataRe = {
        tempIdRefaccion : tempIdRefaccion,
        nombreRefaccion : tempNombreRefaccion,
        precioRefaccion : tempPrecioRefaccion,
        modeloRefaccion : tempModeloRefaccion
    };
    var URLControllerAlt="http://localhost:8080/gestion/pedido/guardaRefaccion";
    $.ajax({
        url: URLControllerAlt,
        type: 'POST',
        data: dataRe,
        dataType: 'json',
        traditional: true,
    })
    .done(function(msg) {
        //console.log("success " + msg);
    })
    .fail(function(msg) {
        //console.log("error " + msg);
    })
    .always(function(msg) {
        //console.log("complete: Se han enviado los datos" +msg);
        //$('#tblRefacciones').html(msg);
        agregarFileValores(tempIdRefaccion, tempNombreRefaccion, tempPrecioRefaccion, tempModeloRefaccion);
    });   
}

function eliminaRefaccion(tempIdRefaccion){
    var dataRe = {
        tempIdRefaccion : tempIdRefaccion
    };

    var URLControllerAlt="http://localhost:8080/gestion/pedido/eliminaRefaccion";

    $.ajax({
        url: URLControllerAlt,
        type: 'POST',
        data: dataRe,
        dataType: 'json',
        traditional: true,
    })
    .done(function(msg) {
        //console.log("success " + msg);
    })
    .fail(function(msg) {
        //console.log("error " + msg);
    })
    .always(function(msg) {
        //console.log("complete: Se han enviado los datos" +msg);
        //$('#tblRefacciones').html(msg);
        //agregarFileValores(tempIdRefaccion, tempNombreRefaccion, tempPrecioRefaccion, tempModeloRefaccion);
    });
}

/** Selecciona TD **/

function eliminaCampo(btn) {
    console.warn('Elimina');
    var id = btn.parentNode.parentNode.firstChild.getAttribute("class");
    var regex = /(\d+)/g;
    id = id.match(regex); 
    //console.log('Es: ' + id)
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
    eliminaRefaccion(id);
}

function cargaDatosTabla() {
    var URLControllerAlt="http://localhost:8080/gestion/pedido/consultaRefacciones";

    var dataRefacciones;

    $("#tblRefacciones tbody > tr").remove();

    $.ajax({
        url:URLControllerAlt,
        type: 'GET',
        dataType: 'JSON',
        success: function(json) {
            
            var values = [];
            $.each(json.objArrayRefacciones, function(index, element) {
                console.log(element.nombreRefaccion);
                agregarFileValores(element.tempIdRefaccion, element.nombreRefaccion, element.precioRefaccion, element.modeloRefaccion);
                values.push(element.tempIdRefaccion)
            });

            max = Math.max.apply(null,values); //<----
            
            console.log(max); //25

            if (max == Number.POSITIVE_INFINITY || max == Number.NEGATIVE_INFINITY)
            {
                console.warn("1. Es infinity: " + max);
                max = 0;
            }
            counter = max;
        },
        error: function(e) {
           console.log("Error");
        }
    });
}