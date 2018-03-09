$( document ).ready(function() {
});
function verPendientes(){    
$('#verPendientes').fadeIn(); 
$('#verTerminados').fadeOut();       
$('#Bitacora').fadeOut();
$('#Reagendacion').fadeOut();



}

function verTerminados(){
$('#verTerminados').fadeIn();
$('#verPendientes').fadeOut();
$('#Bitacora').fadeOut();
$('#Reagendacion').fadeOut();
}

function Bitacora(){
$('#verTerminados').fadeOut();
$('#verPendientes').fadeOut();
$('#Bitacora').fadeIn();
$('#Reagendacion').fadeOut();

}
function Reagendacion(){
$('#verTerminados').fadeOut();
$('#verPendientes').fadeOut();
$('#Bitacora').fadeOut();
$('#Reagendacion').fadeIn();

}
