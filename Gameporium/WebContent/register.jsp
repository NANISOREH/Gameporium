<!DOCTYPE html>
<html lang="en">

<head>
<title>prova</title>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    .form-control{
		height: 40px;
		box-shadow: none;
		color: #969fa4;
	}
	.form-control:focus{
		border-color: #5cb85c;
	}
    .form-control, .btn{        
        border-radius: 3px;
    }
	.signup-form{
		width: 400px;
		margin: 0 auto;
		padding: 30px 0;
	}
	.signup-form h2{
		color: #636363;
        margin: 0 0 15px;
		position: relative;
		text-align: center;
    }
	.signup-form h2:before, .signup-form h2:after{
		content: "";
		height: 2px;
		width: 30%;
		background: #d4d4d4;
		position: absolute;
		top: 50%;
		z-index: 2;
	}	
	.signup-form h2:before{
		left: 0;
	}
	.signup-form h2:after{
		right: 0;
	}
    .signup-form .hint-text{
		color: #999;
		margin-bottom: 30px;
		text-align: center;
	}
    .signup-form form{
		color: #999;
		border-radius: 3px;
    	margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
	.signup-form .form-group{
		margin-bottom: 20px;
	}
	.signup-form input[type="checkbox"]{
		margin-top: 3px;
	}
	.signup-form .btn{        
        font-size: 16px;
        font-weight: bold;		
		min-width: 140px;
        outline: none !important;
    }
	.signup-form .row div:first-child{
		padding-right: 10px;
	}
	.signup-form .row div:last-child{
		padding-left: 10px;
	}    	
    .signup-form a{
		color: #fff;
		text-decoration: underline;
	}
    .signup-form a:hover{
		text-decoration: none;
	}
	.signup-form form a{
		color: #5cb85c;
		text-decoration: none;
	}	
	.signup-form form a:hover{
		text-decoration: underline;
	}  

.navbar-nav .nav-item .nav-link {
	color: dark;
	text-align: center;
}

.navbar-nav .nav-item.active .nav-link, .navbar-nav .nav-item:hover .nav-link
	{
	background-color: #8c8c8c
}

.navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
}

.navbar-toggler {
	background: #212121; /* pick your color */
}

.active-cyan-2 input[type=text]:not ([readonly] ) {
	border-bottom: 1px solid #4dd0e1;
	box-shadow: 0 1px 0 0 #4dd0e1;
	background: #343a40;
	border-color: transparent
}
</style>

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
			<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12 bg-light" style="margin-bottom: 1100px; margin-top: 30px">
				<div class="signup-form">
				    <form action="/examples/actions/confirmation.php" method="post">
						<h2>Registrati</h2>
						<p class="hint-text">Crea un account. Ci vorrà solo un minuto!</p>
				        
				        <div class="form-group">
							<input type="text" class="form-control" name="first_name" placeholder="Nome" required="required">
							<input type="text" class="form-control" name="last_name" placeholder="Cognome" required="required">
						</div>
				        
				        <div class="form-group">
				        	<input type="email" class="form-control" name="email" placeholder="Email" required="required">
				        </div>
						<div class="form-group">
				            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
				        </div>
						<div class="form-group">
				            <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required">
				        </div>        
				        <div class="form-group">
							<label class="checkbox-inline"><input type="checkbox" required="required"> Accetto i <a href="#">Termini di Uso</a> e le <a href="#">Norme della privacy</a></label>
						</div>
						<div class="form-group">
				            <button type="submit" class="btn btn-success btn-lg btn-block">Registrati adesso!</button>
				        </div>
				    </form>
				</div>
			</div>
			<!-- fine colonna centrale -->

			<!-- colonna destra -->
			<div class="clearfix col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-lg-block"
				style="margin-bottom: 300px" style="border-left:1px">
				<%@include file="/WEB-INF/Includes/rightpanel.jsp"%>
			</div>
			<!-- fine sistema di colonne -->
		</div>
	</div>
	<%@include file="/WEB-INF/Includes/footer.jsp"%>
</body>
</html>