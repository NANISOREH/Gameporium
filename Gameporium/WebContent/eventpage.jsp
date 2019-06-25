<!DOCTYPE html>
<html lang="en">

<head>
<%-- <title>Gameporium - ${currentProduct.titolo}</title> --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="scripts/cart.js"></script>
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
<script type="text/javascript" src="scripts/event.js"></script>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<c:set var="evento" value='${requestScope["evento"]}' />

<title>Gameporium - ${evento.nome}</title>

<link rel="stylesheet" href="pagestyle.css" type="text/css">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
</head>

<body>
<%-- 	<c:set var="currentProduct" value='${requestScope["currentProduct"]}' /> --%>
	<div class= "header">
	<%@include file="/WEB-INF/Includes/header.jsp"%>
	</div>
	
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

					<div class="container-fluid">
						<div class="row">
							
							<div class="col-lg-4 col-xs-12 bg-light">
								<a  id="fotoprodotto" href="#"><img
									src="images/${evento.locandina}" class="rounded mx-auto d-block fotoprodotto"
									alt="Responsive image">
								</a>
							</div>
							
							<div class="productinfo col-lg-8 col-xs-12 bg-light">
								 <ul class="list-group list-group-flush" >
								 	
								 	<li class="list-group-item bg-light">
										<h4>${evento.nome}</h4>
								 	</li>
								 
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5 col-xs-12">Cod. evento.:</div>
									 		<div class="col-lg-7 col-xs-12">#${evento.codiceEvento}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Data:</div>
									 		<div class="col-lg-7">${evento.dataEvento}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Ora:</div>
									 		<div class="col-lg-7">${evento.ora}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Luogo:</div>
									 		<div class="col-lg-7">${evento.luogo}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Descrizione:</div>
									 		<div class="col-lg-7">${evento.descrizione}</div>
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<div class="nomeriga col-lg-5">Partecipanti:</div>
								 			
									 			<div class="col-lg-7">${evento.numeroPartecipanti}</div>
									 		
								 		</div>
								 	</li>
								 	<li class="list-group-item bg-light">
								 		<div class="row">
								 			<c:set var="user" value='${sessionScope["currentSessionUser"]}'/>
							 				<c:set var="accessDone" value='${sessionScope["accessDone"]}' />
								 			<c:if test="${accessDone}">
								 				<input type="text" class="d-none" id="usernameE" name="usernameE" value="${currentSessionUser.username}">
								 				<button type="button" class="btn btn-sm btn-primary btn-block text-uppercase" 
								 			name="partecipabtn" id="partecipabtn" value="${evento.codiceEvento}" onclick="partecipa(this.value)"
								 			>Partecipa all'Evento</button>
								 			</c:if>
								 			<c:if test="${accessDone==null}">
								 				<form>
								 					<div class="form-group">
														<button type="submit" class="loginbtn btn btn-primary" disabled>Loggati per partecipare all'evento</button>
													</div>
								 				</form>
								 			</c:if>
								 		</div>
								 	</li>
								</ul> 
							</div>
							
						</div>
						
					</div>
				
				
				<h4 style="margin-top: 30px">Descrizione</h4>
				<div class="container-fluid" style="border-top:1px black solid;">
					<br>
					${evento.descrizione}
				</div>
			
				
			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light" id="rightpanel">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>