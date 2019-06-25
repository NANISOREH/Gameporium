/*queste funzioni caricano i dati nel form  quando ci si arriva via "Visualizza"*/
function myFunct(){
	//ci vuole un altro if che faccia partire la funzione solo quando il form è quello giusto altrimenti cercherà sempre il button
	if(document.getElementById("modproductform"))
	{	
		var cod=document.getElementById("codProdotto").value;
		if(!isNaN(cod)){
			document.getElementById("cercaCRUD").click();
		}
	}
}
function myFunctEvento(){
	//ci vuole un altro if che faccia partire la funzione solo quando il form è quello giusto altrimenti cercherà sempre il button
	if(document.getElementById("modeventform"))
	{
		var cod=document.getElementById("codEvento").value;
		if(!isNaN(cod)){
			document.getElementById("cercaCRUD").click();
		}
	}
}
/*questa funzione abilita tutti i campi del form quando l'admin vuole modificare i dati di un prodotto*/
function enablemod(){
	event.preventDefault()
	document.getElementById("descrizione").removeAttribute("readonly");	
	document.getElementById("eta").removeAttribute("readonly");	
	document.getElementById("numeroGiocatori").removeAttribute("readonly");	
	document.getElementById("produttore").removeAttribute("readonly");	
	document.getElementById("titolo").removeAttribute("readonly");	
	document.getElementById("durata").removeAttribute("readonly");	
	document.getElementById("IVA").removeAttribute("readonly");	
	document.getElementById("disponibilita").removeAttribute("readonly");	
	document.getElementById("prezzo").removeAttribute("readonly");	
	document.getElementById("foto").removeAttribute("readonly");	
	document.getElementById("novita").removeAttribute("disabled");	
	document.getElementById("offerta").removeAttribute("disabled");
	document.getElementById("nomeCategoria").removeAttribute("disabled");	
	document.getElementById("descrizioneCategoriaGiochi").removeAttribute("disabled");	
	document.getElementById("descrizioneCategoriaAccessori").removeAttribute("disabled");
	document.getElementById("modbtn").removeAttribute("disabled");	
}

/*questa funzione abilita tutti i campi del form quando l'admin vuole modificare i dati di un evento*/
function enablemodevent(){
	event.preventDefault()
	document.getElementById("numeroPartecipanti").removeAttribute("readonly")
	document.getElementById("descrizione").removeAttribute("readonly");	
	document.getElementById("nome").removeAttribute("readonly");	
	document.getElementById("locandina").removeAttribute("readonly");	
	document.getElementById("dataEvento").removeAttribute("readonly");	
	document.getElementById("ora").removeAttribute("readonly");	
	document.getElementById("luogo").removeAttribute("readonly");
	document.getElementById("caricabtn").removeAttribute("disabled");
}


/*questa funzione mostra e/o nasconde gli attributi delle categorie del prodotto*/
function gameoraccessory(category){	
	if(category=='gioco'){
		document.getElementById("subCatGioco").style.display="block";
		document.getElementById("subCatAccessorio").style.display="none";
	}
	else if(category=='accessorio'){
		document.getElementById("subCatGioco").style.display="none";
		document.getElementById("subCatAccessorio").style.display="block";
	}
	else if(category==''){
		document.getElementById("subCatGioco").style.display="none";
		document.getElementById("subCatAccessorio").style.display="none";
	}
}

/*questa funzione permette all'admin di arrivare alla pagina di modifica/elimina prodotto con i dati del prodotto già inseriti*/
$(document).ready(function() {	
	
    $("#modproductform").submit(function(event) {
    	event.preventDefault()
    	var formContents = $('#modproductform').serializeArray();
    	var codProd = formContents.find(x => x.name == "codProdotto").value
    	
    	$("#modproductform input").each(function(){
    		var inputn=$(this);
    		console.log(inputn.attr('name'));
    	});
    
    	$.getJSON('jsonretrieval', {codProdotto: codProd},
            function(response) { 
    			var formProduct=$("#modproductformhidden").serializeArray().map(x => x.name);
    			console.log(response)
    			for (var key in response){
    				
    				if (response.hasOwnProperty(key)){
    					if(key=="nomeCategoria"||key=="codCategoria"){	
    						if(response[key]=="Gioco" || response[key]=="1"){
    							document.getElementById("subCatGioco").style.display="block";
    							document.getElementById("subCatAccessorio").style.display="none";
    							document.getElementById("nomeCategoria").selectedIndex="1"
    						}
    						else{
    							document.getElementById("subCatGioco").style.display="none";
    							document.getElementById("subCatAccessorio").style.display="block";
    							document.getElementById("nomeCategoria").selectedIndex="2"
    						}		
    					}
    					else if(key=="novita"){
    						console.log("sono nella novita")
    						if(response[key]==true){
	    						document.getElementById("novita").selectedIndex="0"
							}
    						else{
    							document.getElementById("novita").selectedIndex="1"
    						}
    					}
    					else if(key=="offerta"){
    						console.log("sono nell'offerta")
    						if(response[key]==true){
	    						document.getElementById("offerta").selectedIndex="0"		
    						}
    						else{
    							document.getElementById("offerta").selectedIndex="1"
    						}
    					}
    					else if(key=="descrizioneCategoria"){
    						switch (response[key]) {
    						  case "Gioco di ruolo":
    						    document.getElementById("descrizioneCategoriaGiochi").selectedIndex="0"
    						    break;
    						  case "Gioco di carte":
    							document.getElementById("descrizioneCategoriaGiochi").selectedIndex="1"
    							break;
    						  case "Gioco da tavolo":
    							document.getElementById("descrizioneCategoriaGiochi").selectedIndex="2"
    						    break;
    						  case "Accessori per giochi di ruolo":
    							document.getElementById("descrizioneCategoriaAccessori").selectedIndex="0"
    						    break;
    						  case "Accessori per giochi di carte":
      							document.getElementById("descrizioneCategoriaAccessori").selectedIndex="1"
      							break;
    						  case "Accessori per giochi di tavolo":
      							document.getElementById("descrizioneCategoriaAccessori").selectedIndex="2"
      							break;
    						  default:
    						    console.log("Errore" );
    						}
    						$('#modproductform').load(' #modproductform');
    					}
    					else{
    						console.log(key)
    						document.getElementById(key).value=response[key];
    					}
    				}
    			}
            })
            .fail(function(error) { 
                console.error(error)
            });
    });  
});

/*questa funzione permette all'admin di arrivare alla pagina di modifica/elimina eventi con i dati dell'evento già inseriti*/
$(document).ready(function() {	
	
    $("#modeventform").submit(function(event) {
    	event.preventDefault()
    	var formContents = $('#modeventform').serializeArray();
    	var codE = formContents.find(x => x.name == "codEvento").value
    	
    	$("#modeventform input").each(function(){
    		var inputn=$(this);
    		console.log(inputn.attr('name'));
    	});
    
    	$.getJSON('jsonretrievalevent', {codiceEvento: codE},
            function(response) { 
    			var formProduct=$("#modeventformhidden").serializeArray().map(x => x.name);
    			console.log(response)
    			for (var key in response){
    				console.log(key)
    				if (response.hasOwnProperty(key)){
    					if(key=="dataEvento"){
    						var y=response[key].year
    						var date=y+"-"
    						if(response[key].month<=9){
    							date=date+"0"+response[key].month+"-"}
    						else{
    							date=date+response[key].month+"-"
    						}
    						if(response[key].day<=9){
    							date=date+"0"+response[key].day}
    						else{
    							date=date+response[key].day
    						}
    						console.log(date)
    						document.getElementById(key).value=date;
    						}		
    					else if(key=="ora"){
    						var time="";
    						if(response[key].hour<=9){
    							time=time+"0"+response[key].hour+":"}
    						else{
    							time=time+response[key].hour+":"
    						}
    						if(response[key].minute<=9){
    							time=time+"0"+response[key].minute+":00"}
    						else{
    							time=time+response[key].minute+":00"
    						}
    						console.log(time)
    						document.getElementById(key).value=time
    						}
    					else{
    						console.log(key)
    						document.getElementById(key).value=response[key];
    					}
    				}
    			}
            })
            .fail(function(error) { 
                console.error(error)
            });
    });  
});


/*questa funzione permette all'admin di arrivare alla pagina di modifica/elimina clienti con i dati dell'evento già inseriti*/
$(document).ready(function() {	
	
    $("#modclienteform").submit(function(event) {
    	event.preventDefault()
    	var formContents = $('#modclienteform').serializeArray();
    	var codC = formContents.find(x => x.name == "user").value
    	
    	$("#modclienteform input").each(function(){
    		var inputn=$(this);
    		console.log(inputn.attr('name'));
    	});

    	$.getJSON('jsonretrievalcliente', {user: codC},
            function(response) { 
    			var formProduct=$("#modclienteformhidden").serializeArray().map(x => x.name);
    			console.log(response)
    			for (var key in response){
    				console.log(key)
    				if (response.hasOwnProperty(key)){
   						console.log(key)
   						document.getElementById(key).value=response[key];
    				}
    			}
            })
            .fail(function(error) { 
                console.error(error)
            });
    });  
});


function ajaxOrder()
{
	$("#modorderform").submit(function(event)
		{
			var u =document.getElementById("username").value
			$.get('adminorder', {"username": u}, 
		      function(){
		        $("#ordertable").load(' #ordertable');
		      }, 
		      failAlert()); 
		});
}