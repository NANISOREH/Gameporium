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

<link rel="stylesheet" href="pagestyle.css" type="text/css">

</head>



<body>

	<div class="allpagecontainer container-fluid bg-light">

		<!-- sistema di colonne -->

		<div class="row">

			

			<!-- colonna sinistra -->

			<div

				class="col-lg-2 col-xs-12 d-none d-lg-block bg-light">

				<%@include file="/WEB-INF/Includes/leftpanel.jsp"%>

			</div>

			<!-- fine colonna sinistra -->

			

			<!-- colonna centrale -->

			<div id="homecenter" class="col-lg-8 col-md-12 col-sm-12 col-xs-12 bg-light">

				<!-- container novità e offerte -->

				<div class="container-fluid clearfix">

			 	

		      		<!-- Inizio sezione offerte -->

					<div class="sectionstyle">Offerte

			          <a class="offnovlink" href="/Gameporium/productselection.jsp?attribute=offerta&value=true">Scoprile tutte</a>

			        </div>      		

		        	

		        	<!-- Inizio iterazione cards-->

		      		<div class="row">
		      			<c:set var="home" scope="request" value="true"/>

 		      			<jsp:include page="/productShow"/> 

		      			<c:set var="offerte" value='${requestScope["offerteHome"]}'/>

			      		<c:forEach items="${offerte}" var="item" begin="0" end="8">
							<%@include file="/WEB-INF/Includes/productcard.jsp"%>
						</c:forEach>

		       		<!-- fine iterazione cards -->

		      		</div>

		      	<!-- fine sezione offerte -->

		      	

		      	<!-- Inizio sezione novità -->

					<div class="sectionstyle">Novità

			          <a class="offnovlink" href="/Gameporium/productselection.jsp?attribute=novita&value=true">Scoprile tutte</a>

			        </div>      		

		        <!-- Inizio iterazione cards-->

		      		<div class="row">

		      			<c:set var="novita" value='${requestScope["novitaHome"]}'/>

			      		<c:forEach items="${novita}" var="item" begin="0" end="8">
							<%@include file="/WEB-INF/Includes/productcard.jsp"%>
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

				class="col-lg-2 col-xs-12 d-none d-lg-block bg-light">

				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>

			</div>

			<!-- fine sistema di colonne -->

		</div>

	</div>

	<%@include file="/WEB-INF/Includes/footer.jsp"%>

</body>

</html>