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
<link rel="stylesheet" href="pagestyle.css" type="text/css">
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
						<label for="dataOrdine">Data da:</label>
						<input type="date" class="form-control" name="dataDa" id="dataDa" style="width:100px"  >
					</div>
					<div class="form-group">
						<label for="dataOrdine"> a:</label>
						<input type="date" class="form-control" name="dataA" id="dataA" style="width:100px"  >
					</div>
					<div class="form-group">
						<div class="upload-btn-wrapper">
							<button type="submit" class="btn" id="cercaCRUD">Cerca ordini</button>
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
								<th>Prodotto</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="ordine" value='${sessionScope["listaOrdini"]}' />
							<c:forEach items="${ordine}" var="item">
								<%@include file="/WEB-INF/Includes/ordertable.jsp"%>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- Fine visualizza Ordine -->

			</div>
			<!-- fine colonna centrale -->

			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>
