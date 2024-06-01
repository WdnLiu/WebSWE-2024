<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="models.User" %>

<script type="text/javascript">
 $(document).ready(function(){
    $('#navigation').load('MenuController');
    $('#lcolumn').load('GetNotFollowedUsers');
    $('#rcolumn').load('ViewProfileController');
    $('#iterator').load('ViewOwnTweetsController');
 });
</script>
<!-- Input Column -->
<div class="w3-container w3-card w3-round w3-white w3-section">
	<h6 class="w3-opacity"> ${user.name}, what are you thinking? </h6>
	<p id="tweetContent" contenteditable="true" class="w3-border w3-padding"> </p>
	<input type="file" id="tweetFile" name="file" accept="image/png, image/jpeg, image/gif"/><br/>
	<button id="addTweet" type="button" class="w3-button w3-theme w3-section"><i class="fa fa-pencil"></i> &nbsp;Post</button> 
</div>

<br/>

<div id="iterator"></div>
