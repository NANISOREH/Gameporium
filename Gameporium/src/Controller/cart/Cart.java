package Controller.cart;

import Beans.*;

import java.util.ArrayList;
import java.util.Collection;

public class Cart {

	private Collection<BeanProduct> products;
	
	public Cart() {
		products = new ArrayList<BeanProduct>();
	}
	
	public void addProduct(BeanProduct product) {
		products.add(product);
	}
	
	public void deleteProduct(BeanProduct product) {
		for(BeanProduct prod : products) {
			if(prod.getCodiceProdotto() == product.getCodiceProdotto()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public Collection<BeanProduct> getProducts() {
		return  products;
	}
	
	public void printCart () {
		for(BeanProduct prod : products) {
			System.out.println(prod);
		}
	}
}
