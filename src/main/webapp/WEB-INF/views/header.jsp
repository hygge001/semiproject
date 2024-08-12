<%@ page import="boardmapper.MemberDTO"%>  
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

<%
    String memberName = null;
	String memberID = null;
    MemberDTO memberdto = (MemberDTO) session.getAttribute("memberdto");
    if (memberdto != null) {
        memberName = memberdto.getName();
        memberID = memberdto.getId();
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>header</title>
<link rel="icon" href="images/logo.png" />
<!--스타일시트 초기화-->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />

<link rel="stylesheet" href="/css/header.css" />
<script src="/js/header.js"></script>
<script src="/jquery-3.7.1.min.js"></script>   
<script>
$(document).ready(function() {

});
</script>
</head>
<body>
    <header>
        <div class="inner">
            <div class="logo_ctnr">
                <a href="/" class="logo">
                    <img src="/images/logo.png" alt="로고 이미지" />중고장터
                </a>
                <div id="nav_icon" onclick="openModal()">
                    <div class="line"></div>
                </div>
                <div class="modal" id="myModal">
                    <div class="modal_content">
                        <div class="modal_head">
                            <span class="close" onclick="closeModal()">&times;</span>
                            <button onclick="openLoginWindow()">
                                <img src="/images/profile.png" alt="프로필 이미지" />
                            </button>
                            <br />
                            <div class="modal_login">
                            <% if (memberName != null) { %>
                                <span>반갑습니다, 
                                <a href="myinfo" class="sessionId"><%= memberName %></a> 님!</span>
                            <% } else { %>
                                <button onclick="openLoginWindow()">로그인</button>
                                <span> /  </span> <a href="addMember">회원가입</a>
                            <% } %>
                            </div>
                        </div>
                        <div class="modal_menu">
                            <ul>
                                <li><a href="board">전체글</a></li>
                                <li><a href="itemboard">상품거래</a></li>
                                <li><a href="communityboard">커뮤니티</a></li>
                                <li><a href="myinfo">마이페이지</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <nav id="main_nav">
                <ul class="menu">
                    <li><a class="a_menu" href="board">전체글</a></li>
                    <li><a class="a_menu" href="itemboard">상품거래</a></li>
                    <li><a class="a_menu" href="communityboard">커뮤니티</a></li>
                    <li><a class="a_menu" href="myinfo">마이페이지</a></li>
                </ul>
            </nav>
            <div class="sub_menu">
            <form action="boardsearchlist" class="board-search">
                <div class="search">
                    <input type="hidden" name="pagenum" value="1" />
                    <input type="hidden" name="item" value="all" />
                    <input type="text" name="word" id="searchInputMain" placeholder="검색" />
                    <button type="submit" id="searchBtnMain">
                        <img src="/images/search.png" alt="검색" />
                    </button>
                </div>
             </form>
                <ul class="login">
                    <li>
                        <% if (memberName != null) { %>
                            <button onclick="location.href='logout'">로그아웃
                        <% } else { %>
                            <button onclick="openLoginWindow()">로그인 
                        <% } %>
                    </button></li>
                </ul>
            </div>
        </div>
    </header>

    <footer>
        <a href="#"> 1:1 문의 </a> <a href="#"> 고객센터 </a> <a href="#"> 광고 및 제휴 안내 </a>
        <a href="#"> 이용약관 </a> <a href="#"> 서비스맵 </a> <span class="page_info"> © 중고거래 커뮤니티. </span>
    </footer>
</body>
</html>
