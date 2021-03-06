<!DOCTYPE html>
<html lang="en">
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="isAdmin" value='${sessionScope["isAdmin"]}' />

<c:if test="${isAdmin}">
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
<link rel="stylesheet" href="pagestyle.css" type="text/css">

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

	</head>

	<body>
		<div class="header">
			<%@include file="/WEB-INF/Includes/header.jsp"%>
		</div>
		<div class="allpagecontainer container-fluid">		
				<!-- sistema di colonne -->
				<div class="row" >

					<!-- colonna sinistra -->
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
						<%@include file="/WEB-INF/Includes/leftpaneladmin.jsp"%>
					</div>
					<!-- fine colonna sinistra -->

					<!-- colonna centrale -->
					<div class="col-lg-8 col-md-8 col-sm-6 col-xs-6">
					</div>
					<!-- fine colonna centrale -->

					<!-- fine sistema di colonne -->
				</div>
			</div>

			<%@include file="/WEB-INF/Includes/footer.jsp"%>
		
	</body>
</c:if>
</html>
