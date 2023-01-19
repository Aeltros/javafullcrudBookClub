<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Books</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<!-- User//Book -->



   	<div class="container">
		<h1 class="text-success">Book Review</h1>
		

	<h1   class="font-weight-bold">${thisbook.title}</h1>
	<p class="text-danger" >${thisbook.user.userName}
	
	<span style="color:blue">read</span>${thisbook.title} by  ${thisbook.author }</p> 
	<p   class="text-info">Here are ${thisbook.user.userName}'s thoughts:</p>
	<p>Here are ${thisbook.mythoughts}'s thoughts:</p>
	</div>
   
</body>
</html>