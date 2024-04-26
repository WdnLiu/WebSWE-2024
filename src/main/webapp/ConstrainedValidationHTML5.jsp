<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Form </title>
<style>
input:valid {
	border-left: 4px solid green;
}
input:invalid {
	border-left: 4px solid red;
}
</style>
</head>
<body>

<ul>
	<c:forEach var="error" items="${model.errors}">
	    <li> ${error.key} : ${error.value} </li>
	</c:forEach>
</ul>

<form action="RegisterController" method="POST">
  <label for="user"> User name:</label><br/>
  <input type="text" id="user" name="user" placeholder="Name" value="${model.user}" required><br/>
  <label for="mail"> Mail:</label><br/>
  <input type="email" id="mail" name="mail" placeholder="Mail" value="${model.mail}" required><br/>
  <label for="gender"> Gender:  </label><br/>
  <select id="gender" name="gender" required>
  	<option selected> Other </option>
  	<option> Female </option>
  	<option> Male </option>
  </select> <br/>
  <label for="pwd1"> Password: </label><br/>
  <input type="password" id="pwd" name="pwd" placeholder="Password" value="${model.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"><br/>
  <label for="pwd2"> Confirm Password: </label><br/>
  <input type="password" id="pwdc" placeholder="Confirm Password" value="${model.pwd}" required><br/><br/>
  <button> Submit </button>
</form>

</body>
</html>