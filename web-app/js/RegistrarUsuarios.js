$(document).ready(function(){
$('#username').keyup(function(){
// alert('sds');
var username = $(this).val(); // Get username textbox using $(this)

var resultadodiv = $('#respuestausuarioexi'); // Get ID of the result DIV where we display the results

resultadodiv.html('Cargando...'); // you can use loading animation here
var dataPass = 'action=availability&username='+username;
$.ajax({ // Send the username val to available.php
type : 'POST',
data : dataPass,
url  : 'http://localhost/gestion/servicios/buscarusuario',
success: function(responseText){ // Get the result
//alert(responseText);
if(responseText == 0){
Result.html('<span class="success">usar</span>');
}
else if(responseText>0){
Result.html('<span class="error">no usar</span>');
}
else{
alert('Problem with sql query');
}
}
});

if(username.length == 0) {
resultadodiv.html('');
}
});
});
  