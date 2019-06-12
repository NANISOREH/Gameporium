<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="scripts/formvalidation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<meta charset="UTF-8">
</head>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <style>
  .navbar-nav .nav-item .nav-link {
    color: dark;
    text-align: center;
  }
  
  .navbar-nav .nav-item.active .nav-link, .navbar-nav .nav-item:hover .nav-link {
	    background-color: #8c8c8c
  }
  
  .navbar-toggler-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
  }
  
  .navbar-toggler {
    background: #212121; /* pick your color */
  }
  
  .active-cyan-2 input[type=text]:not([readonly]) {
    border-bottom: 1px solid #4dd0e1;
    box-shadow: 0 1px 0 0 #4dd0e1;
    background: #343a40;	
	border-color: transparent
  } 
  </style>

<%@ page import="javax.servlet.*"%>
<%@ page import="Beans.*"%>

<body>

	
	<c:set var="loginFail" value='${requestScope["loginFail"]}' />
	<c:set var="registered" value='${requestScope["registered"]}' />	
	<c:set var="accessDone" value='${sessionScope["accessDone"]}' />
	<c:set var="currentUser" value='${sessionScope["currentSessionUser"]}' />
			
	<c:if test="${loginFail}">
		<div class="alert alert-warning alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Attenzione,</strong> dati di login errati, riprovare!
		</div>
	</c:if>
		
	<c:if test="${registered}">
		<div class="alert alert-success alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Complimenti!</strong> Sei registrato a Gameporium, effettua l'accesso usando il tasto Login.
		</div>
	</c:if>

	<!-- navbar -->
	<nav class="navbar navbar-dark navbar-expand-sm"
		style="margin-top: 0px">
		<a class="navbar-brand text-white-80" href="/Gameporium/home.jsp"><img
			src="images/LOGOPLACEH.png" class="rounded mx-auto d-block"
			alt="Responsive image"
			style="margin-bottom: 0; max-width: 200px; max-height: 50%"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-center" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Giochi </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<form action="product">
						<a class="dropdown-item" href="/Gameporium/productselection.jsp?categoria=gioco&attribute=descrizioneCategoria&value=tavolo">Giochi da tavolo</a> 
						<a class="dropdown-item" href="/Gameporium/productselection.jsp?categoria=gioco&attribute=descrizioneCategoria&value=ruolo">Giochi di ruolo</a> 
						<a class="dropdown-item" href="/Gameporium/productselection.jsp?categoria=gioco&attribute=descrizioneCategoria&value=carte">Giochi di carte</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="/Gameporium/productselection.jsp?categoria=gioco">Mostra tutti</a>
						</form>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Accessori </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/Gameporium/productselection.jsp?categoria=accessorio&attribute=descrizioneCategoria&value=tavolo">Accessori per GdT</a> <a
							class="dropdown-item" href="/Gameporium/productselection.jsp?categoria=accessorio&attribute=descrizioneCategoria&value=ruolo">Accessori per GdR</a> <a 
							class="dropdown-item" href="/Gameporium/productselection.jsp?categoria=accessorio&attribute=descrizioneCategoria&value=carte">Accessori per GdC</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/Gameporium/productselection.jsp?categoria=accessorio">Mostra tutti</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Eventi </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/Gameporium/events.jsp">Mostra tutti gli eventi</a>
						<div class="dropdown-divider"></div>
						<form class="form-inline md-form form-sm active-cyan active-cyan-2 mt-2">
						<i class="fas fa-search" aria-hidden="true"></i> 
						<input class="form-control form-control-sm ml-3 w-75" type="text" placeholder="Cerca Città" aria-label="Search">
					</form>
					</div></li>
					
				
				
				<c:if test="${accessDone}">
					<li class="nav-item d-block d-sm-none"
						style="border-top: 1px solid #000000"><a class="nav-link"
						href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Area Utente</a>
					</li>
				</c:if>
	
				<c:if test="${accessDone != true}">
					<li class="nav-item d-block d-sm-none"
						style="border-top: 1px solid #000000"><a class="nav-link"
						href="/Gameporium/mobilelogin.jsp" id="navbarDropdown" role="button">Accedi</a>
					</li>
					<li class="nav-item d-block d-sm-none"><a class="nav-link"
						href="/Gameporium/register.jsp" id="navbarDropdown" role="button">Registrati</a>
					</li>
				</c:if>
				
				<li class="nav-item d-block d-sm-none"><a class="nav-link"
					href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Il
						tuo carrello</a></li>


			</ul>
		</div>

		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2 d-none d-md-block"
			id="collapsibleNavbarRight">
			<ul class="navbar-nav ml-auto d-none d-md-block">

				<li class="nav-item mr-auto" style="margin-bottom: 5px;">
					<form
						class="form-inline md-form form-sm active-cyan active-cyan-2 mt-2">
						<i class="fas fa-search" aria-hidden="true"></i> <input
							class="form-control form-control-sm ml-3 w-75" type="text"
							placeholder="Search" aria-label="Search">
					</form>
				</li>

			</ul>
			
			
			<c:if test="${accessDone == null}">
				<button type="button" id="dropdownMenu1" data-toggle="dropdown"
					class="btn btn-outline-secondary dropdown-toggle">
					Accedi o registrati <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right mt-2">
					<li class="px-3 py-2">
						<form action="login" method="post" class="form" role="form" name="loginform">
							
							<div class="form-group">
								<input id="emailInput" placeholder="Username" onchange="validateLogin(document.loginform)"
									class="form-control form-control-sm" type="text" name="un" 
									required autocomplete="off" value="${cookie.saveUser.value}">
							</div>
							

							<div class="form-group">
								<input id="passwordInput" placeholder="Password" onchange="validateLogin(document.loginform)" required
									class="form-control form-control-sm" type="password" name="pw" autocomplete="off" value="${cookie.savePass.value}">
							</div>
							
							<div class="form-group">
								<button type="submit" class="btn btn-primary btn-block">Login</button>
							</div>
							
							<div class="form-check text-right">
							    <input type="checkbox" class="form-check-input active unchecked" id="exampleCheck1" name="remember">
							    <label class="form-check-label" for="exampleCheck1">Ricordami</label>
							</div>
							
							<div class="form-group text-right">
								<small><a href="/Gameporium/register.jsp">Registrati</a></small>
							</div>
						
						</form>
					</li>
				</ul>
			</c:if>
				
			<c:if test="${accessDone}">
				<div class="navbar-nav nav-item dropdown">
					
					<div class="nav-link dropdown-toggle text-center" 
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						 	Benvenuto, <c:out value="${currentUser.username}"/>
					</div>	
					<form action="logout" method="get" class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" style="text-align: left; " href="/Gameporium/clientpage.jsp?azione=dati">Area Utente</a>
						<a class="dropdown-item" style="text-align: left" href="/Gameporium/clientpage.jsp?action=2">Dati Anagrafici</a>
						<a class="dropdown-item" style="text-align: left" href="/Gameporium/clientpage.jsp?action=3">I miei Ordini</a>
						<a class="dropdown-item" style="text-align: left" href="/Gameporium/clientpage.jsp?action=4">Carrello</a>
						<div class="dropdown-divider"></div>
						<div style="text-align: center"><button class="btn btn-primary" type="submit">Logout</button></div>
					</form>
				</div>
			</c:if>
		
		</div>

	</nav>
	<!-- end navbar -->
	
</body>
</html>