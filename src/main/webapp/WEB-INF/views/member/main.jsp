<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

 
</head>
<body>

 <h1>메인페이지입니다.</h1>  
 <a href="login">로그인하러가기</a><br>
 <a href="logout">로그아웃하러가기</a><br>
 <a href="myinfo">내 정보 보러가기</a><br>
 <a href="addMember">회원가입</a><br>
${insertMember}
${deleteMember}
</body>
</html>