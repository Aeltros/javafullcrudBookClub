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
   <nav class="navbar bg-light my-3 w-50 mx-auto my-3">
		<div class="container-fluid">
			<a href="/books/new">+ Add a book to my shelf</a> <a
				class="navbar-brand" href="/logout">Logout</a>
		</div>
	</nav>
	<h3 class="text-center">
		Welcome,
	${thisUser.name }
	</h3>
	<p class="text-center">Books from everyone's shelves:</p>
	<div class="table-responsive w-50 mx-auto">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Author </th>
					<th>posted by</th>
					<th>Posted by</th>
					
					<th>View My Other Books</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${   allthebooks    }" var="book">
					<tr>
						<td>${book.id}</td>
						<td>${book.title}</td>
						<td>${book.author}</td>
						<td>${book.user.userName}</td>
						<td>
							<a href="/books/${book.id }">View</a> 
							
					
							
								<a href="/edit/${book.id}/edit">Edit</a>
								
								
								<form action="/delete/${book.id}" method="post">
									<input type="hidden" name="_method" value="delete"> 
									<input type="submit" value="Delete">
								</form>
								
								
								
						
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
</body>
</html>