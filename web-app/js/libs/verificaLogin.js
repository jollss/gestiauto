
$(document).ready(function($) {

  var paramLogin = $.get("login_error");

  if (paramLogin==1) 
  {
  	$(".login_message").css({
  		color: 'red',
  	});
  	$(".login_message").text("Usuario o contraseña incorrecta, verifica los datos.");
  }else {
  	console.log('Login');
  }
	
});

(function($) {  
    $.get = function(key)   {  
        key = key.replace(/[\[]/, '\\[');  
        key = key.replace(/[\]]/, '\\]');  
        var pattern = "[\\?&]" + key + "=([^&#]*)";  
        var regex = new RegExp(pattern);  
        var url = unescape(window.location.href);  
        var results = regex.exec(url);  
        if (results === null) {  
            return null;  
        } else {  
            return results[1];  
        }  
    }  
})(jQuery);  
