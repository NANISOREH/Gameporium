<!DOCTYPE html>

<html lang="en">



<head>

<title>Gameporium</title>

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

<script src="scripts/formvalidation.js" type="text/javascript"></script>
<script src="scripts/payment.js" type="text/javascript"></script>
<link rel="stylesheet" href="pagestyle.css" type="text/css">



<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/Includes/header.jsp"%>

<link rel="stylesheet" href="pagestyle.css" type="text/css">

</head>



<body>
	
	<jsp:include page="/pagamenti">
	 <jsp:param name="username" value="${sessionScope.currentSessionUser.username}"/>
	 <jsp:param name="retrieve" value="true"/>
	</jsp:include>
	<c:set var="metodi" value='${sessionScope["metodi"]}' />
	
	
		
	<div class="allpagecontainer container-fluid ">

		<!-- sistema di colonne -->
		<div class="row">

			<!-- colonna sinistra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block ">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->

			<!-- colonna centrale -->

			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 ">
				<c:set var="user" value='${sessionScope["currentSessionUser"]}' />
				<c:set var="newCard" value='${param["newCard"]}' />
				<div class="sectionstyle">
					Metodo di pagamento
				</div>
				
				<div class="form-group">
					<c:if test="${metodi!=null}">
						<jsp:include page="/preset">
							<jsp:param name="newCard" value="${newCard}"/>
						</jsp:include>
						<div id="preset">
							<br>
							<select
								class="form-control" id="pselect" name="pselect">

								<option value="${sessionScope.userFavSecureCode}" selected disabled hidden="hidden">${sessionScope.userFavCircuito}
									che termina con ${sessionScope.userFavSecureCode}</option>
								<c:forEach items="${metodi}" var="item">
									<option value="${item.secureCode}">${item.circuito}
										che termina con ${item.secureCode}</option>
								</c:forEach>
							</select>
						</div>

					</c:if>
					<c:set var="creditCardSuccess"
						value='${param["creditCardSuccess"]}' />
					<c:if test="${creditCardSuccess}">
						<div class="popup alert alert-success alert-dismissible fade-in"
							role="success">
							<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
							Hai aggiunto una nuova carta di credito!
						</div>
					</c:if>
					<a data-toggle="collapse" href="#newcard" role="button"
						aria-expanded="false" aria-controls="newcard"> <i
						class="fas fa-caret-down"></i> Nuova carta
					</a>
					<form id="ccform" name="ccform" action="pagamenti" method="post">
						<div class="row">
							<div class="col">
								<div class="collapse multi-collapse" id="newcard">

									<div class="card card-body" style="color:black">
										<div class="form-row">
											<div class="form-group col-md-2">
												<label for="mesescadenza">Circuito</label> <select
													class="form-control" id="circuito" name="circuito">
													<option>Visa</option>
													<option>American Express</option>
													<option>MasterCard</option>
												</select>
											</div>
											<div class="form-group col-md-4">
												<label>Numero</label> <input type="text"
													class="form-control" name="numero">
											</div>
											<div class="form-group col-md-4">
												<label for="mesescadenza">Scadenza</label> <select
													class="form-control" id="mesescadenza" name="mesescadenza">
													<option>01</option>
													<option>02</option>
													<option>03</option>
													<option>04</option>
													<option>05</option>
													<option>06</option>
													<option>07</option>
													<option>08</option>
													<option>09</option>
													<option>10</option>
													<option>11</option>
													<option>12</option>
												</select> <select class="form-control" id="annoscadenza"
													name="annoscadenza">
													<option>2019</option>
													<option selected="selected">2020</option>
													<option>2021</option>
													<option>2022</option>
													<option>2023</option>
													<option>2024</option>
													<option>2025</option>
													<option>2026</option>
													<option>2027</option>
													<option>2028</option>
													<option>2029</option>
													<option>2030</option>
												</select> <input type="hidden" id="scadenza" name="scadenza"
													value="01/2020"> <input type="hidden" id="insert"
													name="insert" value="true"> <input type="hidden"
													id="username" name="username"
													value="${currentSessionUser.username}"> <input
													type="hidden" name="isOrder" value="true">
											</div>
											<div class="form-group col-md-2">
												<label>CVV</label> <input type="text" name="cvv" id="cvv"
													oninput="limitField(document.ccform.cvv, 3)"
													class="form-control" min="3" max="3">
											</div>

										</div>

										<input type="hidden" id="scadenza" name="scadenza"
											value="01/2020"> <input type="hidden" id="insert"
											name="insert" value="true"> <input type="hidden"
											id="username" name="username"
											value="${currentSessionUser.username}">

										<button class="btn btn-primary" data-toggle="collapse"
											type="button" onclick="validateCreditCard(document.ccform)">Aggiungi</button>



									</div>



								</div>


							</div>

						</div>
					</form>

				</div>



				<div class="sectionstyle">
					Indirizzo di consegna
				</div>
				<c:set var="metodi" value='${sessionScope["metodi"]}' />


				<form action="purchase" method="post" id="ordinafrm" name="ordinafrm"
					method="post">

					<div class="form-group">
						<label for="indirizzo">Indirizzo:</label> <input type="text"
							class="form-control" id="indirizzo" name="indirizzo">
					</div>
					<div class="form-group">
						<label for="ncivico">Num.civico:</label> <input type="number" 
							class="form-control" id="ncivico" onInput="limitField(this, 3)" name="ncivico">
					</div>

					<div class="form-group">
						<label for="cap">Cap:</label> <input type="number"
							class="form-control" id="cap" name="cap" onInput="limitField(this, 5)">
					</div>
					
					<div class="form-group">
						<label for="citta">Città:</label> <input type="text"
							class="form-control" id="citta" name="citta">
					</div>
					
					<input type="hidden" id="jsonaddress" name="jsonaddress" value="1">
					<input type="hidden" id="metodoselect" name="metodoselect" value="${sessionScope.userFavCircuito}
									che termina con ${sessionScope.userFavSecureCode}">
					<input type="hidden" id="importo" name="importo" value="${sessionScope.totale}">
					<input type="hidden" id="username" name="username" value="${sessionScope.currentSessionUser.username}">
					
					<div class="form-group">
						<button type="button" id="spedizione" name="spedizione"
							class="btn btn-success btn-lg btn-block" value="" onClick="startOrder()"
							style="max-width: 400px; margin-top: 70px;">Completa
							l'ordine!</button>
					</div>
													
													
					
				</form>

				


			</div>


			<!-- colonna destra -->

			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block">

				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>

			</div>

			<!-- fine sistema di colonne -->

		</div>

	</div>

	<%@include file="/WEB-INF/Includes/footer.jsp"%>

</body>
</html>