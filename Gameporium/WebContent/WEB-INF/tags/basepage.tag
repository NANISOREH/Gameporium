<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>prova</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  
  <style>
  .navbar-nav .nav-item .nav-link {
    color: dark;
    text-align: center;
  }
  
  .navbar-nav .nav-item.active .nav-link, .navbar-nav .nav-item:hover .nav-link {
	    background-color: #8c8c8c
  }
  
  .navbar-toggler-icon {
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(0, 0, 0, 0.5)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E");
  }
  
  .navbar-toggler {
    background: #212121; /* pick your color */
  }
  
  .active-cyan-2 input[type=text]:not([readonly]) {
    border-bottom: 1px solid #4dd0e1;
    box-shadow: 0 1px 0 0 #4dd0e1;
    background: #343a40;	
	border-color: transparent
  } 
  </style>
</head>

<body style="background-color: #343a40">

<div class = "container-fluid" style="padding-left: 0;">




<!-- navbar -->
  <nav class="navbar navbar-dark navbar-expand-sm" style="margin-top: 0px">
    <a class="navbar-brand text-white-80" href="#"><img src="LOGOPLACEH.png" class="rounded mx-auto d-block" alt="Responsive image" style="margin-bottom: 0; max-width: 200px; max-height: 50%"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle text-center" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Giochi
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Action</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Something else here</a>
	        </div>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			Accessori
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Action</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Something else here</a>
	        </div>
	      </li>
        
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Eventi
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Action</a>
	          <a class="dropdown-item" href="#">Another action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Something else here</a>
	        </div>
	      </li>
	      
	      <li class="nav-item d-block d-sm-none" style="border-top: 1px solid #000000">
	      <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Accedi o registrati</a>
	      </li>
	      
	      <li class="nav-item d-block d-sm-none">
	      <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Il tuo carrello</a>
	      </li>
	      
	      
	      </ul>
		</div>
	    
	<div class="navbar-collapse collapse w-100 order-3 dual-collapse2" id="collapsibleNavbarRight">
      <ul class="navbar-nav ml-auto .d-md-none .d-lg-block">
	      
	      <li class="nav-item mr-auto" style="margin-bottom:5px;">
			<form class="form-inline md-form form-sm active-cyan active-cyan-2 mt-2">
			  <i class="fas fa-search" aria-hidden="true"></i>
			  <input class="form-control form-control-sm ml-3 w-75" type="text" placeholder="Search" aria-label="Search">
			</form>
	      </li>
	      
	      <li class="nav-item">
	      	<a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">Accedi o registrati</a>
	      </li>
	  
	  </ul>
    </div> 
  
  </nav>
  <!-- end navbar -->
</div>

  
  
  
  <div class="container-fluid bg-light" style="margin-top:0">

    <!-- sistema di colonne -->
    <div class="row">
    
      <!-- colonna sinistra -->
    	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-none d-md-block bg-light" style="margin-bottom:500px">
       
        <!-- pannello di ricerca -->
        <div class="card" style="margin-top: 30px">
          <div class="card-body">
            <form action="/action_page.php">
              <div class="form-group">
                <label for="email">Cerca nel sito:</label>
                <input type="email" class="form-control" id="cerca">
              </div>
              <button type="submit" class="btn btn-primary center-block">Cerca</button>
              <br><br><a href="#" style="font-size: small">Ricerca avanzata</a><br>
            </form> 
          </div>
        </div> 
        <!-- fine pannello di ricerca -->

        <div class="card" style="margin-top: 30px">
          <div class="card-body">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, lorem sit amet sagittis convallis, nunc urna efficitur purus, non faucibus quam ante in tortor. In ac eros feugiat, fringilla odio a, lacinia erat. Integer vel dui id orci vulputate pretium at ac dui. Vestibulum suscipit auctor enim, in bibendum nisi bibendum ut. Mauris sed luctus felis, et laoreet urna. Mauris id velit ac sapien tempor volutpat. Suspendisse ac diam sed dolor feugiat vehicula sed sed nulla. Fusce finibus faucibus metus a pulvinar. Phasellus nisl leo, auctor a dignissim et, suscipit sit amet lectus. Aenean ultricies venenatis lacus quis mattis. Phasellus lectus tortor, blandit nec mauris vel, tempor ultricies nulla. Aenean id imperdiet arcu. Vestibulum vehicula, leo a porttitor fermentum, risus nulla sodales sem, ut dictum ligula turpis in sem.

          Nam rhoncus purus et rutrum imperdiet. Proin iaculis dolor nec sapien ornare, sed varius mi varius. Proin dictum mattis auctor. Sed porttitor, turpis sed dapibus imperdiet, tellus ipsum ullamcorper ligula, at mollis nulla augue at mauris. Fusce porta sem sed est vulputate posuere. Proin a augue luctus, imperdiet sem nec, efficitur tellus. Integer volutpat convallis orci vitae feugiat. Nam in turpis diam. Nam porta, leo sit amet efficitur lacinia, lacus mauris sollicitudin dui, ac fringilla metus felis ut est. In leo mi, pellentesque at purus sed, auctor eleifend erat. Curabitur convallis elit eget dolor sodales maximus.

          Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed scelerisque, felis nec tincidunt dapibus, nisi tortor elementum est, nec euismod velit lorem et elit. Integer interdum urna a dolor tincidunt, imperdiet semper libero congue. Mauris quam dui, volutpat vel fringilla vitae, bibendum ac augue. Praesent in varius est. Mauris efficitur quam id dui aliquet, quis consectetur purus pellentesque. Nunc enim diam, faucibus nec magna ut, efficitur cursus nulla.
          </div>
        </div>

      </div>
      <!-- fine colonna sinistra -->
	
	<!-- colonna centrale -->
      <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 bg-light" style="margin-bottom:1100px; margin-top: 30px">
      Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? [33] At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.
      </div>
    <!-- fine colonna centrale -->
   
    <!-- colonna destra -->
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 d-md-block"style= "margin-bottom:300px" style="border-left:1px">
        <div class="card" style="font-size: small; margin-top: 30px">
          <div class="card-body">
            <form action="/action_page.php">
              <div class="form-group">
                <a href="#">Registrati</a><br>
                <a href="#">Dimenticato la password?</a><br>
                <br>
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" placeholder="" name="email">
              </div>
              <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" id="pwd" placeholder="" name="pwd">
              </div>
              <div class="checkbox">
                <label><input type="checkbox" name="remember"> Remember me</label>
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>
        </div>

      <div class="card" style="margin-top: 30px">
        <div class="card-body">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum, lorem sit amet sagittis convallis, nunc urna efficitur purus, non faucibus quam ante in tortor. In ac eros feugiat, fringilla odio a, lacinia erat. Integer vel dui id orci vulputate pretium at ac dui. Vestibulum suscipit auctor enim, in bibendum nisi bibendum ut. Mauris sed luctus felis, et laoreet urna. Mauris id velit ac sapien tempor volutpat. Suspendisse ac diam sed dolor feugiat vehicula sed sed nulla. Fusce finibus faucibus metus a pulvinar. Phasellus nisl leo, auctor a dignissim et, suscipit sit amet lectus. Aenean ultricies venenatis lacus quis mattis. Phasellus lectus tortor, blandit nec mauris vel, tempor ultricies nulla. Aenean id imperdiet arcu. Vestibulum vehicula, leo a porttitor fermentum, risus nulla sodales sem, ut dictum ligula turpis in sem.

        Nam rhoncus purus et rutrum imperdiet. Proin iaculis dolor nec sapien ornare, sed varius mi varius. Proin dictum mattis auctor. Sed porttitor, turpis sed dapibus imperdiet, tellus ipsum ullamcorper ligula, at mollis nulla augue at mauris. Fusce porta sem sed est vulputate posuere. Proin a augue luctus, imperdiet sem nec, efficitur tellus. Integer volutpat convallis orci vitae feugiat. Nam in turpis diam. Nam porta, leo sit amet efficitur lacinia, lacus mauris sollicitudin dui, ac fringilla metus felis ut est. In leo mi, pellentesque at purus sed, auctor eleifend erat. Curabitur convallis elit eget dolor sodales maximus.

        Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed scelerisque, felis nec tincidunt dapibus, nisi tortor elementum est, nec euismod velit lorem et elit. Integer interdum urna a dolor tincidunt, imperdiet semper libero congue. Mauris quam dui, volutpat vel fringilla vitae, bibendum ac augue. Praesent in varius est. Mauris efficitur quam id dui aliquet, quis consectetur purus pellentesque. Nunc enim diam, faucibus nec magna ut, efficitur cursus nulla.
        </div>
      </div>
       </div>
    </div>
  </div>
  <!-- fine sistema di colonne -->

<!-- Footer -->
<footer class="page-footer font-small blue pt-4 bg-dark">

  <!-- Footer Links -->
  <div class="container-fluid text-center bg-dark text-white-50 text-md-left">

    <!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <div class="col-md-6 mt-md-0 mt-3">

        <!-- Content -->
        <h5 class="text-uppercase">Footer Content</h5>
        <p>Here you can use rows and columns to organize your footer content.</p>

      </div>
      <!-- Grid column -->

      <hr class="clearfix w-100 d-md-none pb-3">

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase">Links</h5>

        <ul class="list-unstyled">
          <li>
            <a href="#!">Link 1</a>
          </li>
          <li>
            <a href="#!">Link 2</a>
          </li>
          <li>
            <a href="#!">Link 3</a>
          </li>
          <li>
            <a href="#!">Link 4</a>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase">Links</h5>

        <ul class="list-unstyled">
          <li>
            <a href="#!">Link 1</a>
          </li>
          <li>
            <a href="#!">Link 2</a>
          </li>
          <li>
            <a href="#!">Link 3</a>
          </li>
          <li>
            <a href="#!">Link 4</a>
          </li>
        </ul>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

</footer>
<!-- Footer -->

</body>
</html>
