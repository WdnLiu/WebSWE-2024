<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ page import="models.User" %>

<script type="text/javascript">
 $(document).ready(function(){
    $('#navigation').load('MenuController');
    $('#lcolumn').load('GetFollowedUsers');
    $('#rcolumn').load('Empty');
    $('#iterator').load('ViewTweetsController');
 });
</script>

<div id="iterator">
</div>
 