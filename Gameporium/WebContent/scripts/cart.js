function addToCart(quantityform)
{
	var q = quantityform.quantita.value;
	var c = quantityform.acquistabtn.value;
	
	if (q<1 || q >99)
		{
			Swal.fire({
				  title: '<h6>Inserire una quantità compresa tra 1 e 99 prodotti</h6>',
				  toast: true,
				  type: 'error',
				  position: 'top',
				  timer: 2000,
				  showConfirmButton: false
				})
				
				return;
		}
	
	$.get('cartservlet', {"quantita": q, "codice": c}, 
			function(){
				Swal.fire({
				  title: '<h6>Prodotto inserito nel carrello!</h6>',
				  toast: true,
				  type: 'success',
				  position: 'top',
				  timer: 2000,
				  showConfirmButton: false
				});
			}, 
			failAlert());
	
}

function failAlert()
{
	Swal.fire({
		  title: '<h6>Errore!</h6>',
		  toast: true,
		  type: 'error',
		  position: 'top',
		  timer: 2000,
		  showConfirmButton: false
		})
		
		return;
}

function preventEnter()
{
	$(document).ready(function() {
		  $(window).keydown(function(event){
		    if(event.keyCode == 13) {
		      event.preventDefault();
		      return false;
		    }
		  });
		});
}