<!DOCTYPE html>
<html lang="en">

<head>
<title>Accedi a Gameporium!</title>
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
<script type="text/javascript" src="scripts/formvalidation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="pagestyle.css" type="text/css">

<%@include file="/WEB-INF/Includes/header.jsp"%>
</head>

<body>
	<div class="allpagecontainer container-fluid bg-light">
		<!-- sistema di colonne -->
		<div class="row">
			<!-- colonna sinistra -->
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-md-block bg-light">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->
			<!-- colonna centrale -->
			<div id="mlcenter" class="col-lg-8 col-md-8 col-sm-12 col-xs-12 bg-light">

				<div class="container">
					<div class="row">

						<div class="col-sm-12 col-md-6 col-lg-6 mx-auto">
							<h2>Accedi</h2>
						
							<p class="hint-text">Inizia a fare acquisti su Gameporium!</p>
							<form action="login" name="thisform" class="form-signin">
								
							
								<div class="loginform form-label-group">
									<input type="text" id="inputEmail" name="un"
										class="form-control" placeholder="Username" autocomplete="off" value="${cookie.saveUser.value}" required
										autofocus>
								</div>


								<div class="loginform form-label-group">
									<input type="password" id="inputPassword" name="pw"
										class="form-control" placeholder="Password" autocomplete="off" value="${cookie.savePass.value}" required>
								</div>

								<div class="loginform form-check text-right">
								    <input type="checkbox" class="form-check-input active unchecked" id="exampleCheck1" name="remember">
								    <label class="form-check-label" for="exampleCheck1">Ricordami</label>
								</div>

								<button
									class="btn btn-lg btn-primary btn-block text-uppercase"
									type="button" onclick="validateLogin(document.thisform)">Accedi</button>
								<hr class="my-4">
								<button
									class="btn btn-md btn-facebook btn-block text-uppercase"
									type="button" onclick="window.location='/Gameporium/register.jsp';">
									<i class="fab fa-facebook-f mr-2"></i> Registra un nuovo account
								</button>
							</form>
						</div>

					</div>
				</div>

			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div id="mlrightcol" class="clearfix col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-md-block">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>