<!DOCTYPE html>
<html lang="en">

<head>
<title>Gameporium</title>
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/Includes/headeradmin.jsp"%>
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
			<c:if test="${operationchoice== '1'}">
				<form action="addproduct" name="addproductform" method="post" id="reg">				        
				        <div class="form-group">
				        	<label for="codProd">Codice prodotto:</label>
							<input type="text" class="form-control" id="codProd" name="codProd" required>
							<label for="codCat">Codice categoria:</label>
								  <div class="row">
								    <div class="form-check form-check-inline">
								      <input name="categoria" type="radio" id="gioco" onclick="gameoraccessory(id)" checked>
								      <label for="gioco">Gioco</label>
								    </div>
								    <div class="form-check form-check-inline">
								      <input name="categoria" type="radio" id="accessorio" onclick="gameoraccessory(id)">
								      <label for="accessorio">Accessorio</label>
								    </div>
								  </div>
								</div>
						<div class="form-group">
							<label for="titolo">Titolo:</label>
				        	<input type="text" class="form-control" id="titolo" name="titolo" required>
				        </div>
				        
						<div class="form-group">
							<label for="produttore">Produttore:</label>
				            <input type="text" class="form-control" name="produttore" required>
				        </div>
				        
						<div class="form-group">
							<label for="descrizione">Descrizione:</label>
				            <textarea id=descrizione class="form-control" name="descrizione" style="height: 100px"></textarea>
				        </div>
				                
				        <div class="form-group ">
							<label for="quantita">Quantità:</label>
				            <input type="text" class="form-control" name="produttore" style="width:80px" required>
				        </div>
				        
						<div class="form-group">
				        	<label for="prezzo">Prezzo:</label>
				        	<input type="text" class="form-control" name="prezzo" style="width:80px" required>
				        </div>

						<div class="form-group">
				        	<label for="iva">IVA:</label>
				        	<input type="text" class="form-control" name="iva" style="width:80px" required>
				        </div>
				        
				        <div class="form-group">
					        <label class="container">Offerta
							  <input type="checkbox" checked="checked">
							  <span class="checkmark"></span>
							</label>
							<label class="container">Novità
							  <input type="checkbox">
							  <span class="checkmark"></span>
							</label>
				        </div>
				       
				       <div class="form-group">
				       		<div class="upload-btn-wrapper">
							  <button class="btn">Upload a file</button>
							  <input type="file" name="myfile" />
							</div>
				       </div>
				        
						<div class="form-group" style="float: center">
				            <button type="button" onclick="validateUpload(document.adproductform)" class="btn btn-success btn-lg btn-block" 
				            style="max-width:400px;">Carica Prodotto</button>
				        </div>
				    </form>
			</c:if>
			</div>
			<!-- fine colonna centrale -->

			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>
