<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<script type="text/javascript" src="scripts/formvalidation.js"></script>
<script type="text/javascript" src="scripts/formProcessing.js"></script>
<script type="text/javascript" src="scripts/animation.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="https://kit.fontawesome.com/48a23e2c00.js"></script>
<meta charset="UTF-8">
</head>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <style>
  .navbar-nav .nav-item .nav-link {
    color: lightgray;
    text-align: center;
  }
  
  .navbar-nav .nav-item.active .nav-link, .navbar-nav .nav-item:hover .nav-link {
	background-color: #331900;
	background-color: #CB6600
  }
  
  .navbar-toggler-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
  }
  
  .navbar-toggler {
    background: #212121; /* pick your color */
  }
  
  .active-cyan-2 input[type=text]:not([readonly]) {
    border-bottom: 1px solid #E07D00;
    box-shadow: 0 1px 0 0 #E07D00;
    background: rgb(20,20,20);	
	border-color: transparent;
	color: lightgrey;
  } 
  
  .msearch
  {
  	margin-bottom: 20px;
  	margin-right:0px;
  }
  
  .carticon
  {
	margin-left: 35px;
	margin-right: 0px;
	color:#E07D00;
  }
  
  a:link
  {
  	color:#E07D00;
  }
  
  .searchbox
  {
  	max-width:180px;
  }
  
  #dropdownMenu1
  {
  	margin-left:50px;
  }
  
  </style>

<body>

	
	<c:set var="loginFail" value='${param["loginFail"]}' />
	<c:set var="registered" value='${requestScope["registered"]}' />	
	<c:set var="accessDone" value='${sessionScope["accessDone"]}' />
	<c:set var="loginSuccess" value='${param["loginSuccess"]}' />
	<c:set var="currentUser" value='${sessionScope["currentSessionUser"]}' />
	<c:set var="logoutDone" value='${param["logoutDone"]}' />
	<c:set var="isAdmin" value='${sessionScope["isAdmin"]}' />
	<c:set var="orderDone" value='${param["orderDone"]}' />
	<c:set var="editDone" value='${param["editDone"]}' />
	
	
				
	<c:if test="${loginFail}">
		<div class="popup alert alert-warning alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Attenzione,</strong> dati di login errati, riprovare!
		</div>
	</c:if>
	
	<c:if test="${logoutDone}">
		<div class="popup alert alert-success alert-dismissible fade-in" role="success">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  Logout effettuato correttamente, alla prossima!
		</div>
	</c:if>
	
	<c:if test="${loginSuccess}">
		<c:if test="${isAdmin == null}">
			<div class="popup alert alert-success alert-dismissible fade-in" role="success">
			  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
			  Sei loggato come <c:out value="${currentUser.username}"/>
			</div>
		</c:if>
	</c:if>
		
	<c:if test="${registered}">
		<div class="popup alert alert-success alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Complimenti!</strong> Sei registrato a Gameporium, effettua l'accesso usando il tasto Login.
		</div>
	</c:if>
	
	<c:if test="${isAdmin}">
		<div class="alert alert-warning alert-dismissible" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Attenzione!</strong> Sei loggato come amministratore (${currentUser.username}).
		</div>
	</c:if>
	
	<c:if test="${orderDone}">
		<div class="popup alert alert-success alert-dismissible fade-in" role="success">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  Ordine effettuato correttamente! È possibile consultare lo stato dell'ordine in "I miei ordini"
		</div>
	</c:if>
	
	<c:if test="${editDone}">
		<div class="popup alert alert-success alert-dismissible fade-in" role="success">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
			Hai cambiato correttamente i tuoi dati!
		</div>
	</c:if>
	
		<script type="text/javascript">
			window.setTimeout(function() {
			    $(".popup").fadeTo(150, 0).slideUp(150, function(){
			        $(this).remove(); 
			    });
			}, 4000);
		</script>

	<!-- navbar -->
	<nav class="navbar navbar-dark navbar-expand-lg"
		style="margin-top: 0px">
		
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		
		<a class="navbar-brand text-white-80" href="/Gameporium/home.jsp"><img
			src="images/LOGOPLACEH.png" class="rounded mx-auto d-block"
			alt="Responsive image"
			style="margin-bottom: 0; max-width: 200px; max-height: 50%"></a>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
		<!-- 				ricerca mobile -->
			<li class = "msearch nav-item d-block d-lg-none mx-auto">
				<form action="productselection.jsp" method="post"
					class="form-inline md-form form-sm active-cyan active-cyan-2 mt-2">
	      			<button class="btn btn-mdb-color btn-rounded btn-sm my-0 ml-sm-2" type="submit">
   						<i class="fas fa-search" aria-hidden="true"></i>
   					</button>
					<input class="searchbox form-control" type="text" name="searchtxt" 
					aria-label="Search" placeholder="Cerca un prodotto">
				</form> 
				
			</li>
<!-- 				ricerca mobile -->
			
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
					</div>
				</li>
				
				<c:if test="${accessDone}">
					<c:if test="${isAdmin == true}">
					<li class="nav-item dropdown d-lg-none"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Area amministratore </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" style="text-align: left; " href="/Gameporium/adminpage.jsp">Area amministratore</a>
						<div class="dropdown-divider"></div>
						<div style="text-align: center"><button class="btn btn-primary" type="submit">Logout</button></div>
					</div></li>

				</c:if>
				<c:if test="${isAdmin != true}">
					<li class="nav-item dropdown d-lg-none"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Area utente </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" style="text-align: left; " href="/Gameporium/clientpage.jsp?azione=dati">Dati Utente</a>
						<a class="dropdown-item" style="text-align: left" href="/Gameporium/clientpage.jsp?azione=ordini">I miei Ordini</a>
						<a class="dropdown-item" style="text-align: left" href="/Gameporium/clientpage.jsp?azione=pagamento">Metodi di Pagamento</a>
						<div class="dropdown-divider"></div>
						
						<form action="logout" method="get">
						<div style="text-align: center"><button class="btn btn-primary" type="submit">Logout</button></div>
						</form>
					</div></li>
					<a class="dropdown-item d-lg-none" style="text-align: center" href="/Gameporium/cart.jsp">
						Carrello <i class="fas fa-shopping-cart" aria-hidden="true"></i>
					</a>
				</c:if>
				</c:if>
	
				<c:if test="${accessDone != true}">
					<li class="nav-item d-block d-lg-none"
						style="border-top: 1px solid #000000"><a class="nav-link"
						href="/Gameporium/mobilelogin.jsp" id="navbarDropdown" role="button">Accedi</a>
					</li>
					<li class="nav-item d-block d-lg-none"><a class="nav-link"
						href="/Gameporium/register.jsp" id="navbarDropdown" role="button">Registrati</a>
					</li>
				</c:if>
				
			</ul>
		</div>


		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2 d-none d-lg-block"
			id="collapsibleNavbarRight">
			
<!-- 			ricerca desktop -->
			<ul class="navbar-nav ml-auto d-none d-lg-block">
				<li class="nav-item mr-auto" style="margin-bottom: 5px;">
					<form action="productselection.jsp" method="post"
						class="form-inline md-form form-sm active-cyan active-cyan-2 mt-2">
		      			<button class="btn btn-mdb-color btn-rounded btn-sm my-0 ml-sm-2" type="submit">
      						<i class="fas fa-search" aria-hidden="true"></i>
      					</button>
						<input class="searchbox form-control" type="text" name="searchtxt" 
						aria-label="Search" placeholder="Cerca un prodotto">
					</form> 
				</li> 
			</ul>
			<!-- 			ricerca desktop -->
			
<!-- 			carrello -->
			<c:set var="cartcard" value='${sessionScope["cartcardinality"]}' />
			<ul class="navbar-nav">
				<li class="nav-item mr-auto carticon d-xs-block">
					<a href="/Gameporium/cart.jsp" style="color: #E07D00;">
      					<i class="fas fa-shopping-cart" aria-hidden="true"></i>
      					<c:out value="${cartcard}"/>
      				</a>
				</li> 
			</ul>
<!-- 			carrello -->

			
<!-- 			login popup -->
			<c:if test="${accessDone == null}">
				<button type="button" id="dropdownMenu1" data-toggle="dropdown"
					class="btn btn-outline-secondary dropdown-toggle" onclick="validateLogin(document.loginform.pw, document.loginform.un)">
					Accedi o registrati <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right mt-2">
				
					<li class="px-3 py-2">
						<form action="login" method="post" class="form" role="form" name="loginform">

							
							<div class="form-group" > 
								<input id="emailInput" placeholder="Username" oninput="validateLogin(document.loginform.pw, document.loginform.un)"
									class="form-control form-control-sm" type="text" name="un" 
									required autocomplete="off" value="${cookie.saveUser.value}">
							</div>
							

							<div class="form-group">
								<input id="passwordInput" placeholder="Password" oninput="validateLogin(document.loginform.pw, document.loginform.un)" required
									class="form-control form-control-sm" type="password" name="pw" autocomplete="off" value="${cookie.savePass.value}">
							</div>
							
							<div class="form-group">
								<button type="submit" class="loginbtn btn btn-primary btn-block" disabled>Login</button>
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
<!-- 			login popup -->
				
			<c:if test="${accessDone}">
				
				<c:if test="${isAdmin == null}">
					<div class="navbar-nav nav-item dropdown">
						
					<button type="button" id="dropdownMenu1" data-toggle="dropdown"
						class="btn btn-outline-secondary dropdown-toggle">
						Benvenuto, <c:out value="${currentUser.username}"/> <span class="caret"></span>
					</button>
					
						<form action="logout" method="get" class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" style="text-align: left; " href="/Gameporium/clientpage.jsp?azione=dati">Dati Utente</a>
							<a class="dropdown-item" style="text-align: left" href="/Gameporium/clientpage.jsp?azione=ordini">I miei Ordini</a>
							<a class="dropdown-item" style="text-align: left" href="/Gameporium/clientpage.jsp?azione=pagamento">Metodi di Pagamento</a>
							<div class="dropdown-divider"></div>
							<div style="text-align: center"><button class="btn btn-primary" type="submit">Logout</button></div>
						</form>
					</div>
				</c:if>
				
				<c:if test="${isAdmin == true}">
					<div class="navbar-nav nav-item dropdown">
						
					<button type="button" id="dropdownMenu1" data-toggle="dropdown"
						class="btn btn-outline-secondary dropdown-toggle">
						Benvenuto, amministratore! <span class="caret"></span>
					</button>
					
						<form action="logout" method="get" class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" style="text-align: left; " href="/Gameporium/adminpage.jsp">Area Amministratore</a>
							<div class="dropdown-divider"></div>
							<div style="text-align: center"><button class="btn btn-primary" type="submit">Logout</button></div>
						</form>
					</div>
				</c:if>
				
			</c:if>
		
		</div>

	</nav>
	<!-- end navbar -->
	
</body>
