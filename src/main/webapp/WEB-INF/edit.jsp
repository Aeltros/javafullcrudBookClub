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
<title>Books</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">


		<h1>Edit Book</h1>
		<form:form action="/books/${book.id}" method="put"
			modelAttribute="book">
			<form:errors path="*" style="color:red" />
			<form:label path="title">Title</form:label>
			 <input type="hidden" name="_method" value="put"> 
		<p>
				<form:input type="hidden" path="user" />
			</p>
	
			
			<!-- talks to the model-
			change method to "put" and skip hidden input->
			<!-- Display all errors on top -->
			<!--                        -->
			<p>
				<form:label path="title">Title</form:label>
				<form:input path="title" />
			</p>
			<p>
				<form:label path="author">Author</form:label>

				<form:textarea path="author" />
			</p>
			
							<p>
				<form:label path="mythoughts">author</form:label>
				<%------------- <form:errors path="pages" /> ---%>
				<form:input path="mythoughts" />
				
			<p>





			<input type="submit" value="Submit" />
		</form:form>


	</div>





</body>
</html>