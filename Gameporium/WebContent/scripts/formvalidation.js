
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
		document.getElementById("prova").disabled = true;
		return;
	}
	else if (u.length > 0)
	{
		document.getElementById("prova").disabled = false;
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
	
	if (!registerform.pass.value.match(pass))
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
	
	registerform.submit();
}

function validateCreditCard(form)
{
	var n = form.elements.length;
	var card = /^[0-9]{16,16}$/;
	
	for (var i = 0; i < n - 1; i++) 
	{		
		if (form.elements[i].value.length == 0)
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
			form.elements[i].value = htmlEscape(form.elements[i].value);
	}
	
	if (!form.numero.value.match(card))
	{
		Swal.fire({
			  title: '<h6>Inserire un numero valido!</h6>',
			  toast: true,
			  type: 'error',
			  position: 'top',
			  timer: 2000,
			  showConfirmButton: false
			})
		
		form.numero.focus();
		return;
	}
	
	if (form.cvv.value.length == 3)
	{
		form.scadenza.value = form.mesescadenza.value.toString() + "/" + form.annoscadenza.value.toString();
		form.submit();
	}
}

function limitCvv (field)
{
    if (field.value.length > 3) {
        field.value = field.value.slice(0,3); 
    }
}

function limitCap(field)
{
    if (field.value.length > 5) {
        field.value = field.value.slice(0,5); 
    }
}

function startOrder()
{
	var form=document.getElementById("ordinafrm");
	var n = form.elements.length;
	
	for (var i = 0; i < n - 1; i++) 
	{		
		if (form.elements[i].value.length == 0)
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
			form.elements[i].value = htmlEscape(form.elements[i].value);
	}
		
		var indirizzo={via:form.indirizzo.value, civ:form.ncivico.value, cap:form.cap.value, citta: form.citta.value};
		var jsonAddress=JSON.stringify(indirizzo);
		var metodo=document.getElementById("pselect").value;
		var hiddenMetodo = document.getElementById("metodoselect");
		hiddenMetodo.value=metodo;

}

function htmlEscape(toEscape)

{

	toEscape.replace(/>/g, "&gt;");

	toEscape.replace(/</g, "&lt;");

	toEscape.replace(/>/g, "&amp;");

	toEscape.replace(/"/g, "&quot;");



	return toEscape;

}

function validateAddProduct(addproductform){
	var c=document.getElementById("nomeCategoria").value;
	var n=addproductform.elements.length;
	if(c!="gioco" && c!="accessorio")
		{
			Swal.fire({
				  title: '<h6>Scegliere una categoria!</h6>',
				  toast: true,
				  type: 'error',
				  position: 'top',
				  timer: 2000,
				  showConfirmButton: false
				})
			return;
		}
	
	for (var i = 0; i < n - 1; i++) 
	{		
		
		if(c=="accessorio"){
			document.getElementById("eta").value="."
			document.getElementById("durata").value="."
			document.getElementById("ngiocatori").value="."
		}
		if (addproductform.elements[i].value.length == 0)
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
	if(c=="accessorio"){
		document.getElementById("eta").value=""
		document.getElementById("durata").value=""
		document.getElementById("ngiocatori").value=""
	}
	addproductform.submit();
}

function validateEvent(addeventform){

	var n=addeventform.elements.length;
	console.log(n)
	for (var i = 0; i < n - 1; i++) 
	{		
		console.log(addeventform.elements[i].id)

		if (addeventform.elements[i].value.length == 0)
		{
			console.log("mancante")
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

	addeventform.submit();
}