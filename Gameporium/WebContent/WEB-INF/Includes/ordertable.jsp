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
  	      


      <tr>
        <td><a href="#">${item.codiceOrdine}</a></td>
        <td>${item.username}</td>
        <td>${item.dataOrdine}</td>
        <td>${item.dataSpedizione}</td>
        <td>${item.importo}</td>
        <td>${item.indirizzoSpedizione}</td>
        <td>${item.indirizzoFatturazione }</td>
        <td>${item.tipoSpedizione}</td>
        <td>${item.codiceSpedizione}</td>
        <td>${item.codicePagamento }</td>
        <td>${item.metodo }</td>
      </tr>



</body>
</html>