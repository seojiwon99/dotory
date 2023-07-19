<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link rel="stylesheet" href="css/movieList.css">
</head>

<body>
	<div class="mv_list">
		<ul class="mv_list_ul">
			<c:forEach items="${movieList}" var="m">
				<li>
					<div class="mv_card" >
						<a href="movieDetailPage.do?movieId=${m.movieId}">
						<c:choose>
						<c:when test="${m.movieId > 81774 and not empty m.moviePosterImg}">
						<img src="images/${m.moviePosterImg}" style="width:160px" class="card-img-top"/>	
						</c:when>
						<c:when test="${empty m.moviePosterImg}">
							<img src="images/user11.jpg" style="width:160px" class="card-img-top"/>
						</c:when>
						<c:otherwise>
						<img src="https://image.tmdb.org/t/p/w300/${m.moviePosterImg }"				
						class="card-img-top" alt="mvImg">
						</c:otherwise>
						</c:choose>
						</a>
						<div class="card-body">
							<h5 class="card-title">${m.movieName }</h5>
							<div>
								<span id="like">평점:${m.movieLike }</span>
								<c:choose>
									<c:when test="${m.movieAge != 0}">
										<p class="card-text">${m.movieAge}세 이상</p>
									</c:when>
									<c:otherwise>
										<p class="card-text">전체이용가</p>
									</c:otherwise>
								</c:choose>
							</div>
							<a href="movieDetailPage.do?movieId=${m.movieId}" class="btn mv_list_btn">자세히</a>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>