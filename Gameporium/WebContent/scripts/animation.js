//funzione onhover con zoom
jQuery(document).ready(function($){
	
    $('.productcard').hover(
        function () {
        	console.log("we")
        	$(this).children().children(".card-hover").animate({height: "0"},"slow");
        	$(this).children().children(".prod-des").removeClass("d-none")        	
        	        },
        function () {
        	$(this).children().children(".prod-des").addClass("d-none")
        	$(this).children().children(".card-hover").animate({height: "70%"});
        	
        }
    );  
});


/*funzione slideshow*/ 
//rimossa perchè le immagini si accodavano, venivano caricate tutte nella prima slide*/

/*funzione onhover con dati*/ 
//problema di  sovrapposizione. I dati vengono accodati all'immagine invece di sovrascriverla.
//Son riusvita a farli comparire sull'immagine, ma a quel punto l'immagine si era totalmente sminchiata
//e fuoriusciva dal container


/*jQuery(document).ready(function($){
    //portfolio - show link
    $('.card-img-top').hover(
        function () {
            $(this).animate({opacity:'0'});
        },
        function () {
            $(this).animate({opacity:'1'});
        }
    );  
});*/