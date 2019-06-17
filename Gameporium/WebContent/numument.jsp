<div class="card mb-3" style="max-width: 540px;">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="images/${item.product.foto}" class="card-img" alt="product image">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">${item.product.titolo }</h5>
        <p class="card-text">Quantità:
          <span class="a-dropdown-container">
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
                            	
                                    </span>
        </p>
        <a class="remove" href="#"><small class="text-muted">Rimuovi</small></a>
      </div>
    </div>
  </div>
</div>