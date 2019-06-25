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
        <td>${item.username}</td>
        <td>${item.nome}</td>
        <td>${item.cognome}</td>
        <td>${item.recapito}</td>
        <td><a href="/Gameporium/admincliente?operation=3&username=${item.username}">Cancella</a></td>
      </tr>



</body>
</html>