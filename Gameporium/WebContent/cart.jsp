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

<link rel="stylesheet" href="pagestyle.css" type="text/css">

</head>



<body>
	
	<div class= "header">
	<%@include file="/WEB-INF/Includes/header.jsp"%>
	</div>

	<div class="allpagecontainer container-fluid">

		<!-- sistema di colonne -->
		<div class="row">

			<!-- colonna sinistra -->
			<div
				class="col-lg-2 col-md-0 d-none d-lg-block ">
				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>
			</div>
			<!-- fine colonna sinistra -->

			<!-- colonna centrale -->
			<div 
				class="col-lg-8 col-md-8 col-sm-8 col-xs-8">

				<!-- container novità e offerte -->
				<div class="container-fluid clearfix">

					<!-- Inizio iterazione cards-->
					<form action="cartupdate" method="post" name="removefrm"
						onkeydown="return event.key != 'Enter';">

<!-- 						<div class="row"> -->
							<div class="sectionstyle">Il
								mio carrello</div>
							<c:set var="cartprods" value='${sessionScope["cartitems"]}' />

						<div class="container cartcontainer cartreload">

							<%-- 								<c:forEach items="${cartprods}" var="item" begin="0" --%>
							<%-- 									end="${cartitems.size() }"> --%>
							<!-- 										<div class="cartcard card" id="cartcard"> -->
							<!-- 											<div class="row "> -->
							<!-- 												<div class="col-sm-4"> -->
							<!-- 													<div class=" img-square-wrapper"> -->
							<!-- 														<img class="img-responsive" id="cartimg" -->
							<%-- 															src="images/${item.product.foto }" alt="Card image cap"> --%>
							<!-- 													</div> -->
							<!-- 												</div> -->
							<!-- 												<div class="col-sm-6"> -->
							<!-- 													<a class="card-title" -->
							<%-- 														href="singleProduct?selProd=${item.product.codiceProdotto}&selCat=${item.product.codCategoria}">${item.product.titolo }</a> --%>
							<!-- 													<p>Quantità: -->
							<!-- 														<input class="quantInput" type="number" name="quantita" -->
							<%-- 															value="${item.quantita }" id="${item.quantita}" --%>
							<%-- 															onchange="reloadCart(value, ${item.product.codiceProdotto})" /> --%>

							<!-- 													<input type="hidden" name="productId" id="productId" -->
							<%-- 														value="${item.product.codiceProdotto }"> --%>
							<!-- 												</div> -->



							<%-- 												<div class="col-sm-2" id="${item.product.codiceProdotto}"> --%>
							<%-- 													${item.prezzoTotale}€<br> --%>
							<!-- 													<button class="quantButton" name="rimuovibtn" -->
							<!-- 														id="rimuovibtn" onclick="addToCart(document.quantityForm)" -->
							<%-- 														type="submit" value='${item.product.codiceProdotto}'> --%>
							<!-- 														<i class="fa fa-trash" aria-hidden="true"></i> -->
							<!-- 													</button> -->

							<!-- 												</div> -->


							<!-- 											</div> -->
							<!-- 										</div> -->

							<%-- 								</c:forEach> --%>


							<c:forEach items="${cartprods}" var="item" begin="0">
								<table class="table fixedtable cartable">
									<tbody>
										<tr>
											<td><img class="img-responsive" id="cartimg"
												src="images/${item.product.foto }" alt="Card image cap">
											</td>
											<td>
												<strong>${item.product.titolo}</strong><br>
												<label>Quantità</label>
												<input class="quantInput" type="number"
												name="quantita" value="${item.quantita }"
												id="${item.quantita}"
												onchange="reloadCart(value, ${item.product.codiceProdotto})" />

											</td>
											<td>${item.prezzoTotale}€</td>
	
											<td><input type="hidden" name="productId" id="productId"
												value="${item.quantita }">
												<button name="rimuovibtn" id="rimuovibtn"
													onclick="reloadCart(${item.quantita},value)" type="submit"
													value='${item.product.codiceProdotto}'>
													<i class="fa fa-trash" aria-hidden="true"></i>
												</button></td>

										</tr>

									</tbody>
								</table>
							</c:forEach>
							
						</div>


						<!-- fine iterazione cards -->

<!-- 						</div> -->
					</form>
					<!-- fine sezione offerte -->

				</div>
				<!--fine container novità e offerte-->

			</div>
			<!-- fine colonna centrale -->


			<!-- colonna destra -->

			<div
				class="col-lg-2 col-md-4 col-sm-4 col-xs-12">

				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>

			</div>

			<!-- fine sistema di colonne -->

		</div>

	</div>

	<%@include file="/WEB-INF/Includes/footer.jsp"%>

</body>

</html>