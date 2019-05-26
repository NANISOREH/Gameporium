<!DOCTYPE html>
<html lang="en">

<head>
<title>Registrati a Gameporium!</title>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/lt.js"></script>
<script type="text/javascript" src="scripts/formvalidation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>

<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .form-control{
		height: 40px;
		box-shadow: none;
		color: #969fa4;
	}
	.form-control:focus{
		border-color: #5cb85c;
	}
    .form-control, .btn{        
        border-radius: 3px;
    }
</style>

<%@include file="/WEB-INF/Includes/header.jsp"%>
</head>

<body style="background-color: #343a40">

<!-- 	messaggi di errore nella registrazione -->
	<c:set var="notRegistered" value='${requestScope["notRegistered"]}' />
	<c:set var="mailPresent" value='${requestScope["mailPresent"]}' />
	<c:set var="userPresent" value='${requestScope["userPresent"]}' />
	<c:set var="pwerr" value='${requestScope["pwerr"]}' />

	<div class="container-fluid bg-light" style="margin-top: 0">
	<c:if test="${notRegistered}">
		<div class="alert alert-warning alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Attenzione,</strong> la registrazione non � andata a buon fine, riprovare!
		</div>
	</c:if>
	
	<c:if test="${mailPresent}">
		<div class="alert alert-warning alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Attenzione,</strong> l'indirizzo email inserito � gi� in uso!
		</div>
	</c:if>
	
	<c:if test="${pwerr}">
		<div class="alert alert-warning alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Attenzione,</strong> la password deve essere di lunghezza compresa tra 7 e 20 caratteri!
		</div>
	</c:if>
	
	<c:if test="${userPresent}">
		<div class="alert alert-warning alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Attenzione,</strong> l'username inserito � gi� in uso!
		</div>
	</c:if>
	
<!-- 	fine messaggi di errore nella registrazione -->
	
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
			<div class="col-lg-8 col-md-12 bg-light" style="margin-bottom: 1100px; margin-top: 30px">
				<div class = "container">

				    <form action="register" name="registerform" method="post">
						<h2>Registrati</h2>
						<p class="hint-text">Crea un account. Ci vorr� solo un minuto!</p>
				        
				        <div class="form-group">
							<input type="text" class="form-control" name="name" placeholder="Nome" required="required">
							<input type="text" class="form-control" name="surname" placeholder="Cognome" required="required">
						</div>
						
						<div class="form-group">
				        	<input type="text" class="form-control" name="user" placeholder="Username" required="required">
				        </div>
				        
				        <div class="form-group">
				        	<input type="email" class="form-control" name="mail" placeholder="Email" required="required">
				        </div>
						<div class="form-group">
				            <input type="password" class="form-control" name="pass" placeholder="Password" required="required">
				        </div>
						<div class="form-group">
				            <input type="password" class="form-control" name="confirmPass" placeholder="Confirm Password" required="required">
				        </div>        
				        <div class="form-group">
							<label class="checkbox-inline">
								<input type="checkbox" name="check" required="required"> Accetto i <a href="#">Termini di Uso</a> e le <a href="#">Norme della privacy</a>
							</label>
						</div>
						<div class="form-group">
				            <button type="button" onclick="validateRegister(document.registerform)" class="btn btn-success btn-lg btn-block">Registrati adesso!</button>
				        </div>
				    </form>
				</div>
			
			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div class="clearfix col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block"
				style="margin-bottom: 300px" style="border-left:1px">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>