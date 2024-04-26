<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="parsley/parsley.min.js"></script>
<!--  <script src="parsley/i18n/ca.js"></script> -->
<title> Form with parsley </title>
<link rel="stylesheet" type="text/css" href="css/estil.css">
</head>

<body>

<ul class="server-errors-list">
	<c:forEach var="error" items="${model.errors}">
	    <li> ${error.key} : ${error.value} </li>
	</c:forEach>
</ul>

<form data-parsley-validate action="RegisterController">
  <label for="user"> User name:</label><br/>
  <input type="text" id="user" name="user" placeholder="Name" value="${model.user}" required> <br/>
  <label for="mail"> Mail: </label> <br/>
  <input type="email" id="mail" name="mail" placeholder="Email" value="${model.mail}" required> <br/>
  <label for="gender"> Gender:  </label><br/>
  <select id="gender" name="gender" required>
  	<option selected> Other </option>
  	<option> Female </option>
  	<option> Male </option>
  </select> <br/>
  <label for="pwd1"> Password: </label> <br/>
  <input type="password" id="pwd" name="pwd" placeholder="Password" value="${model.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"> <br/>
  <label for="pwd1"> Confirm password: </label> <br/>
  <input type="password" id="pwdc" placeholder="Confirm Password" value="${model.pwd}" required data-parsley-equalto="#pwd"> <br/><br/>
  <button> Submit </button>
</form>

</body>
</html>