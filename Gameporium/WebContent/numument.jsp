  	<div class="col-lg-4 col-xs-12 bg-light">
	
		<div class="productcard card d-block mx-auto">
		  
		  <div class="prodimg d-block mx-auto">
		  	<img class="card-img-top" src="images/${item.foto}" alt="Card image cap">
		  </div>
		  
		  <div class="pccardbody card-body">
		    
		    <div class="card-title">
		    	<a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}">${item.titolo}</a>
		    </div>
		    
		    <div class="price">
 				<p class="card-text">Quantità: <span class="a-dropdown-container">
                            	<label class="a-native-dropdown">
                            <span class="sc-offscreen-label" aria-label="Quantità">
                            </span>
                            </label>
                            <select name="quantity" id="cartquant" data-a-touch-header="Quantità" tabindex="-1" class="a-native-dropdown a-button-span8">
                              <option value="" selected disabled >${item.quantita }</option>
                               <option> 1  </option>
                                 <option> 2 </option>
                                   <option> 3  </option>
                                     <option> 4  </option>
                                       <option> 5  </option>
                                         <option> 6  </option>
                                           <option> 7  </option>
                                             <option> 8  </option>
                                               <option> 9  </option>
                                                 <option> 10+  </option>
                            </select>
                            	
                                    </span></p>
			</div>
		  
		  </div>
		</div>
	
  	</div>