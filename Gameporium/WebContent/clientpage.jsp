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
<%@include file="/WEB-INF/Includes/header.jsp"%>
	<script src="scripts/cart.js" type="text/javascript"></script>
	<script src="scripts/formvalidation.js" type="text/javascript"></script>
	<script src="scripts/payment.js" type="text/javascript"></script>
<link rel="stylesheet" href="pagestyle.css" type="text/css">

</head>

<body style="background-color: #343a40">
	<div class="allpagecontainer container-fluid bg-light">
		<!-- sistema di colonne -->
		<div class="row">

			<!-- colonna sinistra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->

			<!-- colonna centrale -->
			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 bg-light" id="pagacenter">
				
				
				<c:set var="user" value='${sessionScope["currentSessionUser"]}' />
				<c:set var="userchoice" value='${param["azione"]}' />


				<c:choose>
					<c:when test="${userchoice== 'dati'}">
					
						<div class="sectionstyle">Dati utente</div>
						
						<div class="dataform">
							<form action="register" name="registerform" method="post" id="reg">
								<div class="form-group">
									<label for="nome">Nome</label> <input type="text"
										class="form-control" id="nome" name="name" value="${user.nome}"
										required> <label for="nome">Cognome</label> <input
										type="text" class="form-control" id="cognome" name="surname"
										value="${user.cognome}" required>
								</div>
	
								<div class="form-group">
									<label for="username">Username</label> <input type="text"
										class="form-control" id="username" name="user"
										value="${user.username}" required>
								</div>
	
								<div class="form-group">
									<label for="recapito">Recapito</label> <input type="email"
										class="form-control" name="mail" id="mail" value="${user.recapito}"
										required>
								</div>
	
								<div class="form-group">
									<label for="pw">Password</label> <input type="password"
										class="form-control" name="pass" id="pass" value="${user.passwordU}"
										required>
								</div>
	
								<div class="form-group">
									<label for="pwconf">Conferma password</label> <input
										type="password" class="form-control" name="confirmPass" id="confirmPass"
										placeholder="Confirm Password" required>
								</div>
	
								<div class="form-group">
									<label class="checkbox-inline"> <input type="checkbox"
										name="check" required> Accetto i <a href="#">Termini
											di Uso</a> e le <a href="#">Norme della privacy</a>
									</label>
								</div>
								<div class="form-group" style="float: center">
									<button type="button"
										onclick="validateRegister(document.registerform)"
										class="btn btn-success btn-lg btn-block"
										style="max-width: 400px;">Modifica dati</button>
								</div>
							</form>
						</div>
					</c:when>

					<c:when test="${userchoice=='ordini'}">
					<jsp:include page="/adminorder">
					 <jsp:param name="username" value="${sessionScope.currentSessionUser.username}"/>
					</jsp:include>
						<div class="sectionstyle">I miei ordini</div>

						<div class="container-fluid" id="contable">
							<h2>Elenco ordini</h2>
							<p></p>
							<table class="table" id="ordertable">
								<thead>
									<tr>
										<th>Codice Ordine</th>
										<th>Username</th>
										<th>Data Ordine</th>
										<th>Data Spedizione</th>
										<th>Importo</th>
										<th>Indirizzo Spedizione</th>
										<th>Indirizzo Fatturazione</th>
										<th>Tipo Spedizione</th>
										<th>Codice Spedizione</th>
										<th>Codice Pagamento</th>
										<th>Metodo Pagamento</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="ordine" value='${sessionScope["listaOrdini"]}' />
									<c:forEach items="${ordine}" var="item">
										<%@include file="/WEB-INF/Includes/ordertable.jsp"%>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>

					<c:when test="${userchoice=='pagamento'}">
					
					<jsp:include page="/pagamenti">
					 <jsp:param name="username" value="${sessionScope.currentSessionUser.username}"/>
					 <jsp:param name="retrieve" value="true"/>
					</jsp:include>
					
					<c:set var="creditCardSuccess" value='${param["creditCardSuccess"]}' />
					<c:if test="${creditCardSuccess}">
						<div class="popup alert alert-success alert-dismissible fade-in" role="success">
						  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
						  Hai aggiunto una nuova carta di credito!
						</div>
					</c:if>

					<c:set var="error" value='${param["cardNotAdded"]}' />
					<c:if test="${error}">
						<div class="popup alert alert-success alert-dismissible fade-in" role="error">
						  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
						  Non e' stato possibile aggiungere la carta da te inserita, controlla meglio i dati!
						</div>
					</c:if>
					
					<c:set var="metodi" value='${sessionScope["metodi"]}' />
			
					<div class="sectionstyle">I miei metodi di pagamento</div>
						
					<div class="row">
						<div class="col-lg-2"></div>
						<div class="col-lg-8 col-xs-12">
							
							<c:forEach items="${metodi}" var="item"> 
								<div class="credcard" id="${item.secureCode}">
								<form id="hiddenform" name="hiddenform">
									<input type="hidden" name="username" id="username" value="${currentSessionUser.username}">
									<input type="hidden" name="securecode" id="securecode" value="${item.secureCode}">
								</form>
								
									<table class="table fixedtable">
									  <tbody>
									    <tr>
									      <td ><i class="far fa-credit-card"></i> ${item.circuito}</td>
									      <td>termina con ${item.secureCode}</td>
									      <td>scade il ${item.scadenza}</td>
									      <td><button type="button" onclick="deleteCard()">Elimina</button></td>
									    </tr>
									  </tbody>
									</table>		
								
								</div>			
							</c:forEach>

							
							<a data-toggle="collapse" href="#newcard" role="button" aria-expanded="false" aria-controls="newcard">
								<i class="fas fa-caret-down"></i> Nuova carta
							</a>

								<div class="row">
									<div class="col">
										<div class="collapse multi-collapse" id="newcard">

											<div class="card card-body">
												<form action="pagamenti" id="insertform" name="insertform" method="post">
													<div class="form-row">
														<div class="form-group col-md-2">
															<label for="mesescadenza">Circuito</label>
															<select class="form-control" id="circuito" name="circuito">
														        <option>Visa</option>
														        <option>American Express</option>
																<option>MasterCard</option>
														    </select>
														</div>
														<div class="form-group col-md-4">
															<label>Numero</label> <input type="text"
																class="form-control" name="numero" id="numero">
														</div>
														<div class="form-group col-md-4">
															<label for="mesescadenza">Scadenza</label>
															<select class="form-control" id="mesescadenza" name="mesescadenza">
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
														    </select>
														    <select class="form-control" id="annoscadenza" name="annoscadenza">
														        <option>2019</option>
														        <option selected ="selected">2020</option>
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
														    </select>
														    
														    <input type="hidden" id="scadenza" name="scadenza" value="01/2020">
														    <input type="hidden" id="insert" name="insert" value="true">
														    <input type="hidden" id="username" name="username" value="${currentSessionUser.username}">
														</div>
														<div class="form-group col-md-2">
															<label>CVV</label> 
															<input type="text" name="cvv" id="cvv" oninput="limitCvv(document.insertform.cvv)"
																class="form-control" min="3" max="3">
														</div>

													</div>

													<button class="btn btn-primary" data-toggle="collapse"
														type="button" onclick="validateCreditCard(document.insertform)">Aggiungi</button>
														


												</form>
											</div>


										</div>
													<br><br>
								<jsp:include page="/preset"/>
										
										<form id="preset">
											<label>Metodo di pagamento preferito:</label> 
												<select class="form-control" id="pselect" name="pselect" 
		 
												onchange="changePreset(this)">
													
													 <option value="" selected disabled hidden="hidden">${sessionScope.userFavCircuito} che termina con ${sessionScope.userFavSecureCode}</option>
										       <c:forEach items="${metodi}" var="item"> 
										        	<option value="${item.secureCode}">${item.circuito} che termina con ${item.secureCode}</option>
										       </c:forEach>
										    </select>
										</form>

									</div>

								</div>
							

						
						</div>
					</div>
				
					</c:when>
					
					<c:when test="${userchoice=='indirizzi'}">
					
						<div class="sectionstyle">I miei indirizzi di spedizione</div>
							
						<div class="row">
							<div class="col-lg-2"></div>
							<div class="col-lg-8 col-xs-12">
								
	<%-- 							<c:forEach items="${cartprods}" var="item"> --%>
										<%@include file="/WEB-INF/Includes/indirizzo.jsp"%>				
	<%-- 							</c:forEach> --%>
	
								
								<a data-toggle="collapse" href="#newcard" role="button" aria-expanded="false" aria-controls="newcard">
									<i class="fas fa-caret-down"></i> Nuovo indirizzo
								</a>
	
									<div class="row">
										<div class="col">
											<div class="collapse multi-collapse" id="newcard">
	
												<div class="card card-body">
													<form>
														<div class="form-row">
															<div class="form-group col-md-3">
																<label>Città</label> <input type="text" id="citta"
																	class="form-control">
															</div>
															<div class="form-group col-md-4">
																<label>Via</label> <input type="text" id="via"
																	class="form-control">
															</div>
															<div class="form-group col-md-1"></div>
															<div class="form-group col-md-2">
																<label>N. civ.</label> <input type="text" id="nciv"
																	class="form-control">
															</div>
															<div class="form-group col-md-2">
																<label>CAP</label> <input type="text" id="cap"
																	class="form-control">
															</div>
														</div>
	
														<a class="btn btn-primary" data-toggle="collapse"
															href="#multiCollapseExample1" role="button"
															aria-expanded="false"
															aria-controls="multiCollapseExample1">Aggiungi</a>
	
													</form>
												</div>							
	
											</div>
	
										</div>
	
									</div>
								
								<br><br>
								<label for="sceltag">Seleziona predefinito</label>
								<select class="form-control" id="sceltag" name="sceltag">
							        <option>Indirizzo 1</option>
							        <option>Indirizzo 2</option>
							        <option>Indirizzo 3</option>
							    </select>
							
							</div>
						</div>
			
					</c:when>

				</c:choose>

			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>

</body>
</html>
