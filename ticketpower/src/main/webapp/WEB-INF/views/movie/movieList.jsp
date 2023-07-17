<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<style>

body{
	background-color:black;
	display:flex;
	flex-direction:column;
	align-items:center;
	color:rgb(240,240,240);
}
.btn{
	margin-top:140px;
	position: absolute;
	margin-left:50px;
	font-weight:bolder;
	color:black;
	background-color: white;
	border: 1px solid white;
	border-radius: 30px;
}
.card-img-top{
	display: block;
	margin:0px;
	padding:20px;
}
#like{
	width:100px;
	height:20px;
}
.card-text {
	text-overflow: ellipsis;
	word-break: break-all;
	white-space: nowrap;
	font-size:14px;
	margin:auto;
	position: absolute;
	margin-top:80px;
}

.card-body {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	grid-template-rows: 60px 80px 40px;
	width: 150px;
	margin:auto;
	height: 200px;
}
.card-body h5{
	grid-column: 1/4;
}
.card-body .card-text{
	grid-column: 2/4;
}

img {
	height: 300px;
}

/* li {
	height: 600px;
} */

.mv_list{
	background-color:rgba(0,0,0,0.3);
}

</style>
</head>

<body>
	<div class="mv_list" style="width: 90vw;">
		<ul style="display: flex; flex-wrap: wrap;">
			<c:forEach items="${movieList}" var="m">
				<li>
					<div class="card" style="width: 18rem;">
						<img src="https://image.tmdb.org/t/p/w300/${m.moviePosterImg }"
							class="card-img-top" alt="mvImg">
						<div class="card-body">
							<h5 class="card-title">${m.movieName }</h5>
							<span id="like">평점:${m.movieLike }</span>
							<c:choose>
								<c:when test="${m.movieAge != 0}">
									<p class="card-text">심의등급:${m.movieAge}세 이상</p>
								</c:when>
								<c:otherwise>
									<p class="card-text">심의등급:전체이용불가</p>
								</c:otherwise>
							</c:choose>
							<a href="movieDetailPage.do?movieId=${m.movieId}" class="btn">자세히</a>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>