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
  <label for="name"> Name:</label><br/>
  <input type="text" id="name" name="name" placeholder="Name" value="${model.name}" required><br/>
  <label for="user"> UserName (cannot repeat):</label><br/>
  <input type="text" id="user" name="user" placeholder="UserName" value="${model.user}" required><br/>
  <label for="mail"> Mail (cannot repeat):</label><br/>
  <input type="email" id="mail" name="mail" placeholder="Mail" value="${model.mail}" required pattern="[^@\s]+@[^@\s]+\.[^@\s]+"><br/>
  <label for="birth"> Date of Birth (Age > 16):</label><br/>
  <input type="date" id="date" name="born" value="${model.born}" required><br/>
  <label for="pwd1"> Password: </label><br/>
  <input type="password" id="pwd" name="pwd" placeholder="Password" value="${model.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z@$!%*?&\d]{12,}$"><br/>
  <label for="pwd2"> Confirm Password: </label><br/>
  <input type="password" id="pwdc" placeholder="Confirm Password" value="${model.pwd}" required><br/><br/>
  <label for="favSinger"> Favourite Singer:</label><br/>
  <input type="text" id="favSinger" name="favSinger" placeholder="favSinger" value="${model.favSinger}"><br/>
  <label for="favSong"> Favourite Song:</label><br/>
  <input type="text" id="favSong" name="favSong" placeholder="favSong" value="${model.favSong}"><br/>
  <label for="pref"> Genre Preference:</label><br/>
  <input type="text" id="pref" name="pref" placeholder="pref" value="${model.pref}"><br/><br/>
  <button> Submit </button>
</form>
<script>
document.getElementById('date').addEventListener('change', function() {
    var dob = new Date(this.value);
    var today = new Date();
    var age = today.getFullYear() - dob.getFullYear();
    var m = today.getMonth() - dob.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) {
        age--;
    }
    if (age > 16) {
        document.getElementById('ageMessage').innerText = "You are over 16 years old.";
    } else {
        document.getElementById('ageMessage').innerText = "You must be over 16 years old.";
    }
});
document.getElementById('pwdc').addEventListener('change', function() {
    var pwd = document.getElementById('pwd').value;
    var pwdc = this.value;
    var messageElement = document.getElementById('passwordMatchMessage');
    if (pwd === pwdc) {
        messageElement.innerText = "Passwords match.";
    } else {
        messageElement.innerText = "Passwords do not match.";
    }
});
</script>

</body>
</html>