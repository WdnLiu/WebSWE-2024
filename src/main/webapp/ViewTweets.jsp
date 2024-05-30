<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

 <script type="text/javascript">
 $(document).ready(function(){
	$('#navigation').load('MenuController');
	$('#lcolumn').load('GetNotFollowedUsers');
	$('#rcolumn').load('GetUserInfo');
	$('#iterator').load('GetUserTweets');
 });
</script>

    <!-- Input Column -->
<div class="w3-col m2"><p></div>
<div class="w3-container w3-padding w3-row-padding w3-card-4 w3-padding-24 center w3-col m8">
  <h6 class="w3-opacity"> ${sessionScope.login.name}, what are you thinking? </h6>
  <p id="tweetContent" contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
  <button id="addTweet" type="button" class="w3-button w3-theme"><i class="fa fa-pencil" ></i> Post</button> 
</div>
<br/>

    <!-- Middle Column -->
<div class="container">
	<div class="w3-col m3"><p></div>
    <div class="w3-col m6">
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <img src="/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
        <span class="w3-right w3-opacity">1 min</span>
        <h4>John Doe</h4><br>
        <hr class="w3-clear">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
              <img src="/w3images/lights.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
            </div>
            <div class="w3-half">
              <img src="/w3images/nature.jpg" style="width:100%" alt="Nature" class="w3-margin-bottom">
          </div>
        </div>
        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
      </div>
    <!-- End Middle Column -->
    </div>
    </div>