package Beans;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class Cart {

	private ArrayList<BeanProduct> products;
	
	public Cart() {
		products = new ArrayList<BeanProduct>();
	}
	
	public void addProduct(BeanProduct product) {
		products.add(product);
	}
	
	public void deleteProduct(BeanProduct product) {
		Collection<BeanProduct> prods=(Collection<BeanProduct>) product;
		for(BeanProduct prod : prods) {
			if(prod.getCodiceProdotto() == product.getCodiceProdotto()) {
				products.remove(prod);
				break;
			}
		}
 	}
	
	public ArrayList<BeanProduct> getProducts() {
		return products;
	}
}
