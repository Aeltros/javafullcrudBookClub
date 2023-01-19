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
<div>    <nav class="navbar navbar-dark bg-primary">
  	<h1> MAKTABA KUU</h1></div>
	<div class="container">
	
	
	
	<div>      <a href="/success">Back to the Shelves</a>              </div>
	
	
	<div>    <h1>Add a Book to Your Shelf </h1>                </div>
		<form:form action="/books" method="post" modelAttribute="book">
		<!-- empty book object-->
			<form:errors path="*" style="color:red"/>
			<p>
				<form:input type="hidden" path="user" value="${user_id}"/>
				<%--<form:iPass in the foreign Key in the child table>--%>
				
				
			</p>
							
			<p>
				<form:label path="title">Title</form:label>
				<%-- <form:errors path="title" /> --%>
				<form:input path="title" />
			</p>

						<p>
				<form:label path="author">author</form:label>
				<%------------- <form:errors path="pages" /> ---%>
				<form:input path="author" />
				
			<p>
			
			
									<p>
				<form:label path="mythoughts">mythoughts</form:label>
				<%------------- <form:errors path="pages" /> ---%>
				<form:textarea path="mythoughts" />
				
			<p>
			
			
			
			
				<%--- --form:select path="library">
					<c:forEach items="${alllibs }" var="lib">
						<form:option value="${lib}">
							${lib.getName() }
						</form:option>
					</c:forEach>

				</form:select>
			</p>-----%>
				
		
			<input type="submit" value="Submit" />
		</form:form>

	</div>

</body>
</html>