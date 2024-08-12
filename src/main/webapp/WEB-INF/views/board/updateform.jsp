<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<!--스타일시트 초기화-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />

<link rel="stylesheet" href="/css/boardWrite.css" />
<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){
    $("#cancel-btn").on('click', function(){
        window.history.back();
    });
});
</script>
</head>
<body>
    <%@ include file="../header.jsp" %>

<div class="inner" id=writeform>
	<form action="communityboardupdate" method="post" id="post">
	
	<div class="header">
		<button type="button" id="cancel-btn">취소</button>
		<button type="submit">수정</button>	
	</div><br/>
	
		<input type="hidden" value="${detaildto.seq}" name="seq">
		
      <div class="input title">
        <input
          type="text"
          id="title"
          name="title"
          value="${detaildto.title}"
          maxlength="100"
          required
        />
      </div>
      <hr />

      <div class="input content">
        <textarea
          id="content"
          name="contents"
          rows="20"
          cols="50"
        >${detaildto.contents}</textarea>
      </div>
      
		<div class="detail">
		게시글 암호 : <input type="password" id="pw" name="pw" placeholder=" 암호를 입력해주세요."><br>
		</div><br/>
	</form>
</div>
</body>
</html>
