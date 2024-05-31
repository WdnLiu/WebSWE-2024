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
<script type="text/javascript">
 $(document).ready(function(){
    $('#navigation').load('MenuController');
    $('#lcolumn').load('GetNotFollowedUsers');
    $('#rcolumn').load('GetUserInfo');
    $('#iterator').load('GetUserTweets');
 });
</script>

<!-- Profile Information -->
<div class="w3-container w3-padding w3-row-padding w3-card-4 w3-padding-24 center w3-col m8 w3-margin-top">
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

<!-- User Activity -->
<div class="w3-container w3-padding w3-row-padding w3-card-4 w3-padding-24 center w3-col m8 w3-margin-top">
    <h2>Recent Activity</h2>
    <div id="userActivity" class="w3-container w3-card w3-white w3-round w3-margin">
        <!-- Example of user activity -->
        <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
            <img src="/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
            <span class="w3-right w3-opacity">1 min</span>
            <h4>John Doe</h4><br>
            <hr class="w3-clear">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
            <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
        </div>
    </div>
</div>
