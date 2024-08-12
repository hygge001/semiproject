<%@ page import="boardmapper.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />

<link rel="stylesheet" href="/css/header.css" />
<link rel="stylesheet" href="/css/mypage.css" />
    
</head>
<body>
<%
MemberDTO memberdto = null;	 
if(session.getAttribute("memberdto") != null){
	memberdto = (MemberDTO)session.getAttribute("memberdto");
 }
%>
	<!-- HEADER -->
	<div id="header-placeholder"></div>

	<div class="inner">
		<main id="main">
			<div id="up-side">
				<ul>
					<li><a href="myinfo" class=""><span>회원정보 보기</span></a></li>
					<li><a href="jsp로 변경예정" class=""><span>작성 글 보기</span></a></li>
					<li><a href="jsp로 변경예정" class=""><span>작성 댓글 보기</span></a></li>
				</ul>
			</div>
			<hr>
	<form id="withdraw-form" action="withdraw" method="get">
			<div id="down-side">
				<table>
					<tr>
						<td>아이디</td>
						<td id="delete_id"><%=memberdto.getId() %></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><%=memberdto.getName() %></td>
					</tr>	
					<tr>
						<td>이메일</td>
						<td><%=memberdto.getEmail() %></td>
					</tr>
					<tr>
						<td>휴대폰번호</td>
						<td><%=memberdto.getPhonenumber() %></td>
					</tr>			
					<tr>
						<td>주소</td>
						<td><%=memberdto.getAddress() %></td>
					</tr>
					<tr>
						<td>탈퇴하기</td>
						<td><input type="button" value="탈퇴" id="withdraw"></td>
					</tr>
				</table>
			</div>
		</form>
		</main>
	</div>
<script src="../../choisojin/js/header.js"></script>
<script src="../js/mypage.js"></script>
<script src="jquery-3.7.1.min.js"></script>
<script>
$("#withdraw-form").on('submit', function(e){e.preventDefault();});
	$("#withdraw").on('click', function(){
		let delete_id = $("#delete_id").html();
		alert(delete_id );
		location.href = "withdraw?id="+delete_id;
	});
</script>

</body>
</html>