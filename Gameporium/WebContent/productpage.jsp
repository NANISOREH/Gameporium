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

<style>
</style>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/Includes/header.jsp"%>
<jsp:include page="/testproduct" />
</head>

<body style="background-color: #343a40">
	<c:set var="currentProduct" value='${requestScope["currentProduct"]}' />

	<div class="container-fluid bg-light" style="margin-top: 0">
		<!-- sistema di colonne -->
		<div class="row">
			<!-- colonna sinistra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light"
				style="margin-bottom: 500px">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->
			<!-- colonna centrale -->
			<div class="col-lg-8 col-md-12 bg-light" style="margin-bottom: 300px; margin-top: 40px">
				<h2>${currentProduct.titolo}</h2>
				<div class="container-fluid" style="border-top:1px black solid">
					<div class="row">
						
						<div class="col-lg-4 col-xs-12 d-none d-lg-block bg-light">
							<a class="navbar-brand text-white-80" href="#"><img
								src="res/pl.jpg" class="rounded mx-auto d-block"
								alt="Responsive image"
								style="margin-bottom: 0; margin-top:30px">
							</a>
						</div>
						
						<div class="col-lg-8 col-xs-12 d-none d-lg-block bg-light" style="margin-bottom: 300px; margin-top: 31px">
							 <ul class="list-group list-group-flush">
							 	<li class="list-group-item bg-light">Prezzo: 
							 		<span style="font-size: 23px; font-weight: bold; display:inline-block; margin-left: 50px">
							 		${currentProduct.prezzo}€</span> 
							 	</li>
							 	<li class="list-group-item bg-light">Marca: 
							 		<span style="display:inline-block; margin-left: 50px">
							 		${currentProduct.produttore}</span> 
							 	</li>
							 	<li class="list-group-item bg-light">Marca: 
							 		<span style="display:inline-block; margin-left: 50px">
							 		${currentProduct.produttore}</span> 
							 	</li>
							  	<li class="list-group-item bg-light">Prova</li>
							  	<li class="list-group-item bg-light">Prova</li>
							  	<li class="list-group-item bg-light">Prova</li>
							  	<li class="list-group-item bg-light">Prova</li>
							</ul> 
						</div>
						
					</div>
					
				</div>
			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light"
				style="margin-bottom: 300px" style="border-left:1px">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>