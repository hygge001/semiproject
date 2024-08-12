<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){
	
});
</script>
    
</head>
<body>

	<!-- HEADER -->
	<div id="header-placeholder"></div>

	<div class="inner">
		<main id="main">
			<div id="up-side">
				<ul>
					<!-- 가로 배치 하기 -->
					<li><a href="../html/mypage.html" class=""><span>회원정보 보기</span></a></li>
					<li><a href="../html/mypost.html" class=""><span>작성 글 보기</span></a></li>
					<li><a href="../html/mycomment.html" class=""><span>작성 댓글 보기</span></a></li>
					<li><a href="../html/account.html" class=""><span>계좌 관리</span></a></li>
					<li><a href="../html/address.html" class=""><span>배송지 관리</span></a></li>
					<li><a href="../html/withdraw.html" class=""><span>탈퇴 하기</span></a></li>
				</ul>
			</div>
			<hr>

			<div id="down-side">
				<h2>탈퇴 사유를 알려주시면 개선을 위해 노력하겠습니다.</h2>
				<p>다중 선택이 가능해요</p>
				<form action="#" method="get">
					<input type="checkbox"> 사용 빈도가 낮고 개인정보 및 보안 우려 <br> <input
						type="checkbox"> 비매너 사용자들로 인한 불편 <br> <input
						type="checkbox"> 서비스 기능 불편 (상품등록/거래 등 <br> <input
						type="checkbox"> 이벤트 등의 목적으로 한시 사용 <br> <input
						type="checkbox"> 기타
					<textarea></textarea>
					<br>
					<button type="submit">제출</button>
				</form>

			</div>
		</main>
	</div>

</body>
</html>