function deleteCard()
{
	var username = document.getElementById("hiddenform").username.value;
	var securecode = document.getElementById("hiddenform").securecode.value;
		
	$.get('pagamenti', {"username": username, "remove": "true", "securecode": securecode}, 
		function(){
			$(document).ready(function() {
				$('#' + securecode.toString()).load(' #' + securecode.toString());
				$("#message").remove();
				$('#' + securecode.toString()).append('<div id="message" class="popup alert alert-success fade-in" role="success"> Hai cancellato un metodo di pagamento!</div>');
				setTimeout(function(){
					  $('#message').remove();
					}, 3000);
			 })
	});
	
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
