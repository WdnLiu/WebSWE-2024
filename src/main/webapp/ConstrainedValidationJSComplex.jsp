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
/* This is the style of our error messages */
.error {
  padding: 0;
  color: white;
  background-color: red;
}

</style>
</head>
<body>

<form novalidate action="RegisterController" id="regform" method="POST">
  <label for="user"> User name:</label><br/>
  <input type="text" id="user" name="user" placeholder="Name" value="${model.user}" required>
  <span id="error_name" class="error"> <c:out value="${model.errors['user']}"/> </span><br/>
  <label for="mail"> Mail:</label><br/>
  <input type="email" id="mail" name="mail" placeholder="Mail" value="${model.mail}" required>
  <span id="error_mail" class="error"> <c:out value="${model.errors['mail']}"/> </span> <br/>
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

<script>

	const form  = document.getElementById("regform");
	const user = document.getElementById("user");
	const mail = document.getElementById("mail");
	const userError = document.getElementById("error_name");
	const mailError = document.getElementById("error_mail");
	
	user.addEventListener("input", function (event) {
		// Each time the user types something, we check if the
		// form fields are valid.
		if (user.validity.valid) {
		 // In case there is an error message visible, if the field
		 // is valid, we remove the error message.
		 userError.innerHTML = ""; // Reset the content of the message
		} else {
		 // If there is still an error, show the correct error
		 showUserError();
		}
	});
	
	
	mail.addEventListener("input", function (event) {
		// Each time the user types something, we check if the
		// form fields are valid.
		if (mail.validity.valid) {
		 // In case there is an error message visible, if the field
		 // is valid, we remove the error message.
		 mailError.innerHTML = ""; // Reset the content of the message
		} else {
		 // If there is still an error, show the correct error
		 showMailError();
		}
	});
	
	form.addEventListener("submit", function (event) {
		// if the email field is valid, we let the form submit
		if(!user.validity.valid || !mail.validity.valid) {
		 // If it isn't, we display an appropriate error message
		 showUserError();
		 showMailError();
		 // Then we prevent the form from being sent by canceling the event
		 event.preventDefault();
		}
	});
	
	function showUserError() {
		if(user.validity.valueMissing) {
		 // If the field is empty
		 // display the following error message.
		 userError.textContent = "You need to enter your user name.";
		}
	}
	
	function showMailError() {
		if(mail.validity.valueMissing) {
		 // If the field is empty
		 // display the following error message.
		 mailError.textContent = "You need to enter your e-mail.";
		} else if(mail.validity.typeMismatch) {
		 // If the field doesn't contain an email address
		 // display the following error message.
		 mailError.textContent = "Entered value needs to be an e-mail address.";
		}
	}

</script>

</body>
</html>