<!DOCTYPE html>
<html lang="en">

<head>
<title>prova</title>
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
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.navbar-nav .nav-item .nav-link {
	color: dark;
	text-align: center;
}

.navbar-nav .nav-item.active .nav-link, .navbar-nav .nav-item:hover .nav-link
	{
	background-color: #8c8c8c
}

.navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
}

.navbar-toggler {
	background: #212121; /* pick your color */
}

.active-cyan-2 input[type=text]:not ([readonly] ) {
	border-bottom: 1px solid #4dd0e1;
	box-shadow: 0 1px 0 0 #4dd0e1;
	background: #343a40;
	border-color: transparent
}
</style>

<%@include file="/WEB-INF/Includes/header.jsp"%>
</head>

<body style="background-color: #343a40">
	<div class="container-fluid bg-light" style="margin-top: 0">
		<!-- sistema di colonne -->
		<div class="row">
			<!-- colonna sinistra -->
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-md-block bg-light">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->
			<!-- colonna centrale -->
			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 bg-light"
				style="margin-bottom: 20px; margin-top: 30px">

				<div class="container">
					<div class="row">

						<div class="col-sm-12 col-md-6 col-lg-6 mx-auto">
							<div class="card card-signin my-5">
								<div class="card-body">
									<h5 class="card-title text-center">Accedi</h5>
									<form action="login" class="form-signin">
									
										<%
									    Cookie[] cookies=request.getCookies();
									    String password = "";
									    String user = "";
									    if (cookies != null) 
									    {
									    	for (Cookie cookie : cookies) 
									        {
									           if(cookie.getName().equals("savePass"))
									           {
									               password = cookie.getValue();
									           }
									           if(cookie.getName().equals("saveUser"))
									           {
									        	   user = cookie.getValue();
									           }
									        }
									    }
										%>
									
										<div class="form-label-group" style="padding: 5px">
											<input type="text" id="inputEmail" name="un"
												class="form-control" placeholder="Username" name="un" autocomplete="off" value="<%=user%>" required
												autofocus>
										</div>

										<div class="form-label-group" style="padding: 5px">
											<input type="password" id="inputPassword" name="pw"
												class="form-control" placeholder="Password" name="pw" autocomplete="off" value="<%=password%>" required>
										</div>

										<div class="form-check text-right" style="margin: 17px">
										    <input type="checkbox" class="form-check-input active unchecked" id="exampleCheck1" name="remember">
										    <label class="form-check-label" for="exampleCheck1">Ricordami</label>
										</div>

										<button
											class="btn btn-lg btn-primary btn-block text-uppercase"
											type="submit">Accedi</button>
										<hr class="my-4">
										<button
											class="btn btn-md btn-facebook btn-block text-uppercase"
											type="submit" onclick="window.location='/Gameporium/register.jsp';">
											<i class="fab fa-facebook-f mr-2"></i> Registra un nuovo account
										</button>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div class="clearfix col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-md-block" style="border-left:1px">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>