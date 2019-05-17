<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	BeanProduct product = (BeanProduct) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,Beans.BeanProduct, Controller.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
	<h2>Products</h2>
	<a href="product">List</a>
	<table>
		<tr>
			<th>Code <a href="product?sort=codiceProdotto">Sort</a></th>
			<th>Name <a href="product?sort=titolo">Sort</a></th>
			<th>Description <a href="product?sort=descrizione">Sort</a></th>
			<th>Action</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					BeanProduct bean = (BeanProduct) it.next();
		%>
		<tr>
			<td><%=bean.getCodice()%></td>
			<td><%=bean.getTitolo()%></td>
			<td><%=bean.getDescrizione()%></td>
			<td><a href="product?action=delete&id=<%=bean.getCodice()%>">Delete</a><br>
				<a href="product?action=read&id=<%=bean.getCodice()%>">Details</a><br>
				<a href="product?action=addC&id=<%=bean.getCodice()%>">Add to cart</a>
				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
	
	<h2>Details</h2>
	<%
		if (product != null) {
	%>
	<table>
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Quantity</th>
		</tr>
		<tr>
			<td><%=product.getCodice()%></td>
			<td><%=product.getTitolo()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getPrezzo()%></td>
			<td><%=product.getDisponibilità()%></td>
		</tr>
	</table>
	<%
		} else {
			
		
	%>
	<h3 align="CENTER">No products available</h3>
	<%
		        }
	%>
	<h2>Insert</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="code">Code:</label><br> 
		<input name="code" type="number" min="0" value="0" required><br>

		<label for="catcod">CatCod:</label><br> 
		<input name="catcod" type="number" min="0" value="0" required><br>
				
		<label for="name">Name:</label><br> 
		<input name="name" type="text" maxlength="20" required placeholder="enter name"><br> 
		
		<label for="description">Description:</label><br>
		<textarea name="description" maxlength="100" rows="3" required placeholder="enter description"></textarea><br>
		
		<label for="price">Price:</label><br> 
		<input name="price" type="number" min="0" value="0" required><br>

		<label for="quantity">Quantity:</label><br> 
		<input name="quantity" type="number" min="0" value="0" required><br>
		

		
		<label for="pic">Foto:</label><br> 
		<input name="pic" type="text" required><br>
		
		<label for="produttore">Produttore:</label><br> 
		<input name="produttore" type="text" required><br>
		
		<label for="iva">IVA:</label><br> 
		<input name="iva" type="number" value="22" required><br>
	
		<input type="submit" value="Send"><input type="reset" value="Reset">
	</form>
	<% if(cart != null) { %>
		<h2>Cart</h2>
		<table>
		<tr>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<% List<BeanProduct> prodcart = cart.getProducts(); 	
		   for(BeanProduct beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getTitolo()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getCodice()%>">Delete from cart</a></td>
		</tr>
		<%} %>
	</table>		
	<% } %>	
</body>
</html>