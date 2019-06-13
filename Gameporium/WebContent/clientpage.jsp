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
</head>

<body style="background-color: #343a40">
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
			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 bg-light"
				style="margin-bottom: 1100px; margin-top: 30px">
			<c:set var="user" value='${sessionScope["currentSessionUser"]}'/>
			<c:set var="userchoice" value='${param["azione"]}'/>

			<c:if test="${userchoice== 'dati'}">
				<form action="register" name="registerform" method="post" id="reg">				        
				        <div class="form-group">
				        	<label for="nome">Nome</label>
							<input type="text" class="form-control" id="nome" name="name" value="${user.nome}" required>
							<label for="nome">Cognome</label>
							<input type="text" class="form-control" id="cognome" name="surname" value="${user.cognome}" required>
						</div>
						
						<div class="form-group">
							<label for="username">Username</label>
				        	<input type="text" class="form-control" id="username" name="user" value="${user.username}" required>
				        </div>
				        
				        <div class="form-group">
				        	<label for="recapito">Recapito</label>
				        	<input type="email" class="form-control" name="mail" value="${user.recapito}" required>
				        </div>
				        
						<div class="form-group">
							<label for="pw">Password</label>
				            <input type="password" class="form-control" name="pass" value="${user.passwordU}" required>
				        </div>
				        
						<div class="form-group">
							<label for="pwconf">Conferma password</label>
				            <input type="password" class="form-control" name="confirmPass" placeholder="Confirm Password" required>
				        </div>
				                
				        <div class="form-group">
							<label class="checkbox-inline">
								<input type="checkbox" name="check" required> Accetto i <a href="#">Termini di Uso</a> e le <a href="#">Norme della privacy</a>
							</label>
						</div>
						<div class="form-group" style="float: center">
				            <button type="button" onclick="validateRegister(document.registerform)" class="btn btn-success btn-lg btn-block" 
				            style="max-width:400px;">Modifica dati</button>
				        </div>
				    </form>
			</c:if>
				
			<c:if test="${userchoice=='ordini'}" />
			
			<c:if test="${userchoice=='carrello'} "/>
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