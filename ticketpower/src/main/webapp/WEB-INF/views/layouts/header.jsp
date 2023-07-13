<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/netflix.css" />
</head>
<body>
	<div class="head">
		<a role="button" class="" href="main.do">dotory메인으로</a>
		<!-- <a href="adminMainPage.do">관리자페이지=></a> -->
		
		<a role="button" class="" href="memberLoginForm.do">로그인</a>
		
		
		<a role="button" class="" href="memberRegistForm.do.do">회원가입</a>
		
    	<c:if test="${id ne null}">
    		<a href="userInfo.do?id=${id}">마이페이지</a>
    	</c:if>   	
   		
	</div>

</body>
</html>