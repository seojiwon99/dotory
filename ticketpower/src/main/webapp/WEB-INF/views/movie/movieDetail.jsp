<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	textarea{
		resize: none;
	}
body{
	background-image: url('https://image.tmdb.org/t/p/original/${movieDetail.movieBackImg}');
	background-size: contain; 
	height: 100vh; 
	width: 100vw;
	color:rgb(236, 236, 236);
}
.mv_container{
	background-color: rgba(37, 37, 37, 0.836);
	min-height: 100vh;
	
}
.h1 {
	display: block;
	color:white;
	margin-top: 20px;
}
li{
	list-style: none;
}
.mv_review_container .mv_review{
	display: flex;
	flex-direction: column;
	padding-left: 40px;
	width: 90%;
}



.review_input{
	display: flex;
	flex-direction: column;
	width: 70%;
	box-sizing: border-box;
}

.review_input textarea{
	width: 100%;
}

.review_input_one{
	margin-bottom: 10px;
}

#registBtn{
	width: 80px;
	align-self: end;
}

input {
	background-color: rgba(19, 19, 19, 0.5);
	border: none;
	border-radius: 5px;
}

.mv_btn{
	border: none;
	border-radius: 5px;
}

.mv_btn:hover{
	color:rgba(236, 236, 236, 0.486);
}

.mv_btn:not([type="number"]){
	background-color: blueviolet;
}


textarea {
	background-color: rgba(19, 19, 19, 0.5);
	border: none;
	border-radius: 5px;
}

.reviewLi div{
	display: flex;
	flex-direction: column;
}

.reviewLi textarea{
	width: 90%;
}

.reviewLi .mv_btn:last-child{
	margin-left: 5px;
}

*:focus{
	outline: none !important;
	border: none;
}



</style>
</head>
<body>
	<div class="container mv_container">
		<!-- 영화정보 -->
		<div class="movie_info">
			<h1 class="h1">${movieDetail.movieName }</h1>
			<hr>
			<p >${movieDetail.movieSummary}</p>
			<div>
			<h2>${movieDetail.movieAge }세 이상</h2>
			<h2>상영시간 : ${movieDetail.movieRuntime }분</h2>			
			</div>
		</div>

		<!-- 영화정보 끝 -->
		<div>
			<button id="likeBtn" class="mv_btn" type="button" class="button">❤</button>
		</div>

		<br>
		<div class="mv_review_container">
		<form class="mv_review">
			<input type="hidden" id="movieIdInput" name="movieId"
				value="${movieDetail.movieId }" required>
			<c:choose>
				<c:when test="${not empty id }">
					<div class="review_input">
						<div class="review_input_one">
							<input type="text" readonly id="memberIdInput" name="MemberId"
							value="${id }" required>
							<input type="number" id="reviewLikeInput" max="5" min="1"
							class="mv_btn" name="reviewLike" value="0" required />
						</div>
						<div>
							<textarea id="reviewInput" placeholder="리뷰를 작성해주세요."
							name="review" required ></textarea>
						</div>
						<button type="button" class="mv_btn btn" id="registBtn">등록</button>
					</div>
				</c:when>
				<c:when test="${empty id }">
					<input type="hidden" id="memberIdInput" name="MemberId"
						value="NULL" required>
					<textarea type="text" disabled id="reviewInput"
						placeholder="로그인을 해주세요" name="review" required></textarea>
					<button type="button" class="mv_btn" disabled id="registBtn">등록</button>
				</c:when>
			</c:choose>
		</form>
		</div>
		<!-- 자바스크립트로 처리할까? -->
		<ul id="reviewUl">
		<c:forEach items="${reviewList}" var="r">
			 <!-- <li>
				<div class="">
					<h3>${r.memberId}</h3>
					<h4>${r.reviewDate}</h4>
					<span>${r.reviewLike}</span>
					<textarea class="review" readonly="readonly" placeholder="김치">${r.review}</textarea>
					<input type="hidden" value="${r.reviewId}">
				</div>
				<div>
					<button>수정</button>
					<button>삭제</button>
				</div>
			</li>		  -->
		</c:forEach>
		</ul>
		<div class="center">
			<div class="pagination">
				<c:forEach begin="${page.startPage }" varStatus="status"
					end="${page.endPage }">
					<button onclick="page(event)">${status.count}</button>
				</c:forEach>

			</div>
		</div>
	</div>
	<script>
		const movieId = document.getElementById("movieIdInput");
		const memberId = document.getElementById("memberIdInput");
		const review = document.getElementById("reviewInput");
		const reviewLike = document.getElementById("reviewLikeInput");
		const registBtn = document.getElementById("registBtn");
		
		registBtn.addEventListener("click",clickRegistBtn)
		




		if("${pickVo}" != ""){
			$("#likeBtn").text("💙")
		}

		$("#likeBtn").on("click",clickLikeBtn)
		function clickLikeBtn(){
			$.ajax({
				type:"POST",
				url:"moviePick.do",
				data:{
					movieId : movieId.value,
					memberId : memberId.value,
				},
				success: function(data){
					if(data == 1){
						$("#likeBtn").text("💙")
					} else {
						$("#likeBtn").text("❤")
					}
				}
			})
		}


		//댓글등록버튼 이벤트
		function clickRegistBtn(){
			if(reviewLike.value === ""){
				alert("리뷰점수는 필수입니다.");
				return;
			}else if(reviewLike.value < 0 && reviewLike.value > 5){
				alert("리뷰점수는 0~5 범위로 입력해주세요. ")
			}
			$.ajax({
				type:"POST",
				url:"addReview.do",
				data:{
					movieId : movieId.value,
					memberId : memberId.value,
					review : review.value,
					reviewLike : reviewLike.value
				},
				success: function(data){
					makeReview(data)
				}
			})
			review.value = "";
			reviewLike.value = 0;
		}

		function page(e){
			$("#reviewUl").children().remove();
			showReview(e.target.innerText)
		}
		//댓글 리스트 보여주는 함수
		function showReview(page){
			$.ajax({
				type:"POST",
				url:"showReview.do",
				data:{
					movieId : movieId.value,
					page : page,
				},
				success: function(data){
					const list = JSON.parse(data);
					list.forEach((review)=>
						{
							
							$("#reviewUl").append($("<li/>").addClass("reviewLi").append($("<div/>")
										.append($("<h3/>").text(review.memberId))
										.append($("<h4/>").text(review.reviewUpdate ? convertDate(review.reviewUpdate):convertDate(review.reviewDate)))
										.append($("<textarea/>").addClass("review").text(review.review).attr("readonly",true).attr("placeholder","김치"))
										.append($("<input/>").val(review.reviewId).attr("type","hidden")))
										.append('${id}'=== review.memberId ? $("<button/>").addClass("mv_btn btn").text("수정").on("click",clickEditBtn): "")
										.append('${id}' === review.memberId ? $("<button/>").addClass("mv_btn btn").text("삭제").on("click",clickRemoveBtn):""))
							$("#reviewUl").append("<br>")
						}
					)
				}
			})
		}

		function clickRemoveBtn(e){
			const target = $(e.target);
			const reviewId = target.parent().children("div").children("input").last();
			const isOk = confirm("삭제하시겠습니까?");
			if(isOk && '${id}'){
				$.ajax({
					type:"POST",
					url:"removeReview.do",
					data:{
						reviewId:reviewId.val(),
					},success:function(data){
						if(data === "1"){
							alert("삭제됨");
							target.parent().remove()
						} else {
							alert("삭제안됨.");
						}
						
					},
					error:function(err){
						console.log(err);
					}
				})
			} else {
				alert("취소됨");
			}
			
		}
		//수정클릭함수
		function clickEditBtn(e){
			const target = $(e.target);
			target.off("click");
			target.parent().children("div").children("textarea").attr("readonly",false)
			target.text("수정완료").on("click",clickEditCompleteBtn)
		}

		//수정완료 클릭함수
		function clickEditCompleteBtn(e){
			const target = $(e.target);
			const review = target.parent().children("div").children("textarea").first()
			const reviewId = target.parent().children("div").children("input").last()
			const reviewDate = target.parent().children("div").children("h4");
			console.log(review.text(),reviewId.val())
			target.off("click");
			reviewDate.text(convertDate());
			//ajax 없이 테스트용
			// review.attr("readonly",true);
			// target.text("수정").on("click",clickEditBtn)
			$.ajax({
				type:"POST",
				url:"modifyReview.do",
				data:{
					review:review.text(),
					reviewId:reviewId.val(),
				},
				success:function(data){
					if(data === "1"){
						review.attr("readonly",true);
						target.text("수정").on("click",clickEditBtn)
						alert("수정완료")
					} else {
						alert("수정실패");	
					}
				},error:function(err){
					console.log(err)
				}
			})
		}

		
		//날짜 형식 바꾸는 함수
		function convertDate(date){
			let nowDate = new Date(date)
			if(date == undefined){
				nowDate = new Date();
			}
			const year = nowDate.getFullYear().toString();
			const month = (nowDate.getMonth()+1).toString().padStart(2,"0");
			const day = (nowDate.getDate()).toString().padStart(2,"0");
			const dateString = year+"-"+month+"-"+day;
			return dateString;
		}
		//리뷰 만들기 함수
		function makeReview(data){
			if(data === "1"){
				$("#reviewUl").children().remove();
				showReview(1); 
			}else{
				console.log("오류발생");
			}
		}

		showReview(1)
	</script>

</body>
</html>