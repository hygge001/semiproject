<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>메인페이지</title>
<!--스타일시트 초기화-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />

<link rel="stylesheet" href="/css/section.css" />
<script src="/js/section.js"></script>

<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function(){

});
</script>
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section>
        <div class="inner">

            <div class="table">
                <table class="hotBoard">
                    <thead>
                        <tr>
                            <th colspan="2"><img src=/images/post.png alt="게시글 이미지" />
                                인기게시글</th>
                        </tr>
                    </thead>

                    <tbody class="hotPosts">
                    	<c:forEach items="${recentPost }" var="dto">
							<tr>
								<td class="boardname text-center">${dto.boardname }</td>
								<td class="title"><a href="boarddetail?seq=${dto.seq }">${dto.title }</a></td>
								<td class="writer text-center">${dto.writer }</td>
								<td class="date text-center">${dto.writingtime }</td>
								<td class="view-cnt text-center">${dto.viewcount }</td>	
								<td class="like-cnt text-center">${dto.likecount }</td>
							</tr>
						</c:forEach>
                    </tbody>
                </table>
                <div class="table_group">
                    <table class="sellBoard">
                        <thead>
                            <tr>
                                <th colspan="2"><img src=/images/post.png
                                    alt="게시글 이미지" /> 상품등록 게시판</th>
                                <th>
                                    <button
                                        onclick="location.href='itemboard'">
                                        더보기</button>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="sellPosts">
                        	<c:forEach items="${recentPost }" var="dto">
								<tr>
									<td class="boardname text-center">${dto.boardname }</td>
									<td class="title"><a href="boarddetail?seq=${dto.seq }">${dto.title }</a></td>
									<td class="writer text-center">${dto.writer }</td>
									<td class="date text-center">${dto.writingtime }</td>
									<td class="view-cnt text-center">${dto.viewcount }</td>	
									<td class="like-cnt text-center">${dto.likecount }</td>
								</tr>
							</c:forEach>
                        </tbody>
                    </table>
                    <table class="commBoard">
                        <thead>
                            <tr>
                                <th colspan="2"><img src=/images/post.png
                                    alt="게시글 이미지" /> 커뮤니티 게시판</th>
                                <th><button
                                        onclick="location.href='communityboard'">
                                        더보기</button></th>
                            </tr>
                        </thead>
                        <tbody class="commPosts">
                        	<c:forEach items="${recentPost }" var="dto">
							<tr>
								<td class="boardname text-center">${dto.boardname }</td>
								<td class="title"><a href="boarddetail?seq=${dto.seq }">${dto.title }</a></td>
								<td class="writer text-center">${dto.writer }</td>
								<td class="date text-center">${dto.writingtime }</td>
								<td class="view-cnt text-center">${dto.viewcount }</td>
								<td class="like-cnt text-center">${dto.likecount }</td>
							</tr>
							</c:forEach>
						
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>

</body>
</html>