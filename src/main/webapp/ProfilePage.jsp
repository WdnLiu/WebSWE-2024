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
<div class="w3-col center"><p></div>
<div class="w3-container w3-padding w3-row-padding w3-card-4 w3-padding-24 center w3-col">
  <h6 class="w3-opacity"> ${sessionScope.login.name}, what are you thinking? </h6>
  <p id="tweetContent" contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
  <button id="addTweet" type="button" class="w3-button w3-theme"><i class="fa fa-pencil" ></i> Post</button> 
</div>
<br/>

<div id="iterator">
</div>
 