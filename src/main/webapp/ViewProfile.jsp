<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="models.User" %>

<%
    User user = (User) session.getAttribute("login");
    if (user == null) {
        // Datos de ejemplo, este código no debería verse nunca
        user = new User();
        user.setName("John Doe");
        user.setUser("johndoe");
        user.setMail("johndoe@example.com");
        user.setBorn("1990-01-01");
        user.setFavSinger("Example Singer");
        user.setFavSong("Example Song");
        user.setPref("Pop");
    }
%>


<!-- Profile Information -->
<div class="w3-container w3-card w3-round w3-white w3-section w3-center">
    <h2>Profile</h2>
    <div class="w3-row">
        <div class="w3-col m4">
            <img src="path_to_profile_picture" alt="Avatar" class="w3-circle" style="width:100%">
        </div>
        <div class="w3-col m8">
                <h4><%= user.getName() %></h4>
                <p>Username: <%= user.getUser() %></p>
                <p>Email: <%= user.getMail() %></p>
                <p>Date of Birth: <%= user.getBorn() %></p>
                <p>Favorite Singer: <%= user.getFavSinger() %></p>
                <p>Favorite Song: <%= user.getFavSong() %></p>
                <p>Preferred Genre: <%= user.getPref() %></p>
            <button class="w3-button w3-theme-d1 w3-margin-top">Edit Profile</button>
        </div>
    </div>
</div>
