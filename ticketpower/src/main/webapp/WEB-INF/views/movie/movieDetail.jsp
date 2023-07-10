<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="color:white">
	<h1 >
	${movieDetail.movieName }
	</h1>
	<h2>${movieDetail.movieAge }</h2>

	<hr>
	
	<form action="addReview.do" method="post">
		<input type="hidden" name="movieId" value="${movieDetail.movieId }">
		<input type="hidden" name="MemberId" value="user6">
		<input type="text" placeholder="리뷰를 작성해주세요." name="review">
		<input type="number" max="5" min="1" name="reviewLike"/>
		<input type="submit" value="등록">
	</form>
	
	<c:forEach items="${reviewList }" var="r">
		<div>
			<h3>${r.memberId }</h3>
		</div>
		<br>
	</c:forEach>

</body>
</html>