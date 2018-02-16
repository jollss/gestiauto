
$(document).ready(function($) {
	
});

$( function() {
    $( "#datepicker" ).datepicker({
        dateFormat: "dd/mm/yy"
    });
} );

$( ".btnMenu" ).click(function() {
  var text = $( this ).attr('id');
  console.log('Re: ' + capitalizeFirstLetter(text));
  var urlController1 = 'http://localhost:8080/gestion/'+capitalizeFirstLetter(text)+'/index';
  console.log("URL: " + urlController1);
  $.ajax({
  	url: urlController1,
  	type: 'GET',
  	dataType: 'html',
  })
  .done(function(data) {
  	console.log('Data: ' + data)
  	$("#containerPrincipal").html();
  	$("#containerPrincipal").html(data);

  })
  .fail(function() {
  	console.log("error");
    window.location.href = urlController1;
  })
  .always(function() {
  	console.log("complete");
  });
});

$( "#btnCerrarSesion" ).click(function() {
  var urlCerrarSesion = 'http://localhost:8080/gestion/logout/index';
  $.ajax({
    url: urlCerrarSesion,
    type: 'POST'
  })
  .done(function() {
    alert("Cerrar sesión.")
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
    window.location.reload();
  });
});

function capitalizeFirstLetter(string) {
    return string.charAt(0).toLowerCase() + string.slice(1);
}