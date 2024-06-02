<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Tweets</title>
    <link rel="stylesheet" href="path/to/your/css/styles.css">
</head>
<body>
    <div class="container center">
        <div class="w3-col"><p></div>
        <div class="w3-col">
            <c:forEach var="tweet" items="${tweets}">
                <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                    <img src="/path/to/avatar.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                    <span class="w3-right w3-opacity">1 min</span>
                    <h4>${tweet.title}</h4><br>
                    By ${tweet.user.name} <div class="w3-text-grey">@${tweet.user.user}</div>
                    <hr class="w3-clear">
                    <c:if test="${tweet.image_path != null}">
                        <div class="w3-row-padding" style="margin:0 -16px">
                            <div class="w3-center w3-m4">
                                <img src="${tweet.image_path}" style="width:50%" alt="Image 1" class="w3-margin-bottom">
                            </div>
                        </div>
                    </c:if>
                    <p>${tweet.content}</p> 
                    <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> Like</button>
                    <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i> Comment</button>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
