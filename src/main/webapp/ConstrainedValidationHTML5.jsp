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

<form action="RegisterController" method="POST" onsubmit="return validateForm()">
  <label for="name"> Name:</label><br/>
  <input type="text" id="name" name="name" placeholder="Name" value="${model.name}" required><br/>
  <label for="user"> UserName (cannot repeat):</label><br/>
  <input type="text" id="user" name="user" placeholder="UserName" value="${model.user}" required><br/>
  <label for="mail"> Mail (cannot repeat):</label><br/>
  <input type="email" id="mail" name="mail" placeholder="Mail" value="${model.mail}" required pattern="[^@\s]+@[^@\s]+\.[^@\s]+"><br/>
  <label for="birth"> Date of Birth (Age > 16):</label><br/>
  <input type="date" id="date" name="born" value="${model.born}" required><br/>
  <label for="pwd1"> Password: </label><br/>
  <input type="password" id="pwd" name="pwd" placeholder="Password" value="${model.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z@$!%*?&\d]{6,}$"><br/>
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

	const form = document.getElementById("regform");
	const pwd = document.getElementById("pwd");
	const pwdc = document.getElementById("pwdc");
	
	
	var checkPasswordValidity = function() {
		 if (pwdc.value !== pwd.value) {
			pwdc.setCustomValidity("Passwords must match!");
		} else {
			pwdc.setCustomValidity("");
		}
	}
	
    pwdc.addEventListener("input", checkPasswordValidity, false);
    pwd.addEventListener("input", checkPasswordValidity, false);

    const birthDate = document.getElementById("date");
    function checkAgeValidity() {
        console.log("Hola");
        const today = new Date();
        const dateOfBirth = new Date(birthDate.value);
        let age = today.getFullYear() - dateOfBirth.getFullYear();
        const m = today.getMonth() - dateOfBirth.getMonth();

        if (m < 0 || (m === 0 && today.getDate() < dateOfBirth.getDate())) {
            age--;
        }

        if (age < 16) {
        	birthDate.setCustomValidity("You must be at least 16 years old.");
        } else {
        	birthDate.setCustomValidity("");
        }
    }

    birthDate.addEventListener("input", checkAgeValidity, false);

    form.addEventListener("submit", function(event) {
        checkPasswordValidity();
        checkAgeValidity();
        if (!form.checkValidity()) {
            form.reportValidity();
            event.preventDefault();
        }
    }, false);
</script>

</body>
</html>