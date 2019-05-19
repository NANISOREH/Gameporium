<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ page import="Beans.BeanCliente" %>
<%@  taglib  prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<body>
	<%
		BeanCliente c = new BeanCliente();
		c = (BeanCliente) session.getAttribute("currentSessionUser");
		if (c != null)
			out.println("Sei loggato come " + c.getUsername());
		else
			out.println("Dati di login errati.");
	%>
</body>
</html>