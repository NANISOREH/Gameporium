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
        <td><a href="#">${item.codiceEvento}</a></td>
        <td>${item.nome}</td>
        <td>${item.luogo}</td>
        <td>${item.descrizione}</td>
        <td>${item.dataEvento}</td>
        <td>${item.ora}</td>
        <td>${item.numeroPartecipanti }</td>
        <td><a href="/Gameporium/adminevent?operation=3&codiceEvento=${item.codiceEvento}">Cancella</a></td>
        <td><a href="/Gameporium/eventoperation.jsp?operation=2&codiceEvento=${item.codiceEvento}">Modifica</a></td>
      </tr>



</body>
</html>