package Controller;

import Beans.*;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<BeanProduct> products;
	
	public Cart() {
		products = new ArrayList<BeanProduct>();
	}
	
	public void addProduct(BeanProduct product) {
		products.add(product);
	}
	
	public void deleteProduct(BeanProduct product) {
		for(BeanProduct prod : products) {
			if(prod.getCodice() == product.getCodice()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public List<BeanProduct> getProducts() {
		return  products;
	}
}
