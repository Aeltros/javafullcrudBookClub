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
<p>  ${success}      </p>

 
	<div class="container">

		<div>
			<h4 class="text-success">Welcome, ${thisUser.userName}</h4>
			<h4 class="text-info">Books from everyone's shelves</h4>
			<a href="/create">Create Book </a> || <a class="text-danger"
				href="/logout">Logout</a>


		</div>
		<div class="container">
			<table class="table table-bordered">
				<thead class="table-active">
					<tr>
						<th scope="col">ID</th>

						<th scope="col">Title</th>

						<th scope="col">Author</th>

						<th scope="col">Posted by</th>
						<th scope="col">View My other Books</th>


						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${ allthebooks  }">
						<tr>
								<td><c:out value="${book.id}" /></td>


								<td><a href="/show/${book.id}">${book.title} </a></td>


								<td>${book.author}</td>

								<td>${book.user.userName}</td>
								
								<td><a href="/showuserbooks/${book.user.id}"
								class="btn btn-info" role="button" aria-pressed="true">View
									Books by ${book.user.userName} </a> <!--if the logged in user is owner of the book show the a tag   --- -->
								</td>

							<!-- actions -->
								
						
								<td>
								
										<a href="/edit/${book.id}" class="btn btn-warning"
										role="button" aria-pressed="true">Edit</a>
									<form action="/delete/${book.id}" method="post">
									<input type="hidden" name="_method" value="delete"> <input
										type="submit" value="Delete">
								</form>
								</td>
				
							
							
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>