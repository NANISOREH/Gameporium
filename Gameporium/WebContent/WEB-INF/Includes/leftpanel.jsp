<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
 <!-- pannello di ricerca -->
        <div class="card" style="margin-top: 30px">
          <div class="card-body">
            <form action="/ricercaAvanzata">
              <div class="form-group">
                <label for="Ricerca Avanzata">Ricerca Avanzata:</label>
                <select name="categoria">
                	<option value="Gioco di Carte">Giochi di Carte</option>
                	<option value="Gioco di Ruolo">Giochi di Ruolo</option>
                	<option value="Gioco da Tavolo">Giochi da Tavolo</option>
                	<option value="Accessorio GdC">Accessori GdC</option>
                	<option value="Accessorio GdR">Accessori GdR</option>
                	<option value="Accessorio GdT">Accessori GdT</option>
              </select>	
              <div class="custom-control custom-checkbox" style="margin-top:20px">
  				<input type="checkbox" class="custom-control-input" id="customCheck1">
			  	<label class="custom-control-label" for="customCheck1">In Offerta</label>
			  </div>

          </div>
			  <button type="submit" class="btn btn-primary center-block">Cerca</button>
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

</body>
</html>