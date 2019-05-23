<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- container novità e offerte -->
      	<div class="container-fluid clearfix">
	  	
	  	<div class = "container-fluid text-center" style = "margin-bottom: 30px;">
		  	<form class="active-cyan active-cyan-2 d-block d-md-none w-100">
				<i class="fas fa-search w-100" aria-hidden="true"></i> <input
					class="form-control form-control-sm w-100" type="text"
					placeholder="Search" aria-label="Search">
			</form>
		</div>
      	<!-- Inizio sezione offerte -->
		<div style="border-bottom:1px black solid"> Offerte 
          <a href="/Gameporium/offerteNovita.jsp" style=float:right;>Scoprile tutte</a>
        </div>      		<!-- Inizio iterazione cards-->
      		<div class="row">
      		<jsp:include page="/product"/>
      		<c:set var="products" value='${sessionScope["listaOfferta"]}'/>
      		<c:forEach items="${products}" var="item">
      				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bg-light">
	      			<div class="card" style="margin-top: 30px">
	      				<div class="card-header">
	      					${item.titolo}
	      				</div>
          				<div class="card-body" style="width:400px; height:300 px">
          					<img class="card-img-top img-responsive" src="<c:url value="WebContent/images/${item.foto}"/>"alt="${item.foto}"/>
          					<br>
       					</div>
       					<div class="card-footer">
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
      		<div style="border-bottom:1px black solid;  margin-top: 30px">Novità Giochi
      			<a href="/Gameporium/offerteNovita.jsp" style=float:right;>Vedili tutti</a>
      		</div>
      		<!-- Inizio iterazione cards-->
      		<div class="row">
      		<jsp:include page="/product"/>
      		<c:set var="products" value='${sessionScope["listaNovita"]}'/>
      		<c:forEach items="${products}" var="item">
      				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 bg-light">
	      			<div class="card" style="margin-top: 30px">
	      				<div class="card-header">
	      					${item.titolo}
	      				</div>
          				<div class="card-body" style="width:400px; height:300 px">
          					<img class="card-img-top img-responsive" src="<c:url value="WebContent/images/${item.foto}"/>"alt="${item.foto}"/>
          					<br>
       					</div>
       					<div class="card-footer">
       						Prezzo:
       						${item.prezzo}
       					</div>
       				</div>
       				</div>
			</c:forEach>
       		<!-- fine iterazione cards -->
      		</div>
      		<!-- fine sezione novita -->
      		</div>
<!--fine container novità e offerte-->
</body>
</html>