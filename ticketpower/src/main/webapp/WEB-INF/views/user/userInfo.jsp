<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko" style="background-color:black" >
<head>
	<link rel="stylesheet" href="css/userinfo.css" />
	<title>마이페이지</title>
	
</head>
<body>
	<h2>회원 상세정보</h2>
		<div class = "Box">
			<h3 class="imgtext">대표이미지</h3>
			      <img class="image" width="190px" src="images/${search.memberImg }" />
		</div>
		<br>
		<div class = "Box">
			<h4 class="text">아이디</h4>
				<br>
				<span class="input_area">
					<input
					id="memberId"
					name="memberId"
					value="${search.memberId}"
					readonly/>
				</span>
		</div>
		<br>
		<div class = "Box">
			<h4 class="text">이름</h4>
				<br>
				<span class="input_area">
					<input
				    id="memberName"
				    name="memberName"
				    value="${search.memberName}"
				  	readonly/>
				</span>
		</div>
		<br>
		<div class = "Box">
			<h4 class="text">전화번호</h4>
				<br>
				<span class="input_area">
					<input
				    id="memberTel"
				    name="memberTel"
				    value="${search.memberTel}"
				  	readonly/>
				</span>
		</div>
		<br>
		<div class = "Box">
			<h4 class="text">주소</h4>
				<br>
				<span class="input_area">
					<input
			        id="memberAddr"
			        name="memberAddr"
			        value="${search.memberAddr}"
			        readonly/>
	        	</span>
		</div>
		<br>
		<div class = "Box">	
			<h4 class="text">가입날짜</h4>		
				<br>    	
				<span class="input_area">
					<input
			        id="memberEdate"
			        name="memberEdate"
			        value="${search.memberEdate}"
			        readonly/>
			    </span>
		</div>
		<br>
		
		<div class = "linkBtn">
			<div id = "uPick" onclick="location.href='userPick.do';">찜한 영화
			</div>
			<div id = "uGood" onclick="location.href='userGood.do';">추천한 글
		    </div>
			<div id = uMod onclick="location.href='userModifyForm.do?memberId=${search.memberId }&memberName=${search.memberName }&memberTel=${search.memberTel}&memberAddr=${search.memberAddr}&memberEdate=${search.memberEdate}&memberImage=${search.memberImg}';">정보 수정
			</div>
			<div id = uMain onclick="location.href='movieListPage.do';">메인
			</div>
		</div>
</body>

<script></script>
</html>
