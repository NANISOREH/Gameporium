<!DOCTYPE html>
<html lang="en">

<head>
<title>Gameporium</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="pagestyle.css" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script type="text/javascript" src="scripts/formvalidation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/Includes/header.jsp"%>
</head>

<body onload ="myFunct()" style="background-color: #343a40">
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
			
			<!-- Inserimento nuovo prodotto -->
			<c:set var="isPreso" value='${param["isPreso"]}' />
			<c:if test="${isPreso}">
				<div class="popup alert alert-danger alert-dismissible fade-in" role="alert">
				  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
				  <strong>Attenzione,</strong> codice Prodotto già esistente!
				</div>
			</c:if>
			<c:if test="${isPreso==false}">
				<div class="popup alert alert-success alert-dismissible fade-in" role="alert">
				  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
				  Prodotto inserito con successo!
				</div>
			</c:if>			
				<form action="adminservlet?operation=1" name="addproductform" method="post" id="reg">				        
				        <div class="form-group">
				        	<label for="codiceProdotto">Codice prodotto:</label>
							<input type="text" class="form-control" id="codiceProdotto" name="codiceProdotto"  >
							<label for="codCat">Categoria:</label>
								  <div id="prova">
								    <select class="form-control" id="nomeCategoria" name="nomeCategoria" onclick="gameoraccessory(value)" >
								    	<option value=" - " selected>-</option>
								        <option value="gioco">Gioco</option>
								        <option value="accessorio">Accessorio</option>
							    	</select>
								  </div>
						</div>
		
						<div class="hideableforms form-group col-7" id="subCat">					
							<div class="hidableforms container" id="subCatGioco">
								<label for="sceltag">Sottocategoria:</label>
							    <select class="form-control" id="sceltag" name="sceltag">
							    	<option value=" - " selected>-</option>
							        <option value="Gioco di ruolo">Gioco di Ruolo</option>
							        <option value="Gioco di carte">Gioco di Carte</option>
							        <option value="Gioco da tavolo">Gioco da Tavolo</option>
							    </select>
							  	<label for="eta">Età:</label>
							  	<input type="text" class="form-control" id="eta" name="eta" >
								<label for="ngiocatori">Numero giocatori:</label>
							  	<input type="text" class="form-control" id="ngiocatori" name="ngiocatori" >
							  	<label for="durata">Durata:</label>
							  	<input type="text" class="form-control" id="durata" name="durata">

							</div>
							 <div class="hidableforms container" id="subCatAccessorio">
							 	  <label for="sceltaa">Sottocategoria:</label>
							      <select class="form-control" id="sceltaa"  name="sceltaa">
							      	  <option value=" - " selected>-</option>
							          <option value="Accessori per giochi di ruolo">Accessorio per Gioco di Ruolo</option>
							          <option value="Accessori per giochi di carte">Accessorio per Gioco di Carte</option>
							          <option value="Accessori per giochi da tavolo">Accessorio per Gioco da Tavolo</option>
							      </select>
							 </div>
				        </div>
				        	
						<div class="form-group">
							<label for="titolo">Titolo:</label>
				        	<input type="text" class="form-control" id="titolo" name="titolo"  >
				        </div>
				        
						<div class="form-group">
							<label for="produttore">Produttore:</label>
				            <input type="text" class="form-control" id="produttore" name="produttore"  >
				        </div>
				        
						<div class="form-group">
							<label for="descrizione">Descrizione:</label>
				            <textarea id="descrizione" class="form-control" name="descrizione" id="descrizione" style="height: 100px"></textarea>
				        </div>
				                
				        <div class="form-group ">
							<label for="quantita">Quantità:</label>
				            <input type="text" class="form-control" name="quantita" id="quantita" style="width:80px"  >
				        </div>
				        
						<div class="form-group">
				        	<label for="prezzo">Prezzo:</label>
				        	<input type="text" class="form-control" name="prezzo" id="prezzo" style="width:80px"  >
				        </div>

						<div class="form-group">
				        	<label for="iva">IVA:</label>
				        	<input type="text" class="form-control" name="IVA" id="iva" style="width:80px"  >
				        </div>
				        
				        <div class="form-group">
					        <label class="container">Offerta
							  <input type="checkbox" value="true" id="offerta" name="offerta">
							  <span class="checkmark"></span>
							</label>
							<label class="container">Novità
							  <input type="checkbox" value="true" id="novita" name="novita">
							  <span class="checkmark"></span>
							</label>
				        </div>
				       
<!-- 				       <div class="form-group"> -->
<!-- 				       		<div class="upload-btn-wrapper"> -->
<!-- 							  <button class="btn">Upload a file</button> -->
<!-- 							  <input type="file" name="foto" id="foto" /> -->
<!-- 							</div> -->
<!-- 				       </div> -->
				        
						<div class="form-group" style="float: center">
				            <button type="button" id ="caricabtn" name= "caricabtn" class="btn btn-success btn-lg btn-block" onclick="validateAddProduct(addproductform)" value="1"
				            style="max-width:400px;">Carica Prodotto</button>
				        </div>
				    </form>
				</c:when>
				
				<c:when test="${operationchoice== '2'}">
				<c:set var="cod" value='${param["codiceProdotto"]}'/>
				<!-- Modifica prodotto -->

				<form id="modproductform">				        
			        <div class="form-group">
			        	<label for="codProdotto">Codice prodotto:</label>
						<input type="text" class="form-control" id="codProdotto" name="codProdotto" value="${cod}"  >
						
					</div>
					<div class="form-group">
			       		<div class="upload-btn-wrapper">
						  <button type="submit" class="btn" id="cercaCRUD">Cerca Prodotto</button>
						</div>
			       </div>
				</form>
				
				<form action="adminservlet?operation=2" name="modproductformhidden" method="post" id="modproductformhidden">				        
				     <div class="form-group">
				        <div class="form-group" id="codiciProdotto">
				        	<label for="codiceProdotto">Codice prodotto:</label>
							<input type="text" class="form-control" id="codiceProdotto" name="codiceProdotto" readonly="readonly"  >
							<label for="codCat">Categoria:</label>
								  <div id="prova">
								    <select class="form-control" id="nomeCategoria" name="nomeCategoria" disabled="disabled" onclick="gameoraccessory(value)" >
								    	<option value="" selected>-</option>
								        <option value="gioco">Gioco</option>
								        <option value="accessorio">Accessorio</option>
							    	</select>
								  </div>
						</div>
					
						<div class="form-group col-7" id="subCat">					
							<div class="hidableforms container" id="subCatGioco">
								<label for="sceltag">Sottocategoria:</label>
							    <select class="form-control" id="descrizioneCategoriaGiochi" name="descrizioneCategoriaGiochi" disabled="disabled" >
							        <option value="Gioco di ruolo">Gioco di Ruolo</option>
							        <option value="Gioco di carte">Gioco di Carte</option>
							        <option value="Gioco da tavolo">Gioco da Tavolo</option>
							    </select>
							  	<label for="eta">Età:</label>
							  	<input type="text"  class="form-control" id="eta" name="eta" readonly="readonly" >
								<label for="ngiocatori">Numero giocatori:</label>
							  	<input type="text" class="form-control" id="numeroGiocatori" name="numeroGiocatori" readonly="readonly" >
							  	<label for="durata">Durata:</label>
							  	<input type="text" class="form-control" id="durata" name="durata" readonly="readonly" >

							</div>
							 <div class="hidableforms container" id="subCatAccessorio">
							 	  <label for="sceltaa">Sottocategoria:</label>
							      <select class="form-control" id="descrizioneCategoriaAccessori"  name="descrizioneCategoriaAccessori" disabled="disabled">
							          <option value="Accessori per giochi di ruolo">Accessorio per Gioco di Ruolo</option>
							          <option value="Accessori per giochi di carte">Accessorio per Gioco di Carte</option>
							          <option value="Accessori per giochi da tavolo">Accessorio per Gioco da Tavolo</option>
							      </select>
							 </div>
				        </div>
				        	
						<div class="form-group">
							<label for="titolo">Titolo:</label>
				        	<input type="text" class="form-control" id="titolo" name="titolo" readonly="readonly" >
				        </div>
				        
						<div class="form-group">
							<label for="produttore">Produttore:</label>
				            <input type="text" class="form-control"  id="produttore" name="produttore" readonly="readonly" >
				        </div>
				        
						<div class="form-group">
							<label for="descrizione">Descrizione:</label>
				            <textarea id="descrizione" class="form-control" name="descrizione" id="descrizione" style="height: 100px" readonly="readonly"></textarea>
				        </div>
				                
				        <div class="form-group">
							<label for="quantita">Disponibilità:</label>
				            <input type="text" class="form-control" name="disponibilita" id="disponibilita" style="width:80px"  readonly="readonly">
				        </div>
				        
						<div class="form-group">
				        	<label for="prezzo">Prezzo:</label>
				        	<input type="text" step=".01" class="form-control" id="prezzo" name="prezzo" style="width:80px" readonly="readonly" >
				        </div>

						<div class="form-group">
				        	<label for="iva">IVA:</label>
				        	<input type="text" class="form-control" id="IVA" name="IVA" style="width:80px"  readonly="readonly">
				        </div>
				        
				        <div class="form-group">
					        <label class="container">Offerta</label>
							   <select class="form-control" id="offerta" name="offerta" disabled="disabled">
								        <option value="true">In offerta</option>
								        <option value="false">Non in offerta</option>
							    </select>
							
							<label class="container">Novità</label>
							  <select class="form-control" id="novita" name="novita" disabled="disabled">
								        <option value="true">Novità</option>
								        <option value="false">Non novità</option>
							    </select>
							
				        </div>
				       
					       <div class="form-group">
					        	<label for="iva">Foto:</label>
					        	<input type="text" class="form-control" id="foto" name="foto" readonly="readonly" >
					        </div>
					       
							<div class="form-group" style="float: center">
					            <button type="submit" class="btn btn-success btn-lg btn-block" onclick="enablemod(modproductformhidden)" 
					            style="max-width:400px;">Modifica Prodotto</button>
					        </div>
					        <div class="form-group" style="float: center">
					            <button type="submit" class="btn btn-success btn-lg btn-block" name="modbtn" id="modbtn" disabled="disabled" 
					            style="max-width:400px;">Salva Modifiche</button>
					        </div>
				   		</div>
				    </form>
				
				<!-- Fine Modifica prodotto -->
				</c:when>
				
				<c:when test="${operationchoice== '3'}">
				<form id="modproductform">				        
			        <div class="form-group">
			        	<label for="codProdotto">Codice prodotto:</label>
						<input type="text" class="form-control" id="codProdotto" name="codProdotto">
					</div>
					<div class="form-group">
			       		<div class="upload-btn-wrapper">
						  <button type="submit" class="btn" id="cercaCRUDe">Cerca Prodotto</button>
						</div>
			       </div>
				</form>
				
				
				<form action="adminservlet?operation=3" name="modproductformhidden" method="post" id="modproductformhidden">				        
				     <div class="form-group">
				        <div class="form-group" id="codiciProdotto">
				        	<label for="codiceProdotto">Codice prodotto:</label>
							<input type="text" class="form-control" id="codiceProdotto" name="codiceProdotto" readonly="readonly"  >
							<label for="codCat">Categoria:</label>
								  <div id="prova">
								    <select class="form-control" id="nomeCategoria" name="nomeCategoria" disabled="disabled" onclick="gameoraccessory(value)" >
								    	<option value="" selected>-</option>
								        <option value="gioco">Gioco</option>
								        <option value="accessorio">Accessorio</option>
							    	</select>
								  </div>
						</div>
					
						<div class="form-group col-7" id="subCat">					
							<div class="hidableforms container" id="subCatGioco">
								<label for="sceltag">Sottocategoria:</label>
							    <select class="form-control" id="descrizioneCategoriaGiochi" name="descrizioneCategoriaGiochi" disabled="disabled" >
							        <option value="Gioco di ruolo">Gioco di Ruolo</option>
							        <option value="Gioco di carte">Gioco di Carte</option>
							        <option value="Gioco da tavolo">Gioco da Tavolo</option>
							    </select>
							  	<label for="eta" class="d-none">Età:</label>
							  	<input type="text"  class="d-none form-control" id="eta" name="eta" readonly="readonly" >
								<label for="ngiocatori" class="d-none">Numero giocatori:</label>
							  	<input type="text" class="d-none form-control" id="numeroGiocatori" name="numeroGiocatori" readonly="readonly" >
							  	<label for="durata"class="d-none">Durata:</label>
							  	<input type="text" class="d-none form-control" id="durata" name="durata" readonly="readonly" >

							</div>
							 <div class="hidableforms container" id="subCatAccessorio">
							 	  <label for="sceltaa">Sottocategoria:</label>
							      <select class="form-control" id="descrizioneCategoriaAccessori"  name="descrizioneCategoriaAccessori" disabled="disabled">
							          <option value="Accessori per giochi di ruolo">Accessorio per Gioco di Ruolo</option>
							          <option value="Accessori per giochi di carte">Accessorio per Gioco di Carte</option>
							          <option value="Accessori per giochi da tavolo">Accessorio per Gioco da Tavolo</option>
							      </select>
							 </div>
				        </div>
				        	
						<div class="form-group">
							<label for="titolo">Titolo:</label>
				        	<input type="text" class="form-control" id="titolo" name="titolo" readonly="readonly" >
				        </div>
				        
						<div class="form-group">
							<label for="produttore">Produttore:</label>
				            <input type="text" class="form-control"  id="produttore" name="produttore" readonly="readonly" >
				        </div>
				        
						<div class="form-group">
							<label for="descrizione">Descrizione:</label>
				            <textarea id="descrizione" class="form-control" name="descrizione" style="height: 100px" readonly="readonly"></textarea>
				        </div>
				                
				        <div class="d-none form-group">
							<label for="quantita">Disponibilità:</label>
				            <input type="text" class="form-control" name="disponibilita" id="disponibilita" style="width:80px"  readonly="readonly">
				        </div>
				        
						<div class="form-group">
				        	<label for="prezzo">Prezzo:</label>
				        	<input type="text" step=".01" class="form-control" id="prezzo" name="prezzo" style="width:80px" readonly="readonly" >
				        </div>

						<div class="d-none form-group">
				        	<label for="iva">IVA:</label>
				        	<input type="text" class="form-control" id="IVA" name="IVA" style="width:80px"  readonly="readonly">
				        </div>
				        
				        <div class="form-group">
					        <label class="d-none container">Offerta</label>
							   <select class="d-none form-control" id="offerta" name="offerta" disabled="disabled">
								        <option value="true">In offerta</option>
								        <option value="false">Non in offerta</option>
							    </select>
							
							<label class="d-none container">Novità</label>
							  <select class=" d-none form-control" id="novita" name="novita" disabled="disabled">
								        <option value="true">Novità</option>
								        <option value="false">Non novità</option>
							    </select>
							
				        </div>
				       
					       <div class="d-none form-group">
					        	<label for="iva">Foto:</label>
					        	<input type="text" class="form-control" id="foto" name="foto" readonly="readonly" >
					        </div>
					       
							<div class="form-group" style="float: center">
					            <button type="submit" class="btn btn-success btn-lg btn-block" 
					            style="max-width:400px;">Elimina Prodotto</button>
					        </div>	        
				   		</div>
				    </form>
				</c:when>
				
				<c:when test="${operationchoice== '4'}">
					<jsp:include page="/adminServlet"/>
					<c:set var="prodotto" value='${requestScope["elencoProdotti"]}'/>
						<div class="container">
 							<h2>Elenco prodotti</h2>
  							<p></p>
  							  <table class="table">
							    <thead>
							      <tr>
							        <th>Titolo</th>
							        <th>Codice Prodotto</th>						
							        <th>Prezzo</th>
							        <th>Disponibilità:</th>
							        <th></th>
							        <th></th>
							      </tr>
   							    </thead>
							      <tbody>
							     	<c:forEach items="${prodotto}" var="item">
										<%@include file="/WEB-INF/Includes/producttable.jsp"%>
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
