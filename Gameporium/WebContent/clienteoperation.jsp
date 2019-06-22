<!DOCTYPE html>
<html lang="en">

<head>
<title>Gameporium</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="pagestyle.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
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
				class="col-lg-4 col-md-4 col-sm-6 col-xs-6 bg-light"
				style="margin-bottom: 500px">
				<%@include file="/WEB-INF/Includes/leftpaneladmin.jsp"%>
			</div>
			<!-- fine colonna sinistra -->
			
			<!-- colonna centrale -->
			<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6 bg-light"
				style="margin-bottom: 1100px; margin-top: 30px">
			<c:set var="operationchoice" value='${param["operation"]}'/>
				
			
			<c:choose>
			<c:when test="${operationchoice== '3'}">
			<form id="modclienteform">				        
			        <div class="form-group">
			        	<label for="username">Username:</label>
						<input type="text" class="form-control" id="user" name="user">
					</div>
					<div class="form-group">
			       		<div class="upload-btn-wrapper">
						  <button type="submit" class="btn" id="cercaCRUDe">Cerca Cliente</button>
						</div>
			       </div>
			</form>
			
			<form action="admincliente?operation=3" name="modclienteformhidden" method="post" id="modclienteformhidden">				        
			        <div class="form-group">
				       	<label for="username">Username:</label>
						<input type="text" class="form-control" id="username" name="username" readonly="readonly"  >
					</div>
				       	
					<div class="form-group">
						<label for="nome">Nome:</label>
				       	<input type="text" class="form-control" id="nome" name="nome"  readonly="readonly">
				    </div>
				       
					<div class="form-group">
						<label for="cognome">Cognome:</label>
				        <input type="text" class="form-control" id="cognome" name="cognome"  readonly="readonly">
				    </div>
				       
					<div class="form-group">
						<label for="passwordU">Password:</label>
				        <input type="password" id="passwordU" class="form-control" name="passwordU" readonly="readonly">
				    </div>
			        				                
			        <div class="form-group ">
						<label for="recapito">Recapito:</label>
			            <input type="text" class="form-control" name="recapito" id="recapito"  readonly="readonly">
			        </div>
				        
					<div class="form-group">
			        	<label for="cartaPred">Carta Predefinita:</label>
			        	<input type="text" class="form-control" name="cartaPred" id="cartaPred" readonly="readonly" >
			        </div>

					<div class="form-group" style="float: center">
			            <button type="submit" id ="caricabtn" name= "caricabtn" class="btn btn-success btn-lg btn-block" value="1"
			            style="max-width:400px;">Elimina Cliente</button>
			        </div>
			    </form>
				
				<!-- Fine Elimina cliente -->
				</c:when>				
				<c:when test="${operationchoice== '4'}">
					<jsp:include page="/admincliente"/>
					<c:set var="cliente" value='${requestScope["elencoClienti"]}'/>
						<div class="container">
 							<h2>Elenco utenti:</h2>
  							<p></p>
  							  <table class="table">
							    <thead>
							      <tr>
							        <th>Username</th>
							        <th>Nome</th>						
							        <th>Cognome</th>
							        <th>Recapito</th>
							        <th></th>
							        <th></th>
							      </tr>
   							    </thead>
							      <tbody>
							     	<c:forEach items="${cliente}" var="item">
										<%@include file="/WEB-INF/Includes/clientetable.jsp"%>
									</c:forEach>
						        </tbody>
  								</table>
  						</div>      
					
				</c:when>
				
				<c:otherwise>
			   	</c:otherwise>
			</c:choose>

			
			</div>
			<!-- fine colonna centrale -->

			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>
