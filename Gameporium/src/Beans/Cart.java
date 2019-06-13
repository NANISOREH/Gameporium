package Beans;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class Cart {

	private Collection<Bean> products;
	
	public Cart() {
		products = new LinkedList<Bean>();
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
	
	public Collection<Bean> getProducts() {
		return  products;
	}
}
