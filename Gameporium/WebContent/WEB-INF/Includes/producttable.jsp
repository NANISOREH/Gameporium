<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="scripts/cart.js"></script>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
</head>
<body>
  	      
  <table class="table">
    <thead>
      <tr>
        <th>Codice Prodotto</th>
        <th>Titolo</th>

        <th>Prezzo</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}">${item.codiceProdotto}</a></td>
        <td>${item.titolo}</td>

        <td>${item.prezzo }</td>
      </tr>
    </tbody>
  </table>


</body>
</html>