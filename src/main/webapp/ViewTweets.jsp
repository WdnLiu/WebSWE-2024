<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container center">
    <div class="w3-col"><p></div>
    <div class="w3-col">
        <c:forEach var="tweet" items="${tweets}">
            <div id="${tweet.id}" class="w3-container w3-card w3-white w3-round w3-margin"><br>
                <img src="/path/to/avatar.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                <span class="w3-right w3-opacity">1 min</span>
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
                <c:if test="${tweet.uid == login.id}">
                    <button type="button" class="delTweet w3-button w3-red w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button> 
                    <button type="button" class="editTweet w3-button w3-indigo w3-margin-bottom" data-id="${tweet.id}" data-title="${tweet.title}" data-content="${tweet.content}" data-image-path="${tweet.image_path}"><i class="fa fa-pencil"></i> &nbsp;&nbsp;Edit</button> 
                </c:if>
            </div>
        </c:forEach>
    </div>
</div>

<!-- The Popup -->
<div id="editModal" class="w3-modal">
    <div class="w3-modal-content w3-animate-zoom">
        <div class="w3-container w3-padding-16">
            <span class="w3-button w3-display-topright" onclick="document.getElementById('editModal').style.display='none'">&times;</span>
            <h4>Edit your tweet:</h4>
            <form id="editForm" action="editTweet" method="post">
                <input type="hidden" id="tweetID" name="ID"><br>
                <label for="content">Content:</label>
                <textarea id="tweetContenido" name="content" class="w3-input w3-border"></textarea><br>
                <button type="submit" id="editTweetSubmit" class="w3-button w3-indigo">Save Changes</button>
            </form>
        </div>
    </div>
</div>

<script>
    // Get the modal
    var modal = document.getElementById('editModal');

    // When the user clicks the button, open the modal 
    document.querySelectorAll('.editTweet').forEach(button => {
        button.onclick = function() {


            const tweetContent = this.getAttribute('data-content');
            const tweetID = this.getAttribute('data-id');



            console.log('Tweet Content:', tweetContent);
            console.log('Tweet ID:', tweetID);



            document.getElementById('tweetContenido').value = tweetContent;
            document.getElementById('tweetID').value = tweetID;

            modal.style.display = 'block';
        };
    });

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    };
</script>