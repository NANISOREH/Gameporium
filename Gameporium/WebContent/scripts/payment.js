function deleteCard()
{
	var username = document.getElementById("hiddenform").username.value;
	var securecode = document.getElementById("hiddenform").securecode.value;
		
	$('#' + securecode.toString()).load(' #' + securecode.toString());
	
	$.get('pagamenti', {"username": username, "remove": "true", "securecode": securecode}, 
		function(){
			$(document).ready(function() {
			   window.setTimeout(fadeMyDiv(securecode), 3000); 
			 })
	});
	
}	

function fadeMyDiv(securecode) {
	   $('#' + securecode.toString()).fadeOut('slow');
	}

function changePreset(select)
{
	var securecode = select.value;
	
	$.post('preset', {"securecode": securecode}, 
			function(){
				$("#message").remove();
				$("#preset").append('<div id="message" class="popup alert alert-success fade-in" role="success"> Hai cambiato metodo di pagamento preferito!</div>');
				setTimeout(function(){
					  $('#message').remove();
					}, 3000);
			});
}