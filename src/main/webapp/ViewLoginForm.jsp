<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="LoginController" method="POST">
	<p>
    <label class="w3-text-indigo" for="user"> <b>Username</b></label>
    <input class="w3-input w3-light-grey" type="text" id="userLogin" name="userLogin" placeholder="UserName" value="${login.userLogin}" required>
	<c:if test="${login.errors['userLogin'] != null}">
        <div class="w3-text-indigo">${login.errors['userLogin']}</div>
    </c:if>
   	<p>
	<label class="w3-text-indigo" for="pwd"> <b>Password:</b> </label>
	<input class="w3-input w3-light-grey" type="password" id="pwd" name="pwd" placeholder="Password" value="${login.pwd}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z@$!%*?&\d]{6,}$">
	<p>
	<div class="w3-text-indigo">${login.errors['login']}</div>
	<p>
    <input class="w3-btn w3-indigo w3-border" type="submit" name="submit" value="Submit"></p>
</form>
