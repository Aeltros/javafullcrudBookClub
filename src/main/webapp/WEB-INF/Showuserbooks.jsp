<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1></h1>
		<img width="50" src="/images/book.jpg" alt="" />
		<div>
			<a href="/success">Back to the Shelves</a>
		</div>
		<div>
			<h4 class="text-success">Books by ${thisuser.userName}</h4>
			<c:forEach items="${thisuser.booksCreated }" var="book">
<span style="color:red">${book.title }</span>
				<li>Title: <span style="color:blue">${book.title }</span>  by:<span style="color:red">${book.author }</span> ;
					${thisuser.userName} said  ${book.mythoughts }</li>
			</c:forEach>
		</div>
</body>
</html>