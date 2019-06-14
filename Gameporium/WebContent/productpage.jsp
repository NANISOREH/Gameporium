<!DOCTYPE html>
<html lang="en">

<head>
<%-- <title>Gameporium - ${currentProduct.titolo}</title> --%>
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

<c:set var="sel" value='${param["selCat"]}' />

<c:if test='${sel == 1}'>
	<c:set var="prodotto" value='${requestScope["gioco"]}' />
</c:if>
<c:if test='${sel == 2}'>
	<c:set var="prodotto" value='${requestScope["accessorio"]}' />
</c:if>
<title>Gameporium - ${prodotto.titolo}</title>

<link rel="stylesheet" href="pagestyle.css" type="text/css">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/Includes/header.jsp"%>
</head>

<body>
<%-- 	<c:set var="currentProduct" value='${requestScope["currentProduct"]}' /> --%>

	<div class="allpagecontainer container-fluid bg-light">
		<!-- sistema di colonne -->
		<div class="row">
			<!-- colonna sinistra -->
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->
			
			<!-- colonna centrale -->	
			<div id="centerproductpage" class="col-lg-8 col-md-12 bg-light">
			
				<c:if test="${sel=='1'}">
					<c:set var="gioco" value='${requestScope["gioco"]}' />

					<div class="container-fluid">
						<div class="row">
							
							<div class="col-lg-4 col-xs-12 bg-light">
								<a  id="fotoprodotto" href="#"><img
									src="images/${gioco.foto}" class="rounded mx-auto d-block fotoprodotto"
									alt="Responsive image">
								</a>
							</div>
							
							<div class="productinfo col-lg-8 col-xs-12 bg-light">
								 <ul class="list-group list-group-flush" >
								 	
								 	<li class="list-group-item bg-light">
										<h4>${gioco.titolo}</h4>
								 	</li>
								 
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5 col-xs-12">
										 		<div class="col-lg-7 col-xs-12">
										 			<span class="prezzo">
									 				${gioco.prezzo}€</span> 
										 		</div>
										 	</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5 col-xs-12">Cod. art.:</div>
									 		<div class="col-lg-7 col-xs-12">#${gioco.codiceProdotto}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Marca:</div>
									 		<div class="col-lg-7">${gioco.produttore}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Durata:</div>
									 		<div class="col-lg-7">${gioco.durata}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Età consigliata:</div>
									 		<div class="col-lg-7">${gioco.etaConsigliata}+ anni</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Disponibilità:</div>
									 		<div class="col-lg-7">#${gioco.disponibilita}</div>
								 		</div>
								 	</li>
								 	
								 	<li class="list-group-item bg-light">
									 	<form name="quantityForm" action="cartservlet">
									 		<div class="row">
									 			<div class="nomeriga col-5">Quantità:
									 			</div>
										 		<div class="col-7">
										 			<input class="quantInput" type="number" name="quantita" value="1">
												</div>
												<button class="quantButton btn btn-sm btn-primary btn-block text-uppercase" name="acquistabtn" id="acquistabtn"
													style = "max-width:150px; align-text: center; margin-top:20px"  onclick ="validateQuantity(document.quantityForm)"
													type="submit" name="addC" value='${gioco.codiceProdotto}' >Aggiungi al Carrello
												</button>
									 		</div>
									 	</form>
								 	</li>
								
								</ul> 
							</div>
							
						</div>
						
					</div>
				</c:if>
				
				<c:if test="${sel=='2'}">
					<c:set var="gioco" value='${requestScope["accessorio"]}' />

					<div class="container-fluid">
						<div class="row">
							
							<div class="col-lg-4 col-xs-12 bg-light">
								<a class="navbar-brand text-white-80" href="#"><img
									src="images/{gioco.foto}" class=" fotoprodotto rounded mx-auto d-block"
									alt="Responsive image"
									style="margin-bottom: 0; margin-top:30px">
								</a>
							</div>
							
							<div class="col-lg-8 col-xs-12 bg-light" style="margin-top: 14px">
								 <ul class="list-group list-group-flush">
								 	
								 	<li class="list-group-item bg-light">
										<h4>${gioco.titolo}</h4>
								 	</li>
								 	
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5 col-xs-12">Prezzo:</div>
									 		<div class="col-lg-7 col-xs-12">
									 			<span class="prezzo">
								 				${gioco.prezzo}€</span> 
									 		</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5 col-xs-12">Cod. art.:</div>
									 		<div class="col-lg-7 col-xs-12">#${gioco.codiceProdotto}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Marca:</div>
									 		<div class="col-lg-7">${gioco.produttore}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Disponibilità:</div>
									 		<div class="col-lg-7">#${gioco.disponibilita}</div>
								 		</div>
								 	</li>
								 	
								 	<li class="list-group-item bg-light">
									 	<form name="quantityForm" action="cartservlet">
									 		<div class="row">
									 			<div class="nomeriga col-5">Quantità:
									 			</div>
										 		<div class="col-7">
										 			<input class="quantInput" type="number" name="quantita" placeholder="1">
												</div>
												<button class="quantButton btn btn-sm btn-primary btn-block text-uppercase" name="acquistabtn" id="acquistabtn"
													style = "max-width:150px; align-text: center; margin-top:20px"  onclick ="validateQuantity(document.quantityForm)"
													type="submit" name="addC" value='${gioco.codiceProdotto}' >Aggiungi al Carrello
												</button>
									 		</div>
									 	</form>
								 	</li>
								
								</ul> 
							</div>
							
						</div>
						
					</div>
				</c:if>
				
				
				<h4 style="margin-top: 30px">Descrizione</h4>
				<div class="container-fluid" style="border-top:1px black solid;">
					<br>
					${gioco.descrizione}
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