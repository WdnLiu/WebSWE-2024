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


<form action="RegisterController" method="POST">
  <label for="name"> Name:</label><br/>
  <input type="text" id="name" name="name" placeholder="Name" value="${model.name}" required><br/>
  <label for="user"> UserName (cannot repeat):</label><br/>
  <input type="text" id="user" name="user" placeholder="UserName" value="${model.user}" required><br/>
  <label for="mail"> Mail (cannot repeat):</label><br/>
  <input type="email" id="mail" name="mail" placeholder="Mail" value="${model.mail}" required><br/>
  <label for="birth"> Date of Birth (Age > 16):</label><br/>
  <input type="date" id="date" name="born" value="${model.born}" required><br/>
  <label for="pwd1"> Password: </label><br/>
  <input type="password" id="pwd" name="pwd" placeholder="Password" value="${model.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z@$!%*?&\d]{6,}$"><br/>
  <label for="pwd2"> Confirm password: </label> <br/>
  <input type="password" id="pwdc" placeholder="Confirm Password" value="${model.pwd}" required data-parsley-equalto="#pwd"> <br/><br/>
  <label for="favSinger"> Favourite Singer:</label><br/>
  <input type="text" id="favSinger" name="favSinger" placeholder="favSinger" value="${model.favSinger}"><br/>
  <label for="favSong"> Favourite Song:</label><br/>
  <input type="text" id="favSong" name="favSong" placeholder="favSong" value="${model.favSong}"><br/>
  <label for="pref"> Genre Preference:</label><br/>
  <input type="text" id="pref" name="pref" placeholder="pref" value="${model.pref}"><br/><br/>
  <button> Submit </button>
</form>

</body>
</html>