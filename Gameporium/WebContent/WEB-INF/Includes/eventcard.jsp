<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
</head>
<body>
  	<div class="col-lg-4 col-xs-12 bg-light">
	
		<div class="productcard card d-block mx-auto">	  
			<div class="d-block mx-auto ">
			  	<a href="singleEvent?selEvento=${item.codiceEvento}"><img class="card-img-top zoom" src="images/${item.locandina}" alt="Card image cap"></a>     
			</div>
	 		<div class="pccardbody card-body">
			    <div class="card-title">
			    	<a href="singleEvent?selEvento=${item.codiceEvento}">${item.nome}</a>
			    </div>
				<div class="row form-group">
					<div>
				 		Luogo:<br> 
				 		${item.luogo}
					</div>
				</div>
				<div class="row form-group">
					<div>
			 			Giorno:<br> 
			 			${item.dataEvento } <br> 
			 			Ora:<br> 
			 			${item.ora}
					</div>
				</div>
			</div>
		</div>	
  	</div>
</body>
</html>