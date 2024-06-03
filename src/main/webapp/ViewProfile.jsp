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
            <h4 id="profileName"><%= user.getName() %></h4>
            <p id="profileUser">Username: <%= user.getUser() %></p>
            <p id="profileEmail">Email: <%= user.getMail() %></p>
            <p id="profileBorn">Date of Birth: <%= user.getBorn() %></p>
            <p id="profileFavSinger">Favorite Singer: <%= user.getFavSinger() %></p>
            <p id="profileFavSong">Favorite Song: <%= user.getFavSong() %></p>
            <p id="profilePref">Preferred Genre: <%= user.getPref() %></p>
            <button class="w3-button w3-theme-d1 w3-margin-top" onclick="document.getElementById('editModal').style.display='block'">Edit Profile</button>
        </div>
    </div>
</div>

<!-- Modal for Editing Profile -->
<div id="editModal" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-padding-16">
            <span onclick="document.getElementById('editModal').style.display='none'" class="w3-button w3-display-topright">&times;</span>
            <h2>Edit Profile</h2>
            <form id="editProfileForm">
                <p><label>Name</label>
                <input class="w3-input w3-border" type="text" name="name" value="<%= user.getName() %>"></p>
                <p><label>Email</label>
                <input class="w3-input w3-border" type="text" name="email" value="<%= user.getMail() %>"></p>
                <p><label>Date of Birth</label>
                <input class="w3-input w3-border" type="date" name="date_of_birth" value="<%= user.getBorn() %>"></p>
                <p><label>Favorite Singer</label>
                <input class="w3-input w3-border" type="text" name="fav_singer" value="<%= user.getFavSinger() %>"></p>
                <p><label>Favorite Song</label>
                <input class="w3-input w3-border" type="text" name="fav_song" value="<%= user.getFavSong() %>"></p>
                <p><label>Preferred Genre</label>
                <input class="w3-input w3-border" type="text" name="pref_genre" value="<%= user.getPref() %>"></p>
                <p><button class="w3-button w3-theme-d1" type="button" id="saveChangesBtn">Save Changes</button></p>
            </form>
        </div>
    </div>
</div>


<script>

</script>
