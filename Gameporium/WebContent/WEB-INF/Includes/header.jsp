<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page
  [session = "true"]
%>

<%@ page import="javax.servlet.*" %> 
<body>
<!-- navbar -->
  <nav class="navbar navbar-dark navbar-expand-sm" style="margin-top: 0px">
    <a class="navbar-brand text-white-80" href="/Gameporium/home.jsp"><img src="LOGOPLACEH.png" class="rounded mx-auto d-block" alt="Responsive image" style="margin-bottom: 0; max-width: 200px; max-height: 50%"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle text-center" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Giochi
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Action</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Something else here</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			Accessori
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Action</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Something else here</a>
	        </div>
	      </li>
        
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Eventi
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Action</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Something else here</a>
	        </div>
	      </li>
	      
	      <c:set var = "openLogin" scope = "session" value = "false"/>
	     
	      <c:choose>
		    <c:when test="${openLogin==true}">
			  <li class="nav-item d-block d-sm-none" style="border-top: 1px solid #000000">
			    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Area Utente</a>
			  </li>
		    </c:when>   
	      </c:choose>

	      <c:choose>
		    <c:when test="${openLogin==false}">
			  <li class="nav-item d-block d-sm-none" style="border-top: 1px solid #000000">
			    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Accedi o registrati</a>
			  </li>
		    </c:when>   
	      </c:choose>
	      
	      <li class="nav-item d-block d-sm-none">
	      	<a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Il tuo carrello</a>
	      </li>
	      
	      
	      </ul>
		</div>
	    
	<div class="navbar-collapse collapse w-100 order-3 dual-collapse2" id="collapsibleNavbarRight">
      <ul class="navbar-nav ml-auto .d-md-none .d-lg-block">
	      
	      <li class="nav-item mr-auto" style="margin-bottom:5px;">
			<form class="form-inline md-form form-sm active-cyan active-cyan-2 mt-2">
			  <i class="fas fa-search" aria-hidden="true"></i>
			  <input class="form-control form-control-sm ml-3 w-75" type="text" placeholder="Search" aria-label="Search">
			</form>
	      </li>
	      
	      <c:choose>
		    <c:when test="${openLogin==true}">
			  <li class="nav-item d-block d-sm-none" style="border-top: 1px solid #000000">
			    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Area Utente</a>
			  </li>
		    </c:when>   
	      </c:choose>
	      
	      <c:choose>
		    <c:when test="${openLogin==false}">
			  <li class="nav-item d-block d-sm-none" style="border-top: 1px solid #000000">
			    <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Accedi o registrati</a>
			  </li>
		    </c:when>   
	      </c:choose>
	  
	  </ul>
    </div> 
  
  </nav>
  <!-- end navbar -->

</body>
</html>