<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    <div class="col-lg-4 col-xs-12 bg-light">
  
    <div class="productcard card d-block mx-auto">
      
      <div class="prodimg d-block mx-auto">
        <img class="card-img-top" src="images/${item.foto}" alt="Card image cap">
      </div>
      
      <div class="pccardbody card-body">

          <div class="card-title">
            <a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}">${item.titolo}</a>
          </div>
      
      
      <div class="row">
        
        <div class="col-6">  
          <div class="price">
             <h5>${item.prezzo}€</h5>
          </div>
        </div>
        
        <div class = "col-6">        
           <form name="quantityForm" action="cartservlet" onkeydown="return event.key != 'Enter';">
             <input class="quantInput" type="number" name="quantita" value="1">
            <button class="quantButton text-uppercase" name="acquistabtn" id="acquistabtn" 
              onclick ="addToCart(document.quantityForm)"
              type="button" value='${gioco.codiceProdotto}' ><i class="fas fa-shopping-cart"></i>
            </button>
           </form>
        </div>
      </div>
      

    </div>
  
      </div>
    
    </div>
</body>
</html>