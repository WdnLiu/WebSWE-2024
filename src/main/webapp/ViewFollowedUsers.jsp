<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="u" items="${users}">       
<div id="${u.id}" class="w3-container w3-card w3-round w3-white w3-center w3-section">
	<p>Unfriend Suggestion</p>
    <img src="imgs/avatar6.png" alt="Avatar" style="width:50%"><br>
    <div>${u.name}</div>
   	<button type="button" class="unfollowUser w3-row w3-button w3-red w3-section"><i class="fa fa-user-plus"></i> &nbsp;Follow</button> 
</div>
</c:forEach>