<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Tweets</title>
    <link rel="stylesheet" href="path/to/your/css/styles.css">
</head>
<body>
    <div class="container">
        <div class="w3-col m3"><p></div>
        <div class="w3-col m6">
            <c:forEach var="tweet" items="${tweets}">
                <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                    <img src="/path/to/avatar.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                    <span class="w3-right w3-opacity">1 min</span>
                    <h4>${tweet.title}</h4><br>
                    <p>By ${tweet.user.name}</p>
                    <hr class="w3-clear">
                    <p>${tweet.content}</p>
                    <div class="w3-row-padding" style="margin:0 -16px">
                        <div class="w3-half">
                            <img src="/path/to/image1.jpg" style="width:100%" alt="Image 1" class="w3-margin-bottom">
                        </div>
                        <div class="w3-half">
                            <img src="/path/to/image2.jpg" style="width:100%" alt="Image 2" class="w3-margin-bottom">
                        </div>
                    </div>
                    <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i> Like</button>
                    <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i> Comment</button>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
