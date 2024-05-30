<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="imgs/upf.jpg">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Lab 3 template </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function(){
	
	$.ajaxSetup({ cache: false }); //Avoids Internet Explorer caching!	
	$(document).on("click",".menu",function(event) {
		$('#content').load($(this).attr('id'));
		event.preventDefault();
	});
	$(document).on("submit","form", function(event) {
		$('#content').load($(this).attr('action'),$(this).serialize());
	    event.preventDefault();
	});
	/* Add tweet */
	$(document).on("click","#addTweet",function(event){
		$.post( "AddTweet", { content: $("#tweetContent").text()}, function(event) {
			$("#content").load("GetOwnTimeline");		
		});
		event.preventDefault();
	});
	/* Delete tweet */
	$(document).on("click",".delTweet",function(event){
		var tweet = $(this).parent();
		$.post( "DelTweet", { id: $(this).parent().attr("id") } , function(event) {
			$("#content").load("GetOwnTimeline");				
		});
		event.preventDefault();
	});
	/* Follow user */
	$(document).on("click",".followUser",function(event){
		var user = $(this).parent();
		$.post( "FollowUser", { id: $(this).parent().attr("id") }, function(event) { 
			$("#content").load("GetFollowedUsers");
			$("#lcolumn").load("GetNotFollowedUsers");
		});
		event.preventDefault();
	});
	/* UnFollow user */
	$(document).on("click",".unfollowUser",function(event) {
		var user = $(this).parent();
		$.post( "UnFollowUser", { id: $(this).parent().attr("id") }, function(event) {
			$("#content").load("GetFollowedUsers");
			$("#lcolumn").load("GetNotFollowedUsers");
		});
		event.preventDefault();
	});
});
</script>
<style>
	input:valid {
	    border-left: 4px solid #3e32a8;
	}
	input:invalid {
	    border-left: 4px solid red;
	}
</style>
</head>
<body>

 	<!-- Begin Navigation -->
 	<div class="w3-bar w3-indigo" id="navigation">
    	<jsp:include page="${menu}" />
 	</div>
 	<!-- End Navigation -->
 
	<!-- Begin Content -->
	<div class="w3-container w3-card-4 w3-padding-24" id="content">
		<jsp:include page="${content}" />
	</div>
	<!-- End Content -->
	
	<script>
		function stack() {
  			var x = document.getElementById("stack");
  			if (x.className.indexOf("w3-show") == -1) {
    			x.className += " w3-show";
  			} else { 
    		x.className = x.className.replace(" w3-show", "");
  			}
		}
	</script>

  </body>
</html>