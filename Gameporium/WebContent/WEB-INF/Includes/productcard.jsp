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
		    
		    <div class="price">
 				${item.prezzo}€
			</div>
		  
		  </div>
		</div>
	
  	</div>
</body>
</html>