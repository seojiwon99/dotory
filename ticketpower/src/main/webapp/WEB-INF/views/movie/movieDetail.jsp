<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{
		display: block;
		background-color: rgba(0, 0, 0, 0.637);
		margin-top: 20px;
	}
</style>
</head>
<body style="color:white; background-color: black;">
	<div class="container" style="background-image: url('https://image.tmdb.org/t/p/original/${movieDetail.movieBackImg}'); background-size: cover; height: 100vh; width: 100vw;">
	
	<div >
		<h1 class="h1">
		${movieDetail.movieName }
		</h1>
		<hr>
		<p style="background-color: rgba(0, 0, 0, 0.678);">${movieDetail.movieSummary}</p>
		<h2>${movieDetail.movieAge }</h2>
	</div>
	<div>
		<button type="button" class="button">❤</button>
	</div>
	
	<br>
	<form>
		<input type="hidden" id="movieIdInput" name="movieId" value="${movieDetail.movieId }" required>
		<c:choose>
		<c:when test="${not empty id }">
		<input type="hidden" id="memberIdInput" name="MemberId" value="${id }" required>
		<input type="text"   id="reviewInput" placeholder="리뷰를 작성해주세요." name="review" required>
		<input type="number" id="reviewLikeInput" max="5" min="1" name="reviewLike" required/>
		<button type="button" id="registBtn">등록</button>		
		</c:when>
		<c:when test="${empty id }">
		<input type="hidden" id="memberIdInput" name="MemberId" value="NULL" required>
		<input type="text" disabled id="reviewInput" placeholder="로그인을 해주세요" name="review" required>
		<input type="number" disabled id="reviewLikeInput" max="5" min="1" name="reviewLike" required/>
		<button type="button" disabled id="registBtn">등록</button>
		</c:when>		
		</c:choose>
	</form>
	
	<!-- 자바스크립트로 처리할까? -->
	<ul id="reviewUl">
	</ul>
</div>
	<script>
		const movieId = document.getElementById("movieIdInput");
		const memberId = document.getElementById("memberIdInput");
		const review = document.getElementById("reviewInput");
		const reviewLike = document.getElementById("reviewLikeInput");
		const registBtn = document.getElementById("registBtn");
		
		registBtn.addEventListener("click",clickRegistBtn)
		//댓글등록버튼 이벤트
		function clickRegistBtn(){
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
		}
		//댓글 리스트 보여주는 함수
		function showReview(){
			$.ajax({
				type:"POST",
				url:"showReview.do",
				data:{
					movieId : movieId.value
				},
				success: function(data){
					const list = JSON.parse(data);
					list.forEach((review)=>
						{
							
							$("#reviewUl").append($("<li/>").append($("<div/>")
										.append($("<h3/>").text(review.memberId))
										.append($("<h4/>").text(review.reviewUpdate ? convertDate(review.reviewUpdate):convertDate(review.reviewDate)))
										.append($("<input/>").addClass("review").val(review.review).attr("readonly",true).attr("placeholder","김치"))
										.append($("<input/>").val(review.reviewId).attr("type","hidden")))
										.append('${id}'=== review.memberId ? $("<button/>").text("수정").on("click",clickEditBtn): "")
										.append('${id}' === review.memberId ? $("<button/>").text("삭제").on("click",clickRemoveBtn):""))
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
			target.parent().children("div").children("input").attr("readonly",false)
			target.text("수정완료").on("click",clickEditCompleteBtn)
		}

		//수정완료 클릭함수
		function clickEditCompleteBtn(e){
			const target = $(e.target);
			const review = target.parent().children("div").children("input").first()
			const reviewId = target.parent().children("div").children("input").last()
			const reviewDate = target.parent().children("div").children("h4");
			target.off("click");
			reviewDate.text(convertDate());
			//ajax 없이 테스트용
			// review.attr("readonly",true);
			// target.text("수정").on("click",clickEditBtn)
			$.ajax({
				type:"POST",
				url:"modifyReview.do",
				data:{
					review:review.val(),
					reviewId:reviewId.val()
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
				$("#reviewUl").append($("<li/>").append($("<div/>")
				.append($("<h3/>").text(memberId.value))
				.append($("<h4/>").text(convertDate()))
				.append($("<p/>").text(review.value))))
			}else{
				console.log("오류발생");
			}
		}



		showReview(); 
	</script>

</body>
</html>