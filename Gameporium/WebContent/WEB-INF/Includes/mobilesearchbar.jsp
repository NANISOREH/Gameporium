<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
  .active-cyan-2 input[type=text]:not([readonly]) {
    border-bottom: 1px solid #4dd0e1;
    box-shadow: 0 1px 0 0 #4dd0e1;
    background: #343a40;	
	border-color: transparent
  } 
</style>

</head>
<body>
	
	<div class = "container-fluid text-center" style = "margin-bottom: 30px;">
	  	<form class="active-cyan active-cyan-2 d-block d-md-none w-100">
			<i class="fas fa-search w-100" aria-hidden="true"></i> <input
				class="form-control form-control-sm w-100" type="text"
				placeholder="Search" aria-label="Search">
		</form>
	</div>

</body>
</html>