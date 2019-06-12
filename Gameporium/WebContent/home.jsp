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
<%@include file="/WEB-INF/Includes/header.jsp"%>
</head>

<body style="background-color: #343a40">
	<div class="container-fluid bg-light" style="margin-top: 0">
		<!-- sistema di colonne -->
		<div class="row">
			
			<!-- colonna sinistra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light"
				style="margin-bottom: 500px">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->
			
			<!-- colonna centrale -->
			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 bg-light"
				style="margin-bottom: 1100px; margin-top: 30px">
				<%@include file="/WEB-INF/Includes/mobilesearchbar.jsp"%>

				<!-- container novità e offerte -->
				<div class="container-fluid clearfix">
			 	
		      		<!-- Inizio sezione offerte -->
					<div style="border-bottom:1px black solid;  margin-top: 30px">Offerte
			          <a href="/Gameporium/productselection.jsp?attribute=offerta&value=true" style=float:right;>Scoprile tutte</a>
			        </div>      		
		        	
		        	<!-- Inizio iterazione cards-->
		      		<div class="row">
		      			<jsp:include page="/productHome"/>
		      			<c:set var="offerte" value='${sessionScope["listaOfferta"]}'/>
			      		<c:forEach items="${offerte}" var="item" begin="0" end="5">
		      				<div class="col-sm-4 col-xs-12 bg-light">
				      			<div class="card" style="margin-top: 30px; height: 400px">
				      				<div class="card-header">
				      					<a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}">${item.titolo}</a>
				      				</div>
			          				<div class="card-body">
			          					<div class="container-fluid" style="height: 250px; overflow:hidden">
				          				<img class="card-img-top img-responsive" style="height:auto" 
				          				src="<c:url value="images/${item.foto}"/>"alt="${item.foto}"/>
			          					</div>
			       					</div>
			       					<div class="card-footer" >
			       						Prezzo:
			       						${item.prezzo}
			       					</div>
			       				</div>
		       				</div>
						</c:forEach>
		       		<!-- fine iterazione cards -->
		      		</div>
		      	<!-- fine sezione offerte -->
		      	
		      	<!-- Inizio sezione novità -->
					<div style="border-bottom:1px black solid;  margin-top: 30px">Novità
			          <a href="/Gameporium/productselection.jsp?attribute=novita&value=true" style=float:right;>Scoprile tutte</a>
			        </div>      		
		        <!-- Inizio iterazione cards-->
		      		<div class="row">
		      			<jsp:include page="/productHome"/>
		      			<c:set var="novita" value='${sessionScope["listaNovita"]}'/>
			      		<c:forEach items="${novita}" var="item" begin="0" end="5">
		      				<div class="col-sm-4 col-xs-12 bg-light">
				      			<div class="card" style="margin-top: 30px; height: 400px">
<!-- 				      				<div class="card-header" style="max-height:50px;"> -->
				      					<div class="container-fluid" style = "overflow: hidden">
					      					<a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}" 
					      					style="overflow:hidden">
					      						${item.titolo}
					      					</a>
				      					</div>
<!-- 				      				</div> -->
			          				<div class="card-body">
			          					<div class="container-fluid" style="height: 250px; overflow:hidden">
					          				<img class="card-img-top img-responsive" style="height:auto" 
					          				src="<c:url value="images/${item.foto}"/>"alt="${item.foto}"/>
				          				</div>
			       					</div>
			       					<div class="card-footer" style="height: 50px">
			       						Prezzo:
			       						${item.prezzo}
			       					</div>
			       				</div>
		       				</div>
						</c:forEach>
		       		<!-- fine iterazione cards -->
		      		</div>
		      	<!-- fine sezione offerte -->
		      	</div>
			<!--fine container novità e offerte-->
			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light"
				style="margin-bottom: 300px" style="border-left:1px">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>
