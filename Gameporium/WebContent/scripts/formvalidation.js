function validateLogin(loginform)
{	
	var p = loginform.pw.value.length;
	var u = loginform.un.value.length;
	
	if (p == 0 || u == 0)
	{
		Swal.fire({
			  title: '<h6>Riempire entrambi i campi per effettuare il login<h6>',
			  toast: true,
			  type: 'error',
			  position: 'top-end',
			  timer: 1200,
			  showConfirmButton: false
			})
		return;
	}
	
	if (p < 7 || p > 20)
		Swal.fire({
			  title: '<h6>La password deve essere di lunghezza compresa tra 7 e 20 caratteri<h6>',
			  toast: true,
			  type: 'error',
			  position: 'top-end',
			  timer: 1800,
			  showConfirmButton: false
			})
	else
		loginform.submit();
}


function validateRegister(registerform)
{
	var n = registerform.elements.length; 
	
	for (var i = 0; i < n - 1; i++) 
	{		
		if (registerform.elements[i].value.length == 0)
		{
			Swal.fire({
				  title: '<h6>Completare tutti i campi!</h6>',
				  toast: true,
				  type: 'error',
				  position: 'top',
				  timer: 2000,
				  showConfirmButton: false
				})
			return;
		}
	}
	
	var p = registerform.pass.value.length;
	
	if (p < 7 || p > 20)
	{
		Swal.fire({
			  title: '<h6>La password deve essere di lunghezza compresa tra 7 e 20 caratteri</h6>',
			  toast: true,
			  type: 'error',
			  position: 'top',
			  timer: 2000,
			  showConfirmButton: false
			})
		return;
	}
	else if (!validateEmail(registerform.mail.value))
	{
		Swal.fire({
			  title: '<h6>Inserire un indirizzo email valido</h6>',
			  toast: true,
			  type: 'error',
			  position: 'top',
			  timer: 2000,
			  showConfirmButton: false
			})
			registerform.mail.value = "";
			return;
	}
	else if (registerform.pass.value != registerform.confirmPass.value)
	{
		Swal.fire({
			  title: '<h6>Le password non coincidono!</h6>',
			  toast: true,
			  type: 'error',
			  position: 'top',
			  timer: 2000,
			  showConfirmButton: false
			})
		registerform.pass.value = "";
		registerform.confirmPass.value = "";
		return;
	}
	else if(!registerform.check.checked)
	{
		Swal.fire({
			  title: '<h6>Accetta i Termini per continuare</h6>',
			  toast: true,
			  type: 'error',
			  position: 'top',
			  timer: 2000,
			  showConfirmButton: false
			})
			return;
	}
	else
		registerform.submit();
}

function validateQuantity(quantityform)
{
	if (quantityform.quantita.value < 1 || quantityform.quantita.value > 99)
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
	else
	{
		window.location.href = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
		registerform.submit();
	}
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}