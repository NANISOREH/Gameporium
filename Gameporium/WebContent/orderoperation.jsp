<!DOCTYPE html>
<html lang="en">

<head>
<title>Gameporium</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="pagestyle.css" type="text/css">
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
<%@include file="/WEB-INF/Includes/header.jsp"%>
<jsp:include page="/adminorder" flush="true" />
</head>

<body style="background-color: #343a40">
	<div class="allpagecontainer container-fluid bg-light">
		<!-- sistema di colonne -->
		<div class="row">

			<!-- colonna sinistra -->
			<div class="col-lg-2 col-md-6 col-sm-12 col-xs-12 bg-light" style = "margin-bottom:200px;">
				<%@include file="/WEB-INF/Includes/leftpaneladmin.jsp"%>
			</div>
			<!-- fine colonna sinistra -->

			<!-- colonna centrale -->
			<div class="col-lg-10 col-md-6 col-sm-12 col-xs-12 bg-light">
				<c:set var="ordine" value='${sessionScope["listaOrdini"]}' />
				<!-- Visualizza ordine -->
				<div class="sectionstyle">Visualizza ordini</div>

				<form id="modorderform">
					<div class="form-group">
						<label for="codiceOrdine">Codice cliente:</label> <input
							type="text" class="form-control" placeholder="username"
							id="username" name="username" value="${user}">
					</div>
					<div class="form-group">
						<div class="upload-btn-wrapper">
							<button type="button" class="btn" id="cercaCRUD"
								onclick="ajaxOrder()">Cerca ordini</button>
						</div>
					</div>
				</form>
				<div class="container-fluid" id="contable">
					<h2>Elenco ordini</h2>
					<p></p>
					<table class="table" id="ordertable">
						<thead>
							<tr>
								<th>Codice Ordine</th>
								<th>Username</th>
								<th>Data Ordine</th>
								<th>Data Spedizione</th>
								<th>Importo</th>
								<th>Indirizzo Spedizione</th>
								<th>Indirizzo Fatturazione</th>
								<th>Tipo Spedizione</th>
								<th>Codice Spedizione</th>
								<th>Codice Pagamento</th>
								<th>Metodo Pagamento</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ordine}" var="item">
								<%@include file="/WEB-INF/Includes/ordertable.jsp"%>
							</c:forEach>
						</tbody>
					</table>
				</div>








				<!-- <form action="adminorder?operation=1" name="modorderformhidden" method="post" id="modorderformhidden">				        
				     <div class="form-group">
				        <div class="form-group" id="codiciOrdine">
				        	<label for="codiceOrdine">Codice ordine:</label>
							<input type="text" class="form-control" id="codiceOrdine" name="codiceOrdine" readonly="readonly"  >
							<label for="indirizzoSpedizione">Indirizzo spedizione:</label>
							<input type="text" class="form-control" id="indirizzoSpedizione" name="indirizzoSpedizione" readonly="readonly"  >				
							<label for="indirizzoFatturazione">Indirizzo fatturazione:</label>
							<input type="text" class="form-control" id="indirizzoFatturazione" name="indirizzoFatturazione" readonly="readonly"  >				
							<label for="tipoSpedizione">Tipologia spedizione:</label>
							<input type="text" class="form-control" id="tipoSpedizione" name="tipoSpedizione" readonly="readonly">
							<label for="dataSpedizione">Data spedizione:</label>
							<input type="date" class="form-control" id="dataSpedizione" name="dataSpedizione" min="2018-01-01" max="2019-12-31" readonly="readonly"  >				
							<label for="codiceSpedione">Codice spedizione:</label>
							<input type="text" class="form-control" id="codiceSpedizione" name="codiceSpedizione" readonly="readonly">
							<label for="codicePagamento">Codice pagamento:</label>
							<input type="text" class="form-control" id="codicePagamento" name="codicePagamento" readonly="readonly"  >
							<label for="metodoPagamento">Metodo pagamento:</label>
							<input type="text" class="form-control" id="metodoPagamento" name="metodoPagamento" readonly="readonly"  >
							<label for="importo">Importo:</label>
							<input type="text" class="form-control" id="importo" name="importo" readonly="readonly" >
						</div>
					</div>
				    </form> -->

				<!-- Fine visualizza Ordine -->

			</div>
			<!-- fine colonna centrale -->

			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>
