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
			<c:when test="${operationchoice== '1'}">
			
			<!-- Inserimento nuovo prodotto -->
				<form action="adminservlet" name="addproductform" method="post" id="reg">				        
				        <div class="form-group">
				        	<label for="codProd">Codice prodotto:</label>
							<input type="text" class="form-control" id="codProd" name="codProd"  >
							<label for="codCat">Categoria:</label>
								  <div id="prova">
								    <div class="form-check form-check-inline categoria">
								      <input name="categoria" type="radio" id="gioco" value="Gioco" onclick="gameoraccessory(id)">
								      <label for="gioco">Gioco</label>
								    </div>
								    <div class="form-check form-check-inline categoria">
								      <input name="categoria" type="radio" id="accessorio" value="Accessorio" onclick="gameoraccessory(id)">
								      <label for="accessorio">Accessorio</label>
								    </div>
								  </div>
						</div>
		
						<div class="hideableforms form-group col-7" id="subCat">					
							<div class="hidableforms container" id="subCatGioco">
								<label for="sceltag">Sottocategoria:</label>
							    <select class="form-control" id="sceltag" name="sceltag">
							        <option value="ruolo">Gioco di Ruolo</option>
							        <option value="carte">Gioco di Carte</option>
							        <option value="tavolo">Gioco da Tavolo</option>
							    </select>
							  	<label for="eta">Età:</label>
							  	<input type="text" class="form-control" id="eta" name="eta"  >
								<label for="ngiocatori">Numero giocatori:</label>
							  	<input type="text" class="form-control" id="ngiocatori" name="ngiocatori"  >
							  	<label for="durata">Durata:</label>
							  	<input type="text" class="form-control" id="durata" name="durata"  >

							</div>
							 <div class="hidableforms container" id="subCatAccessorio">
							 	  <label for="sceltaa">Sottocategoria:</label>
							      <select class="form-control" id="sceltaa"  name="sceltaa">
							          <option value="ruolo">Accessorio per Gioco di Ruolo</option>
							          <option value="carte">Accessorio per Gioco di Carte</option>
							          <option value="tavolo">Accessorio per Gioco da Tavolo</option>
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
				            <textarea id="descrizione" class="form-control" name="descrizione" style="height: 100px"></textarea>
				        </div>
				                
				        <div class="form-group ">
							<label for="quantita">Quantità:</label>
				            <input type="text" class="form-control" name="quantita" id="quantita" style="width:80px"  >
				        </div>
				        
						<div class="form-group">
				        	<label for="prezzo">Prezzo:</label>
				        	<input type="text" class="form-control" name="prezzo" style="width:80px"  >
				        </div>

						<div class="form-group">
				        	<label for="iva">IVA:</label>
				        	<input type="text" class="form-control" name="iva" style="width:80px"  >
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
				       
				       <div class="form-group">
				       		<div class="upload-btn-wrapper">
							  <button class="btn">Upload a file</button>
							  <input type="file" name="foto" id="foto" />
							</div>
				       </div>
				        
						<div class="form-group" style="float: center">
				            <button type="submit" class="btn btn-success btn-lg btn-block" 
				            style="max-width:400px;">Carica Prodotto</button>
				        </div>
				    </form>
				</c:when>
				
				<c:when test="${operationchoice== '2'}">
				<!-- Modifica prodotto -->
				<form action="singleProduct" name="addproductform" method="post" id="reg">				        
				        <div class="form-group">
				        	<label for="codProd">Codice prodotto:</label>
							<input type="text" class="form-control" id="codProd" name="codProd"  >
						</div>
						<div class="form-group">
				       		<div class="upload-btn-wrapper">
							  <button class="btn">Cerca Prodotto</button>
							</div>
				       </div>
				</form>
					
				<!-- Fine Modifica prodotto -->
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
