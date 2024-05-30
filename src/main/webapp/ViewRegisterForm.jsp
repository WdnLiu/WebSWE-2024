<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="RegisterController" method="POST" onsubmit="return validateForm()">
	<div class="w3-row-padding">
	  	<div class="w3-third">
	    	<label class="w3-text-indigo" for="user"> <b>Username:</b> ${user.errors['user']} </label> 
	    	<input class="w3-input w3-light-grey" type="text" id="user" name="user" placeholder="UserName" value="${user.user}" required pattern="^[a-z0-9]{1,255}$">
	  	</div>
	  	<div class="w3-third">
	  		<label class="w3-text-indigo" for="name"> <b>Name:</b></label>
	    	<input class="w3-input w3-light-grey" type="text" id="name" name="name" placeholder="Name" value="${user.name}" required pattern="^.{1,255}$">
	  	</div>
	    <div class="w3-third">
	  		<label class="w3-text-indigo" for="birth"><b> Date of Birth:</b> ${user.errors['born']} </label>
	    	<input class="w3-input w3-light-grey" type="date" id="date" name="born" value="${user.born}" required>
	  	</div>
  	</div>
  	<p>
  	<div class="w3-row-padding">
  		<div class="w3-row-padding">
			<label class="w3-text-indigo" for="mail"> <b>Mail:</b> ${user.errors['mail']} </label>
	    	<input class="w3-input w3-light-grey" type="email" id="mail" name="mail" placeholder="Mail" value="${user.mail}" required pattern="[^@\s]+@[^@\s]+\.[^@\s]+">
  		</div>
  	</div>
	<p>
	<div class="w3-row-padding">
  		<div class="w3-half">
  			<label class="w3-text-indigo" for="pwd1"> <b>Password: </b> ${user.errors['pwd']} </label>
			<input class="w3-input w3-light-grey" type="password" id="pwd" name="pwd" placeholder="Password" value="${user.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z@$!%*?&\d]{6,}$">
  		</div>
  		<div class="w3-half">
  			<label class="w3-text-indigo" for="pwd2"> <b>Confirm Password: </b></label>
    		<input class="w3-input w3-light-grey" type="password" id="pwdc" placeholder="Confirm Password" value="${user.pwd}" required>
  		</div>
  	</div>
	<p>
    <br/>
	<p>
	<h3 class = "w3-text-indigo">Optional:</h3>
		<div class="w3-row-padding">
	  	<div class="w3-third">
			<label class="w3-text-indigo" for="favSinger"> <b>Favourite Singer:</b></label>
			<input class="w3-input w3-light-grey" type="text" id="favSinger" name="favSinger" placeholder="favSinger" value="${user.favSinger}">
	  	</div>
	  	<div class="w3-third">
			<label class="w3-text-indigo" for="favSong"> <b>Favourite Song:</b></label>
			<input class="w3-input w3-light-grey" type="text" id="favSong" name="favSong" placeholder="favSong" value="${user.favSong}">
	  	</div>
	    <div class="w3-third">
			<label class="w3-text-indigo" for="pref"> <b>Genre Preference:</b></label>
			<input class="w3-input w3-light-grey" type="text" id="pref" name="pref" placeholder="pref" value="${user.pref}">
	  	</div>
  	</div>
	<p>
    <input class="w3-btn w3-indigo w3-border" type="submit" name="sumbit" value="Submit"></p>
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
