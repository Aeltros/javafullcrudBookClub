
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
<title>User</title>

<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="d-flex justify-content-evenly">
		<div class="my-3">
			<h1 class="text-center text-primary ">Book Club!</h1>
			<form:form action="/register" method="post" modelAttribute="newUser">
				<div class="row">
					<form:label path="userName">User Name</form:label>
					<form:errors path="userName" />
					<form:input type="text"  name="userName"
						path="userName" />
				</div>
				<div class="row">
					<form:label path="email">Email:</form:label>
					<form:errors path="email" />
					<form:input type="email"  name="email"
						path="email" />
				</div>
				<div class="row">
					<form:label path="password">password:</form:label>
					<form:errors path="password" />
					<form:input type="password" name="password"
						path="password" />
				</div>
				<div class="row">
					<form:label path="confirm">confirm password:</form:label>
					<form:errors path="confirm" />
					<form:input type="password"  name="confirm"
						path="confirm" />
				</div>
				<div class="row-12">
					<button type="submit" class="btn btn-primary">Register</button>
				</div>
			</form:form>
		</div>
		<div class="my-3">
			<h1 class="text-center text-success">Login</h1>
			<form:form action="/login" method="post" modelAttribute="newLogin">
				<div class="row">
					<form:label path="email">Email:</form:label>
					<form:errors path="email" />
					<form:input type="email" name="email"
						path="email" />
				</div>
				<div class="row">
					<form:label path="password">password</form:label>
					<form:errors path="password" />
					<form:input type="text"  name="password"
						path="password" />
				</div>
				<div class="row-12">
					<button type="submit" class="btn btn-success">Login</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
