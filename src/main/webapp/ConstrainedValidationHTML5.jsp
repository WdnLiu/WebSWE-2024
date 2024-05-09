<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        input:valid {
            border-left: 4px solid green;
        }
        input:invalid {
            border-left: 4px solid red;
        }
        body{
	        background:

	        url("resources/bg.jpg");
      }
    </style>
  </head>
<body>

<div class="container position-absolute top-50 start-50 translate-middle">
<div class="container border border-5 rounded-5 bg-light">
<div class="m-5">
    <h2>Fill the form to Register!</h2>Aesthetic from BootstrapCSS Framework<br><br>
<form action="RegisterController" method="POST" onsubmit="return validateForm()">
    <div class="row g-3">
        <div class="col-md-4">
            <div class="mb-6">
                <label for="user" class="form-label">Username (cannot repeat):</label>
                <div class="input-group">
                    
                    <span class="input-group-text">@</span>
                    <input type="text" class="form-control" id="user" name="user" placeholder="UserName" value="${model.user}" required><br/>
                </div>
				<c:if test="${model.errors['user'] != null}">
                    <div class="text-danger">${model.errors['user']}</div>
                </c:if>
            </div>
        </div>

        <div class="col-md">
            <label for="name" class="form-label"> Name:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="${model.name}" required>
        </div>
        <div class="col-md-3">
            <label for="birth"class="form-label"> Date of Birth:</label>
            <input type="date" id="date" class="form-control"name="born" value="${model.born}" required>
        	<c:if test="${model.errors['born'] != null}">
                <div class="text-danger">${model.errors['born']}</div>
            </c:if>
        </div>
        <div class="mb-3">
            <label for="mail"class="form-label"> Mail (cannot repeat):</label>
            <input type="email" class="form-control" id="mail" name="mail" placeholder="Mail" value="${model.mail}" required pattern="[^@\s]+@[^@\s]+\.[^@\s]+">
        	<c:if test="${model.errors['mail'] != null}">
                <div class="text-danger">${model.errors['mail']}</div>
            </c:if>
        </div>
    </div>
    <div class="row g-3">
        <div class="col-md">
            <label for="pwd1"class="form-label"> Password: </label>
            <input type="password" class="form-control"id="pwd" name="pwd" placeholder="Password" value="${model.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z@$!%*?&\d]{6,}$"><br/>
        </div>
        <div class="col-md">
            <label for="pwd2"class="form-label"> Confirm Password: </label>
            <input type="password" class="form-control"id="pwdc" placeholder="Confirm Password" value="${model.pwd}" required><br/><br/>
        	<c:if test="${model.errors['pwd'] != null}">
                <div class="text-danger">${model.errors['pwd']}</div>
            </c:if>
        </div>
    </div>
    <h4>Optional Fields:</h4>
    <div class="row g-3">
        <div class="col-md">
            <label for="favSinger"class="form-label"> Favourite Singer:</label>
            <input type="text" id="favSinger"class="form-control" name="favSinger" placeholder="favSinger" value="${model.favSinger}">
        </div>
        <div class="col-md">
            <label for="favSong"class="form-label"> Favourite Song:</label>
            <input type="text" id="favSong"class="form-control" name="favSong" placeholder="favSong" value="${model.favSong}">
        </div>
        <div class="col-md">
            <label for="pref" class="form-label"> Genre Preference:</label>
            <input type="text" id="pref" class="form-control"name="pref" placeholder="pref" value="${model.pref}">
        </div>
    <div class="mb-3">
        <br>
        <button class="btn btn-primary"> Submit </button>
    </div>
    </div>
</form>
</div>
</div>
</div>
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