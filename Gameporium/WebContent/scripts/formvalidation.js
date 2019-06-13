function validateLogin(password, username)

{	
	var p = password.value;
	var u = username.value;
	
	password.value = htmlEscape(password.value);
	username.value = htmlEscape(username.value);

	var pass = /^.{7,}$/;
	

	if (!p.match(pass))
	{
		$(".loginbtn").button({ disabled: true });
		return;
	}
	else if (u.length > 0)
	{
		$(".loginbtn").button({ disabled: false });
	}
}

function validateMLogin (password,username)
{
	var p = password.value;
	var u = username.value;
		
	password.value = htmlEscape(password.value);
	username.value = htmlEscape(username.value);

	var pass = /^.{7,}$/;
	

	if (!p.match(pass))
	{
		$(".loginbtnm").button({ disabled: true });
		return;
	}
	else if (u.length > 0)
	{
		$(".loginbtnm").button({ disabled: false });
	}
}

function validateRegister(registerform)

{

	var n = registerform.elements.length; 

	var mailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	var pass = /^.{7,}$/;

	

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

		else

			registerform.elements[i].value = htmlEscape(registerform.elements[i].value);

	}

	

	var p = registerform.pass.value.length;

	

	if (!p.match(pass))

	{

		Swal.fire({

			  title: '<h6>La password deve essere di lunghezza compresa tra 7 e 20 caratteri</h6>',

			  toast: true,

			  type: 'error',

			  position: 'top',

			  timer: 2000,

			  showConfirmButton: false

			})

		registerform.pass.focus();

		return;

	}

	else if (!registerform.mail.value.match(mailReg))

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

		registerform.mail.focus();

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

		registerform.pass.focus();

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

			registerform.check.focus();	

			return;

	}

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

		quantityform.quantita.value = htmlEscape(quantityform.quantita.value);

		window.location.href = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';

	}

}

function htmlEscape(toEscape)

{

	toEscape.replace(/>/g, "&gt;");

	toEscape.replace(/</g, "&lt;");

	toEscape.replace(/>/g, "&amp;");

	toEscape.replace(/"/g, "&quot;");



	return toEscape;

}

function gameoraccessory(category){

	if(category=='gioco'){
		
	}
	else if(category=='accessorio'){
		
	}
}