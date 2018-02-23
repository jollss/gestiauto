$(document).ready(function() {
    $('#tblRefacciones').DataTable();

    var t = $('#tblRefacciones').DataTable();

    var counter = 1;

    /*$('.btnEliminarCampo').on( 'click', function () {
        console.warn("Eliminar")
        t.row().remove().draw();
    });*/

    $(".btnEliminarCampo").on('click', function(event) {
        $(this).parent().parent().remove();
    });

    /*$('#tblRefacciones .btnEliminarCampo').click(function(){
        $(this).remove();
        console.warn("Eliminar")
        return false;
    });*/

    $('#addRow').on( 'click', function () {

        var btnDefault = '<button type="button" class="btn btn-warning btnEditarCampo"><i class="fas fa-edit"></i></button>\n' +
            '<button type="button" class="btn btn-primary btnGuardarCampo"><i class="fas fa-save"></i></button>\n' +
            '<button type="button" class="btn btn-danger btnEliminarCampo"><i class="fas fa-ban"></i></button>';

        var inputNombre = '<input placeholder="Nombre" type="text" name="nombreRefaccion"/>';
        var inputPrecio = '<input placeholder="Precio" type="text" name="precioRefaccion"/>';
        var inputModelo = '<input placeholder="Modelo" type="text" name="modeloRefaccion"/>';

        var tempCont = counter +1;

        $("#tblRefacciones > tbody").append("<tr>" +
            "<th>"+tempCont+"</th>" +
            "<th>"+inputNombre+"</th>" +
            "<th>"+inputPrecio+"</th>" +
            "<th>"+inputModelo+"</th>" +
            "<th>"+btnDefault+"</th>" +
            "</tr>");

        console.log("Agregar campo");
        /*t.row.add( [
            counter+1,
            inputNombre,
            inputPrecio,
            inputModelo,
            btnDefault
        ] ).draw( true );*/

        counter++;
    });
} );