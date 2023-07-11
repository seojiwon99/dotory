<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>adminmovielist</h3>
<table class="table" border="5" align="center">
    <thead>
        <tr>
            <th>일련번호</th>
            <th>영화제목</th>
            <th>시청나이</th>
            <th>장르</th>
            <th>상영시간</th>
            <th>좋아요</th>
            <th>이미지</th>
            <th>개봉날짜</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="mvlist" items="${mvlist}">
            <tr>
            <td>${mvlist.movieId}</td>
            <td>${mvlist.movieName}</td>
            <td>${mvlist.movieAge}</td>
            <td>${mvlist.movieGenre}</td>
            <td>${mvlist.movieRuntime}</td>
            <td>${mvlist.movieLike}</td>
            <td>${mvlist.moviePosterImg}</td>
            <td>${mvlist.movieRelease}</td>
        </tr>
    </c:forEach>
</tbody>
</table>
</body>
</html>