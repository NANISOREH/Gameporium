<!DOCTYPE html>

<html lang="en">



<head>

<title>Gameporium</title>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="scripts/cart.js"></script>


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

</head>



<body>

	<div class="allpagecontainer container-fluid bg-light">
		
		<!-- sistema di colonne -->
		<div class="row">

			<!-- colonna sinistra -->
			<div
				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->

			<!-- colonna centrale -->
			<div id="homecenter" class="col-lg-8 col-md-12 col-sm-12 col-xs-12 bg-light">

				<!-- container novità e offerte -->
				<div class="container-fluid clearfix">

		        	<!-- Inizio iterazione cards-->

		      		<div class="row">

		      			   <div class="row col-lg-12 md-12 sm-12">Il mio carrello</div>
							<c:set var="cartprods" value='${sessionScope["cartitems"]}' />
							<div class="container fluid">

							<c:forEach items="${cartprods}" var="item" begin="0" end="8">
									<div class="cartcard card col-lg-12 md-12 sm-12" id="cartcard">
										<div class="row ">
											<div class="col-lg-3 col-md-4 sm-12 ">
												<div class="img-square-wrapper">
													<img class="card-img mx-auto" id="cartimg" src="images/${item.product.foto }"
														alt="Card image cap">
												</div>
											</div>
											<div class="col-lg-6 col-md-4 sm-12">
												<div class="card-body">
													<h4 class="card-title">${item.product.titolo }</h4>
													<p class="card-text">
													Quantità:<div class="col">
										 			<input class="quantInput" type="number" name="quantita" value="${item.quantita }" id="${item.quantita}" onchange="reloadCart(value,${item.product.prezzo })"/>
													</div>
											
												</div>
									
											</div>
										
											<div class="col-lg-3 col-md-4 sm-12 cartreload" id="cartquantity">
												${item.product.prezzo*item.quantita}</div>
										</div>
								</div>
							</c:forEach>
</div>

		       		<!-- fine iterazione cards -->

		      		</div>

		      	<!-- fine sezione offerte -->

				</div>
			<!--fine container novità e offerte-->

			</div>
			<!-- fine colonna centrale -->


			<!-- colonna destra -->

			<div

				class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block bg-light">

				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>

			</div>

			<!-- fine sistema di colonne -->

		</div>

	</div>

	<%@include file="/WEB-INF/Includes/footer.jsp"%>
	</div>

</body>

</html>