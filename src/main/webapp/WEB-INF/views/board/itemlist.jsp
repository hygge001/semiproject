<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티게시판</title>
<!--스타일시트 초기화-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />

<link rel="stylesheet" href="/css/boardMain.css" />
<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function() {
    $("#boardwritelink").on('click', function(e) {
        var sessionid = '<%=session.getAttribute("memberdto") %>';
        if (sessionid === 'null' || sessionid === '') {
            e.preventDefault();
            alert("로그인이 필요합니다.");
        } else {
            window.location.href = 'boardwrite';
        }
    });
});
</script>
</head>
<body>
    <%@ include file="../header.jsp" %>

    <div class="inner"><br/>

	<div class="board-header">
		
		<form action="boardsearchlist" class="board-search">
    		<div class="radio-item"> 
        		<input type="radio" name="item" value="all" id="all" checked>
       			<label for="all">모두</label>
    		</div>
    		<div class="radio-item">
        		<input type="radio" name="item" value="title" id="title">
        		<label for="title">제목</label>
    		</div>
    		<div class="radio-item">
        		<input type="radio" name="item" value="contents" id="contents">
        		<label for="contents">내용</label>
    		</div>
    		<div class="radio-item">
        		<input type="radio" name="item" value="writer" id="writer">
        		<label for="writer">작성자</label>
    		</div>
    		검색어 :<input type="text" name="word" id="word">
    
    		<input type="hidden" name="pagenum" value="1">
    		<input type="submit" value="검색">
		</form>
		
		<div class="right">
        <form action="#">
          <select name="sorting">
            <option value="recent" selected>최신순</option>
            <option value="view">조회순</option>
            <option value="like">관심순</option>
            <option value="comment">댓글순</option>
          </select>
        </form>
        
        <button id="boardwritelink">
          글쓰기
        </button>
        </div>
        
      </div>

	<div class="board-table">
		<table>
        	<thead>
            <tr>
              <th class="number text-center">게시판</th>
              <th class="title text-center">제목</th>
              <th class="writer text-center">글쓴이</th>
              <th class="date text-center">날짜</th>
              <th class="view-cnt text-center">조회수</th>
              <th class="like-cnt text-center">관심수</th>
            </tr>
          </thead>
          <tbody>
			<c:forEach items="${boardlist }" var="dto">
				<tr>
					<td class="boardname text-center">${dto.boardname }</td>
					<td class="title"><a href="boarddetail?seq=${dto.seq }">${dto.title }</a></td>
					<td class="writer text-center">${dto.writer }</td>
					<td class="date text-center">${dto.writingtime }</td>
					<td class="view-cnt text-center">${dto.viewcount }</td>
					<td class="like-cnt text-center">${dto.likecount }</td>
			</c:forEach>
			</tbody>
		</table>
	
	</div>

	<div class="outerpage">
		<div class="innerpage">
		<% 
		int totalboard = (Integer)request.getAttribute("totalboard");
		int totalpage = 0;
		if(totalboard % 15 == 0){
			totalpage = totalboard / 15;
		}
		else{
			totalpage = totalboard / 15 + 1;
		}

		for(int i = 1; i <= totalpage; i++){
		%>


		<a href="communityboard?pagenum=<%=i%>"> <%=i%> </a>
		<%
		}
		%>
		</div>
	</div>
	</div>
</body>
</html>





