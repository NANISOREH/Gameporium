<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- container novità e offerte -->
	<div class="container-fluid clearfix">	
	  	
		<%@include file="/WEB-INF/Includes/mobilesearchbar.jsp" %> 
		
      	<!-- Inizio sezione risultati -->
		<div style="border-bottom:1px black solid"> Risultati Ricerca </div>

        <!-- Inizio iterazione cards-->
      		<div class="row">
	      		<jsp:include page="/productShow"/>
	      		<c:set var="results" value='${sessionScope["listaRisultati"]}'/>
	      		<c:forEach items="${results}" var="item">
      				<div class="col-lg-4 col-xs-12 bg-light">
		      			<div class="card" style="margin-top: 30px">
		      				<div class="card-header">
		      					<a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}">${item.titolo}</a>
		      				</div>
	          				<div class="card-body">
	          					<img class="card-img-top img-responsive" src="<c:url value="WebContent/images/${item.foto}"/>"alt="${item.foto}"/>
	          					<br>
	       					</div>
	       					<div class="card-footer">
	       						Prezzo:
	       						${item.prezzo}
	       					</div>
	       				</div>
       				</div>
				</c:forEach>
			</div>
       		<!-- fine iterazione cards -->
      	<!-- fine sezione risultati -->
	
	</div>
<!--fine container novità e offerte-->

</body>
</html>