<!DOCTYPE html>
<html lang="en">

<head>
<title>Gameporium</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="pagestyle.css" type="text/css">
<%@include file="/WEB-INF/Includes/header.jsp"%>
</head>

<body>
	<div class="container-fluid bg-light">
		<!-- sistema di colonne -->
		<div class="row">
			
			<!-- colonna sinistra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->
			
			<!-- colonna centrale -->
			<div id="pscenter" class="col-lg-8 col-md-12 col-sm-12 col-xs-12 bg-light">
				<div class="container-fluid clearfix">	
	  	
					<%@include file="/WEB-INF/Includes/mobilesearchbar.jsp" %> 
					
			      	<!-- Inizio sezione risultati -->
					<div class="sectionstyle"> Risultati Ricerca </div>
			
			        <!-- Inizio iterazione cards-->
			      		<div class="row">
				      		<jsp:include page="/productShow"/>
				      		<c:set var="results" value='${sessionScope["listaRisultati"]}'/>
				      		<c:forEach items="${results}" var="item">
			      				<div class="col-lg-4 col-xs-12 bg-light">
					      			<div class="productcard card">
					      				<div class="card-header">
					      					<a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}">${item.titolo}</a>
					      				</div>
				          				<div class="card-body">
				          					<img class="card-img-top img-responsive" src="images/${item.foto}" alt="${item.foto}">
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
			
			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine colonna destra -->
			
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>
