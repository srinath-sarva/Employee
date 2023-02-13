<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

<style>
.header {
	background-color: royalblue;
	color: white;
	text-align: left;
	padding: 35px;
}

.header2 {
	background-color: royalblue;
	margin-top: 20px;
	color: white;
	text-align: left;
	padding: 15px;
}

table {
	width: 100%;
}
.form{
   justify-content: center ;
}

th {
	background-color: blue;
	color: white;
}
</style>
</head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<%

%>
<body>
	<center>
		<h3 class="header">
			<u>Employee Registration </u>
		</h3>
		<form:form action="/save" method="post" modelAttribute="emp">

			<table border="0" class="form">

				<tr>
					<td>Employee id</td>
					<td><form:input type="text" path="id" /></td>
				</tr>


				<tr>
					<td>Employee name</td>
					<td><form:input type="text" path="name" /></td>
				</tr>
				
	<tr>
					<td>designation</td>
					<td><form:select path="designation" items="${designations}" /></td>
				</tr>

				<tr>
					<td>Employee salary</td>
					<td><form:input type="text" path="salary" /></td>
				</tr>


				<tr>
					<td>Employee email</td>
					<td><form:input type="text" path="email" /></td>
				</tr>


				<tr>
					<td>mobile</td>
					<td><form:input type="text" path="mobile" /></td>
				</tr>


				<tr>
					<td>qualification</td>
					<td><form:select path="qualification" items="${qualifications}" /></td>
				</tr>


				<tr>
					<td>manager</td>
					<td><form:input type="text" path="manager" /></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" class="btn btn-success" value="save">
						<input type="reset" class="btn btn-success" value="reset"></td>
				</tr>

			</table>

		</form:form>
		<h3 class="header2">
			<u>Registered Employees </u>
		</h3>

		<table class="form" border="1">
			<tr>
							<th class="primary">Employee Id</th>
			
				<th class="primary">Employee Name</th>
				<th>Designation</th>
				<th>Salary</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Qualification</th>
				<th>Manager</th>
				<th>Actions</th>
				
			</tr>
			<c:forEach items="${employees}" var="emp">
				<tr>
					<td>${emp.id}</td>
					<td>${emp.name}</td>
					<td>${emp.designation}</td>
					<td>${emp.salary}</td>
					<td>${emp.email}</td>
					<td>${emp.mobile}</td>
					<td>${emp.qualification}</td>
					<td>${emp.manager.name}</td>
										<td><a href="/delete/${emp.id}">delete</a>
										<a href="/update/${emp.id}">update</a></td>
					



				</tr>
			</c:forEach>
		</table>


	</center>

</body>
</html>
