<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>

<a class="w3-bar-item w3-button w3-hide-large" id="LogoutController" href="MainController"> <i class="fa fa-home" aria-hidden="true"></i> </a>

<div class = "w3-hide-large w3-hide-small">
	<a class="menu w3-bar-item w3-button" id="ViewPageController" href="#"> View Tweets </a>
	<a class="menu w3-bar-item w3-button" id="ProfilePageController" href="ProfilePageController"> View Profile </a>
	<a class="menu w3-bar-item w3-button" id="PageChatController" href="PageChatController"> View Chat</a>
	<div class="w3-third">
    	<div class="w3-bar">
			<input type="text" class="menu w3-border-0 w3-padding" placeholder="Search..." style="width:80%">
			<a href="" class="w3-bar-item w3-button w3-right w3-border w3-border-indigo" style="width:20%"><i class="fa fa-search"></i></a>
    	</div>
  	</div>
	<a class="menu w3-bar-item w3-button w3-right" id="LogoutController" href="#"> Logout </a> 
</div>

<div class="w3-row w3-padding w3-theme-d2 w3-hide-medium w3-hide-small">
  <div class="w3-quarter">
    <div class="w3-bar">
      <a class="w3-bar-item w3-button" id="LogoutController" href="MainController"> <i class="fa fa-home" aria-hidden="true"></i> </a>
      <a class="menu w3-bar-item w3-button" id="ViewPageController" href="#"> View Tweets </a>
      <a class="menu w3-bar-item w3-button" id="ProfilePageController" href="ProfilePageController"> View Profile </a>
      <a class="menu w3-bar-item w3-button" id="PageChatController" href="PageChatController"> View Chat</a>
    </div>
  </div>

  <div class="w3-half">
    <input type="text" class="menu w3-border-0 w3-padding" placeholder="Search..." style="width:100%">
  </div>

  <div class="w3-quarter">
    <div class="w3-bar">
      <a href="" class="w3-bar-item w3-button w3-left"><i class="fa fa-search"></i></a>
	  <a class="menu w3-bar-item w3-button w3-right" id="LogoutController" href="#"> Logout </a>
    </div>
  </div>
</div>

<input type="text" class="menu w3-left w3-bar-item w3-input w3-border w3-border-indigo w3-hide-large w3-hide-medium" placeholder="Search..." style="width:50%">
<a href="" class="w3-bar-item w3-button w3-left w3-border w3-hide-medium w3-hide-large w3-border-indigo"><i class="fa fa-search"></i></a>
<a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="stack()">&#9776;</a>
<div id="stack" class="w3-bar-block w3-indigo w3-hide w3-hide-large w3-hide-medium">
	<a class="menu w3-bar-item w3-button" id="ViewTweetsController" href="#"> View Tweets </a>
	<a class="menu w3-bar-item w3-button" id="ViewProfileController" href="#"> View Profile </a>
	<a class="menu w3-bar-item w3-button" id="LogoutController" href="#"> Logout </a>
</div>
