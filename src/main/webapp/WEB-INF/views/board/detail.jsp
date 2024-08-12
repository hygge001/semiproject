<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글상세</title>
<!--스타일시트 초기화-->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />

<link rel="stylesheet" href="/css/boardDetail.css" />
<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){
	$("#deletebtn").on('click', function(){
	    let userpw = prompt("게시글 암호를 입력하세요");
	    let dbpw = $("#pw").val();
	    if(userpw == dbpw){
	        location.href = "communityboarddelete?seq=${detaildto.seq}";
	    }
	    else{
	        alert("암호를 확인하세요");
	    }
	});
    
    $("#updatebtn").on('click', function(){
            $("form").attr("action", "boardupdate");
            $("form").attr("method", "get");
            $("form").submit();
    });

});
</script>
</head>
<body>
    <%@ include file="../header.jsp" %>
    
    <div class="inner">

<form action="" method="">

    <div class="board-header">
    <input type=button value="수정" id="updatebtn">
    <input type=button value="삭제" id="deletebtn"> 
    <input id="pw" type=hidden name="pw" value=${detaildto.pw } >
    <input type=hidden value=${detaildto.seq } name="seq">
    </div><br/><br/>
    


    <div class="board_main">
    	
        <h2>${detaildto.title }</h2>
        <div class="info">
            <span><b>${detaildto.writer }</b></span>
            <span>|</span>
            <span>조회수 <b>${detaildto.viewcount }</b></span>
            <span>|</span>
            <span>추천수 <b>${detaildto.likecount }</b></span>
            <span>|</span>
            <span>댓글 <b>0</b></span>
            <span>|</span>
            <span>${detaildto.writingtime }</span>
        </div>
        <p>${detaildto.contents}</p>
    </div>
   
    <div class="comment">
    
        <div class="comment-form-wrapper">
    		<div class="comment-form">
        	<form action="/add-comment" method="post">
            	<input type="hidden" name="boardSeq" value="${detaildto.seq}">
            	<input type="hidden" name="writer" value="${detaildto.writer}">
            	<textarea name="contents" placeholder="댓글을 입력하세요" required></textarea>
            	<button type="submit">등록</button>
        	</form>
    		</div>
		</div>
        
        <div class="comment_header">
            <span>댓글 <b>0</b></span>
        </div>

        <div class="each_comment">
        <c:forEach var="comment" items="${comments}">
            <div class="comment_info">
                <img src="/images/profile.png" alt="Profile Image">
                <span>${comment.writer}<b>${comment.writingTime}</b></span>
            </div>
            <div class="comment_content">
                <p>${comment.contents}</p>
            </div>
           </c:forEach>
        </div>
    </div>
        
    <div class="buttons">
      <a id="list_btn" onclick="location.href='communityboard'">
        목록으로
      </a>
      <a id="next_btn" onclick="location.href='boarddetail?seq=${nextSeq}'">다음 글</a>
      <a id="prev_btn" onclick="location.href='boarddetail?seq=${prevSeq}'">이전 글</a>
    </div>
    </div>
</form> 
</body>
</html>