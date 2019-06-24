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

<body onload="myFunctEvento()" style="background-color: #343a40">
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
			<c:when test="${operationchoice== '1'}">
			
			<!-- Inserimento nuovo evento -->
			<c:set var="isPreso" value='${param["isPreso"]}' />
			<c:if test="${isPreso}">
				<div class="popup alert alert-danger alert-dismissible fade-in" role="alert">
				  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
				  <strong>Attenzione,</strong> codice evento già esistente!
				</div>
			</c:if>
			<c:if test="${isPreso==false}">
				<div class="popup alert alert-success alert-dismissible fade-in" role="alert">
				  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
				  evento inserito con successo!
				</div>
			</c:if>		
				<form action="adminevent?operation=1" name="addeventform" method="post" id="reg">				        
				        <div class="form-group">
				        	<label for="codiceEvento">Codice evento:</label>
							<input type="text" class="form-control" id="codiceEvento" name="codiceEvento">
						</div>
				        	
						<div class="form-group">
							<label for="nome">Nome:</label>
				        	<input type="text" class="form-control" id="nome" name="nome"  >
				        </div>
				        
						<div class="form-group">
							<label for="luogo">Luogo:</label>
				            <input type="text" class="form-control" id="luogo" name="luogo"  >
				        </div>
				        
						<div class="form-group">
							<label for="descrizione">Descrizione:</label>
				            <textarea id="descrizione" class="form-control" id="descrizione" name="descrizione" style="height: 100px"></textarea>
				        </div>
				                
				        <div class="form-group ">
							<label for="dataEvento">Data:</label>
				            <input type="date" class="form-control" name="dataEvento" id="dataEvento" style="width:80px"  >
				        </div>
				        
						<div class="form-group">
				        	<label for="ora">Ora:</label>
				        	<input type="time" class="form-control" name="ora" id="ora" style="width:80px"  >
				        </div>

						<div class="form-group">
				        	<label for="locandina">Locandina:</label>
				        	<input type="text" class="form-control" name="locandina" id="locandina" style="width:80px"  >
				        </div>
				        				        
						<div class="form-group" style="float: center">
				            <button type="button" id ="caricabtn" name= "caricabtn" class="btn btn-success btn-lg btn-block" onclick="validateEvent(addeventform)"value="1"
				            style="max-width:400px;">Carica Evento</button>
				        </div>
				    </form>
				</c:when>
				
				<c:when test="${operationchoice== '2'}">
				<c:set var="cod" value='${param["codiceEvento"]}'/>
				<!-- Modifica evento -->

				<form id="modeventform">				        
			        <div class="form-group">
			        	<label for="codEvento">Codice Evento:</label>
						<input type="text" class="form-control" id="codEvento" name="codEvento" value="${cod}"  >
						
					</div>
					<div class="form-group">
			       		<div class="upload-btn-wrapper">
						  <button type="submit" class="btn" id="cercaCRUD">Cerca Evento</button>
						</div>
			       </div>
				</form>
			    
				<form action="adminevent?operation=2" name="modeventformhidden" method="post" id="modeventformhidden">
					<div class="form-group">
			        	<label for="codEvento">Codice Evento:</label>
						<input type="text" class="form-control" id="codiceEvento" name="codiceEvento" readonly="readonly"  >						
					</div>		
					<div class="form-group">
			        	<label for="codEvento">Numero Partecipanti:</label>
						<input type="text" class="form-control" id="numeroPartecipanti" name="numeroPartecipanti" readonly="readonly"  >						
					</div>		         	
						<div class="form-group">
							<label for="nome">Nome:</label>
				        	<input type="text" class="form-control" id="nome" name="nome" readonly="readonly"  >
				        </div>
				        
						<div class="form-group">
							<label for="luogo">Luogo:</label>
				            <input type="text" class="form-control" id="luogo" name="luogo" readonly="readonly"  >
				        </div>
				        
						<div class="form-group">
							<label for="descrizione">Descrizione:</label>
				            <textarea id="descrizione" class="form-control" name="descrizione" readonly="readonly" style="height: 100px"></textarea>
				        </div>
				                
				        <div class="form-group ">
							<label for="dataEvento">Data:</label>
				            <input type="date" class="form-control" name="dataEvento" id="dataEvento" readonly="readonly" style="width:80px"  >
				        </div>
				        
						<div class="form-group">
				        	<label for="ora">Ora:</label>
				        	<input type="time" class="form-control" name="ora" id="ora" readonly="readonly" style="width:80px"  >
				        </div>

						<div class="form-group">
				        	<label for="locandina">Locandina:</label>
				        	<input type="text" class="form-control" name="locandina" id="locandina" readonly="readonly" style="width:80px"  >
				        </div>
				       	<div class="form-group" style="float: center">
					            <button type="submit" class="btn btn-success btn-lg btn-block" value="1"onclick="enablemodevent(modeventformhidden)" 
					            style="max-width:400px;">Modifica Evento</button>
					        </div>	        
						<div class="form-group" style="float: center">
				            <button type="button" id ="caricabtn" name= "caricabtn" disabled="disabled" class="btn btn-success btn-lg btn-block" onclick="validateEvent(modeventformhidden)" value="1"
				            style="max-width:400px;">Carica Evento</button>
				        </div>
				    </form>
				
				<!-- Fine Modifica evento -->
				</c:when>
				
				<c:when test="${operationchoice== '3'}">
				<form id="modeventform">				        
			        <div class="form-group">
			        	<label for="codEvento">Codice Evento:</label>
						<input type="text" class="form-control" id="codEvento" name="codEvento">
					</div>
					<div class="form-group">
			       		<div class="upload-btn-wrapper">
						  <button type="submit" class="btn" id="cercaCRUDe">Cerca Evento</button>
						</div>
			       </div>
				</form>
				
				
				<form action="adminevent?operation=3" name="modeventformhidden" method="post" id="modeventformhidden">				        
					<div class="form-group">
			        	<label for="codEvento">Codice Evento:</label>
						<input type="text" class="form-control" id="codiceEvento" name="codiceEvento" readonly="readonly"  >						
					</div>		
					<div class="form-group">
			        	<label for="codEvento">Numero Partecipanti:</label>
						<input type="text" class="form-control" id="numeroPartecipanti" name="numeroPartecipanti" readonly="readonly"  >						
					</div>		         	
					
					<div class="form-group">
							<label for="nome">Nome:</label>
				        	<input type="text" class="form-control" id="nome" name="nome" readonly="readonly"  >
				        </div>
				        
						<div class="form-group">
							<label for="luogo">Luogo:</label>
				            <input type="text" class="form-control" id="luogo" name="luogo" readonly="readonly"  >
				        </div>
				        
						<div class="form-group">
							<label for="descrizione">Descrizione:</label>
				            <textarea id="descrizione" class="form-control" name="descrizione" readonly="readonly" style="height: 100px"></textarea>
				        </div>
				                
				        <div class="form-group ">
							<label for="dataEvento">Data:</label>
				            <input type="date" class="form-control" name="dataEvento" id="dataEvento" readonly="readonly" style="width:80px"  >
				        </div>
				        
						<div class="form-group">
				        	<label for="ora">Ora:</label>
				        	<input type="time" class="form-control" name="ora" id="ora" readonly="readonly" style="width:80px"  >
				        </div>

						<div class="form-group">
				        	<label for="locandina">Locandina:</label>
				        	<input type="text" class="form-control" name="locandina" id="locandina" readonly="readonly" style="width:80px"  >
				        </div>        
						<div class="form-group" style="float: center">
				            <button type="submit" id ="eliminabtn" name= "eliminabtn" class="btn btn-success btn-lg btn-block" value="1"
				            style="max-width:400px;">Elimina Evento</button>
				        </div>
				    </form>

				</c:when>
				
				<c:when test="${operationchoice== '4'}">
					<jsp:include page="/adminevent"/>
					<c:set var="evento" value='${requestScope["elencoEventi"]}'/>
						<div class="container">
 							<h2>Elenco Eventi</h2>
  							<p></p>
  							  <table class="table">
							    <thead>
							      <tr>
							        <th>Codice evento</th>
							        <th>Nome</th>
							        <th>Luogo</th>						
							        <th>Descrizione</th>
							        <th>Data</th>
							        <th>Ora</th>
							        <th>Numero partecipanti</th>
							        <th></th>
							        <th></th>
							      </tr>
   							    </thead>
							      <tbody>
							     	<c:forEach items="${evento}" var="item">
										<%@include file="/WEB-INF/Includes/eventtable.jsp"%>
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
