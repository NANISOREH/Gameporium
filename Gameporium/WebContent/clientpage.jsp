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
<link rel="stylesheet" href="pagestyle.css" type="text/css">
<script src="scripts/cart.js" type="text/javascript"></script>
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
			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 bg-light">
				
				
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
										class="form-control" name="mail" value="${user.recapito}"
										required>
								</div>
	
								<div class="form-group">
									<label for="pw">Password</label> <input type="password"
										class="form-control" name="pass" value="${user.passwordU}"
										required>
								</div>
	
								<div class="form-group">
									<label for="pwconf">Conferma password</label> <input
										type="password" class="form-control" name="confirmPass"
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
			
					</c:when>

					<c:when test="${userchoice=='pagamento'}">
			
					<div class="sectionstyle">I miei metodi di pagamento</div>
						
					<div class="row">
						<div class="col-lg-2"></div>
						<div class="col-lg-8 col-xs-12">
							
<%-- 							<c:forEach items="${cartprods}" var="item"> --%>
									<%@include file="/WEB-INF/Includes/creditcard.jsp"%>				
<%-- 							</c:forEach> --%>

							
							<a data-toggle="collapse" href="#newcard" role="button" aria-expanded="false" aria-controls="newcard">
								<i class="fas fa-caret-down"></i> Nuova carta
							</a>

								<div class="row">
									<div class="col">
										<div class="collapse multi-collapse" id="newcard">

											<div class="card card-body">
												<form>
													<div class="form-row">
														<div class="form-group col-md-3">
															<label>Intestatario</label> <input type="text"
																class="form-control">
														</div>
														<div class="form-group col-md-4">
															<label>Numero</label> <input type="text"
																class="form-control">
														</div>
														<div class="form-group col-md-3">
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
														        <option>2020</option>
														        <option>2021</option>
														        <option>2022</option>
														        <option>2023</option>
														        <option>2024</option>
														        <option>2025</option>
														        <option>2026</option>
														        <option>2027</option>
														        <option>2028</option>
														    </select>
														</div>
														<div class="form-group col-md-2">
															<label>CVV</label> <input type="text"
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
							<label for="sceltag">Seleziona predefinita</label>
							<select class="form-control" id="sceltag" name="sceltag">
						        <option>Carta 1</option>
						        <option>Carta 2</option>
						        <option>carta 3</option>
						    </select>
						
						</div>
					</div>
				
					</c:when>
					
					<c:when test="${userchoice=='indirizzi'}">
			
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
