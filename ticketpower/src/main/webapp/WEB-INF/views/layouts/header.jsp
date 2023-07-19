<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<head>
<style>
	#img{
		width:35px;
		height:35px;
		cursor: pointer;
	}
	#home{
		position:absolute;
		margin-top:28px;
		color:white;
		font-size: 20px;
		cursor: pointer;
		-webkit-user-select:none;
  		-moz-user-select:none;
  		-ms-user-select:none;
 		user-select:none
	}
</style>
</head>
<div id="menu">
    <nav class="navbar-wrapper navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-backyard">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand site-name" href="movieListPage.do"><img src="images/dotory1.png" id="img" alt="logo"></a>
                <p id="home" onclick="location.href='movieListPage.do';">Dotory</p>
            </div>

            <div id="navbar-scroll" class="collapse navbar-collapse navbar-backyard navbar-right">
                <ul class="nav navbar-nav">
                    <li><a href="boardList.do">게시판</a></li>
                    <li><a href="userInfo.do">마이페이지</a></li>
                    <c:if test="${author == 'ADMIN'}">
                    <li><a href="adminMainPage.do">관리자페이지</a></li>
                    </c:if>
                    <li><a href="movieListPage.do">영화리스트</a></li>
    				<li><a href="memberLogout.do">로그아웃</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>