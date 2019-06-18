function enablemod(){
	event.preventDefault()
	document.getElementById("codiceProdotto").removeAttribute("readonly");	
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
	document.getElementById("gioco").removeAttribute("disabled");	
	document.getElementById("accessorio").removeAttribute("disabled");	
	document.getElementById("descrizioneCategoriaGiochi").removeAttribute("disabled");	
	document.getElementById("descrizioneCategoriaAccessori").removeAttribute("disabled");
	document.getElementById("modbtn").removeAttribute("disabled");	
}


function gameoraccessory(category){	
	if(category=='gioco'){
		document.getElementById("subCatGioco").style.display="block";
		document.getElementById("subCatAccessorio").style.display="none";
	}
	else if(category=='accessorio'){
		document.getElementById("subCatGioco").style.display="none";
		document.getElementById("subCatAccessorio").style.display="block";
	}
}


$(document).ready(function() {	
	
    $("#modproductform").submit(function(event) {
    	event.preventDefault()
    	var formContents = $('#modproductform').serializeArray();
    	var codProd = formContents.find(x => x.name == "codProdotto").value
    	
    	$.getJSON('jsonretrieval', {codProdotto: codProd},
            function(response) { 
    			var formProduct=$("#modproductformhidden").serializeArray().map(x => x.name);
    			console.log(response)
    			for (var key in response){
    				if (response.hasOwnProperty(key)){
    					if(key=="nomeCategoria"||key=="codCategoria"){
    						console.log("sono nella categoria")
    						if(response[key]=="Gioco" || response[key]=="1"){
    							document.getElementById("subCatGioco").style.display="block";
    							document.getElementById("subCatAccessorio").style.display="none";
    							document.getElementById("gioco").checked=true;
    						}
    						else{
    							document.getElementById("subCatGioco").style.display="none";
    							document.getElementById("subCatAccessorio").style.display="block";
    							document.getElementById("accessorio").checked=true;
    						}		
    					}
    					else if(key=="novita" && response[key]==true){
    						document.getElementById("novita").checked=true;
						}
    					else if(key=="offerta" && response[key]==true){
							document.getElementById("offerta").checked=true;		
						}
    					else if(key=="descrizioneCategoria"){
    						console.log("sono nella sub categoria")
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
    						    console.log("Stai sbagliann coccos" );
    						}
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
