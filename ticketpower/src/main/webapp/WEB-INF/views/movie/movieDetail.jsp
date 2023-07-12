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
	
	<form>
		<input type="hidden" id="movieIdInput" name="movieId" value="${movieDetail.movieId }" required>
		<input type="hidden" id="memberIdInput" name="MemberId" value="user6" required>
		<input type="text"   id="reviewInput" placeholder="리뷰를 작성해주세요." name="review" required>
		<input type="number" id="reviewLikeInput" max="5" min="1" name="reviewLike" required/>
		<button type="button" id="registBtn">등록</button>
	</form>
	
	<!-- 자바스크립트로 처리할까? -->
	<ul id="reviewUl">
		<!-- <c:forEach items="${reviewList }" var="r">
			<li>
				<div>
					<input type="text" value="${r.memberId }" />
					<h4>${r.reviewDate }</h4>
					<input type="text" value="${r.review }" />
					<div>
						<button class="modBtn">수정</button>
						<button class="delBtn">삭제</button>
					</div>
				</div>
			</li> -->
			<!-- </c:forEach> -->
			<br>
	</ul>
	<script>
		const movieId = document.getElementById("movieIdInput");
		const memberId = document.getElementById("memberIdInput");
		const review = document.getElementById("reviewInput");
		const reviewLike = document.getElementById("reviewLikeInput");
		const registBtn = document.getElementById("registBtn");
		const modBtn = document.querySelectorAll(".modBtn");
		const delBtn = document.querySelectorAll(".delBtn");
		
		
		registBtn.addEventListener("click",clickRegistBtn)
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
										.append($("<input/>").val(review.memberId).attr("readonly",true).attr("placeholder","리뷰를 입력하세요."))
										.append($("<h4/>").text(convertDate(review.reviewDate)))
										.append($("<input/>").val(review.review).attr("readonly",true).attr("placeholder","김치")))
										.append($("<button/>").text("수정").on("click",(e)=>{
											const {children} = e.currentTarget.parentElement.children[0]
											$(children[0]).attr("readonly",false)
											// console.log($(children[1]).attr("readonly",false))
											$(children[2]).attr("readonly",false)
										}))
										.append($("<button/>").text("삭제")))
							$("#reviewUl").append("<br>")
						}
					)
				}
			})
		}
		
		showReview();

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
	</script>

</body>
</html>