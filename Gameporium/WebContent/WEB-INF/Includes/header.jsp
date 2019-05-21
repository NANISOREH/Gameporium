<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="javax.servlet.*"%>
<%@ page import="Beans.*"%>
<body>

	
	<c:set var="loginFail" value='${requestScope["loginFail"]}' />
	<c:set var="registered" value='${requestScope["registered"]}' />	
			
	<c:if test="${loginFail}">
		<div class="alert alert-warning alert-dismissible fade-in" role="alert">
		  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		  <strong>Attenzione,</strong> Dati di login errati, riprovare!
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
			src="LOGOPLACEH.png" class="rounded mx-auto d-block"
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
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Accessori </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Eventi </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

	 			<%  
	  				boolean access = true;
					
	  				if (session.getAttribute("accessDone") != null)
	  					access = (boolean) session.getAttribute("accessDone");
	  				else
	  					access = false;
	 			%> 
				
				<% if (access) { %>
				<li class="nav-item d-block d-sm-none"
					style="border-top: 1px solid #000000"><a class="nav-link"
					href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Area
						Utente</a></li>
				<% } else { %>
				<li class="nav-item d-block d-sm-none"
					style="border-top: 1px solid #000000"><a class="nav-link"
					href="/Gameporium/mobilelogin.jsp" id="navbarDropdown" role="button">Accedi</a>
				</li>
				<li class="nav-item d-block d-sm-none"><a class="nav-link"
					href="/Gameporium/register.jsp" id="navbarDropdown" role="button">Registrati</a>
				</li>
				<% } %>
				
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
			
			
			<% if (!access) { %>
				<button type="button" id="dropdownMenu1" data-toggle="dropdown"
					class="btn btn-outline-secondary dropdown-toggle">
					Accedi o registrati <span class="caret"></span>
				</button>
				<ul class="dropdown-menu dropdown-menu-right mt-2">
					<li class="px-3 py-2">
						<form action="login" method="post" class="form" role="form">
							
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
							
							<div class="form-group">
								<input id="emailInput" placeholder="Username"
									class="form-control form-control-sm" type="text" name="un" autocomplete="off" value="<%=user%>">
							</div>
							

							<div class="form-group">
								<input id="passwordInput" placeholder="Password"
									class="form-control form-control-sm" type="password" name="pw" autocomplete="off" value="<%=password%>">
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
			<% } %>
				
			<% if (access) { %>
			<div class="navbar-nav nav-item dropdown">
			<div class="nav-link dropdown-toggle text-center" 
				id="navbarDropdown" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
				 	Benvenuto, <%
					BeanCliente c = (BeanCliente) session.getAttribute("currentSessionUser");
					out.print(c.getUsername());
					%>
			</div>
				<form action="logout" method="get" class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" style="text-align: center" href="#">Area Cliente</a>
					<a class="dropdown-item" style="text-align: center" href="#">Carrello</a>
					<div class="dropdown-divider"></div>
					<div style="text-align: center"><button class="btn btn-primary" type="submit">Logout</button></div>
				</form>
			</div>
			<% } %>
			
			
			
		
		</div>

	</nav>
	<!-- end navbar -->

</body>
</html>