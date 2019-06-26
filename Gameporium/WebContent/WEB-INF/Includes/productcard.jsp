<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="scripts/cart.js"></script>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
</head>
<body>
  	<div class="col-lg-4 col-md-6 col-xs-12 ">
	
		<div class="productcard card d-block mx-auto">
		  
		  <div class="prodimg d-block mx-auto ">
		  	<img class="card-img-top card-hover" src="images/${item.foto}" alt="Card image cap">
		  		<a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}"><div class="prod-des d-none" style="font-size:60%; color: white; text-align:justify">
		  	${item.descrizione}
		  	</div></a>
		  <!-- onhover property -->
         
		  </div>
		  <div class="pccardbody card-body">
		    <div class="card-title">
		    	<a class="item-titolo"style="color: #F0D628" href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}"><b>${item.titolo}</b></a>
		    </div>
			<div class="row form-group">
				<div class="col-6">	
					<div class="price">
			 			<h5>${item.prezzo}€</h5>
					</div>
				</div>
				<c:choose>
				<c:when test="${item.disponibilita>0 }">
				<div class = "col-6">				
				 	<form name="quantity" id="${item.codiceProdotto}" action="cartservlet" onkeydown="return event.key != 'Enter';">
			 			<input class="quantInput" type="hidden" name="quantita" value="1">
						<button class="quantButton text-uppercase" name="acquistabtn" id="acquistabtn" 
							onclick ="addToCart(this.value)" 
							type="button" value="${item.codiceProdotto}" ><i class="fas fa-shopping-cart"></i>
						</button>
				 	</form>
				</div>
				</c:when>
				<c:otherwise>
					<div class="col-6">
						<div class="notAvailable">Non disponibile</div>
					</div>
				</c:otherwise>
				</c:choose>
			</div>
			

		</div>
	
  		</div>
  	
  	</div>
</body>
</html>