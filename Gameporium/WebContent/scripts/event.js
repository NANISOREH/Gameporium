function partecipa(idform){

	var e = idform;
	var u = document.getElementById("usernameE").value;
	console.log(u)
	$.get('partecipazione', {"username": u, "codiceEvento": e},
			function(){
				Swal.fire({
				  title: '<h6>Hai confermato la tua partecipazione!</h6>',
				  type: 'success',
				  position: 'top-end',
				  timer: 2000,
				  showConfirmButton: false 
				});
			});	
}