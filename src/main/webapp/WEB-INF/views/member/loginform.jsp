<%@ page import="boardmapper.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<script src="/jquery-3.7.1.min.js"></script>  
<script src="/js/header.js"></script> 
<script>
$(document).ready(function() {

});
</script>
</head>
<body>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">로그인</h1>
	</div>
</div>
<div class="container" align="center">
	<div class="col-md-4 col-me-offset-4">
		<h3 class="form-signin-heading">로그인</h3>
		<%
			String error = request.getParameter("error");
			if(error!=null){
				out.print("<div class='alert alert-danger'>");
				out.print("아이디와 비밀번호를 확인해주세요.");
				out.print("</div>");
			}
		%>
		<form class="form-signin" action="loginprocess" method="post">
			<div class="form-group">
				<label class="sr-only">User Name</label>
				<input name="id" class="form-control" placeholder="ID" required autofocus>
			</div>
			<div class="form-group">
				<label class="sr-only">Password</label>
				<input type="password" name="password" class="form-control" placeholder="Password" required>
			</div>
			<input class="btn btn-lg btn-success btn-block" type="submit" value="로그인">
			<input class="btn btn-lg btn-secondary btn-block" type="button" onclick="openAddMember()" value="회원가입">
		</form>
	</div>
</div>