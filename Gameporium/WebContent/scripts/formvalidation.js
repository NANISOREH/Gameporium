function validateUserPass(loginform)
{	
	var p = loginform.pw.value.length;
	var u = loginform.un.value.length;
	
	if (p == 0 || u == 0)
	{
		return;
	}
	
	if (p < 7 || p > 20)
		Swal.fire({
			  title: 'La password deve essere di lunghezza compresa tra 7 e 20 caratteri!',
			  width: 600,
			  padding: '3em',
			  timer: 2500
			})
	else
		loginform.submit();
}

function validateRegister(registerform)
{
	var p = registerform.pass.value.length;
	
	if (p < 7 || p > 20)
	{
		alert("La password deve essere di lunghezza compresa tra 7 e 20 caratteri!");
		return;
	}
	else if (registerform.pass.value != registerform.confirmPass.value)
	{
		alert("Le password non coincidono!");
		registerform.pass.value = "";
		registerform.confirmPass.value = "";
		return;
	}
	else
		registerform.submit();
}