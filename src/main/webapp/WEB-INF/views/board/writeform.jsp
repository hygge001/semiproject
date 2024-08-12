<%@ page import="boardmapper.MemberDTO"%>
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
<script src="/js/boardWrite.js"></script>
<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){
    $('form').submit(function() {
        var checked = $('input[name="boardname"]:checked').length > 0;
        if (!checked) {
            alert("라디오 버튼 중 하나를 선택해주세요.");
            return false;
        }
    });
});
</script>
</head>
<body>
    <%@ include file="../header.jsp" %>

<div class="inner" id=writeform>
	<form id=post action="boardwrite" method="post">
	
	<div class="header">
		<div class="board-check">
    		<div class="radio-item"> 
        		<input type="radio" id="product" name="boardname" value="상품거래">
       			<label for="product">상품거래</label>
    		</div>
    	<div class="radio-item">
        		<input type="radio" id="community" name="boardname" value="커뮤니티">
        		<label for="community">커뮤니티</label>
    	</div>
	</div>
 	   		
		<button type="submit">등록</button><br/>
	</div>
	
	<input type=hidden name="writer" value="<%=memberID %>">
      <div class="input title">
        <input
          type="text"
          id="title"
          name="title"
          placeholder=" 제목을 입력해주세요."
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
          placeholder="내용"
        ></textarea>
      </div>
      <!--  
		<div class="file-upload-wrapper">
    		<input type="file" name="file" class="upload" multiple id="file-upload" />
    			<label for="file-upload" class="custom-file-upload">
        				파일업로드
    			</label>
    		<span id="file-upload-filename">No files selected</span>
		</div>-->
      
		<div class="detail">
		게시글 암호 : <input type=password id="pw" name="pw" placeholder=" 암호를 입력해주세요."><br>
		</div><br/>
	</form>
		
	
</div>
</body>
</html>