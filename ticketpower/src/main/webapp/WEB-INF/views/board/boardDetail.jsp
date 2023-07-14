<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100" style="background-color:white;">
        <div class="row gx-4 gx-lg-5 align-items-center justify-content-center text-center">
            <div class="content" style="padding: 50px;">
                <table class="table">
                    <input type="hidden" value="${board.boardId}" id="boardId">
                    <input type="hidden" value="${good}" id="good">
                    <tr>
                        <th>제목</th>
                        <td>${board.boardTitle}</td>
                        <th>작성자</th>
                        <td>${board.memberId}</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td>${board.boardDate}</td>
                        <th>조회수</th>
                        <td>${board.boardCnt}</td>
                    </tr>
                    <tr>
                        <th>좋아요</th>
                        <td colspan="3"><input type="text" value="${board.boardGood}" id="goodBox" name="goodBox"
                                style="float: left; border: 0px solid salmon;">
                            <c:if test="${goodchk eq 0}">
                                <img src="images/nogood.png" style="width:30px" class="good">
                            </c:if>
                            <c:if test="${goodchk eq 1}">
                                <img src="images/good.png" style="width:30px" class="good">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <textarea cols="50" rows="10">${board.boardContent}</textarea>
                        </td>
                    </tr>
                </table>
                <form>
                    <div class="row mb-3">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">reply</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="reply" name="reply">
                        </div>
                    </div>
                    <button type="button" id="addreplyBtn" class="btn btn-primary">댓글 등록</button>
                </form>
                <table class="table">
                    <thead>
                        <tr>
                            <th>작성자</th>
                            <th>내용</th>
                            <th>날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${empty reply}">
                    		<tr>
                    			<td colspan="3">등록된 댓글이 없습니다.</td>
                    		</tr>
                    	</c:if>
                    	<c:if test="${!empty reply}">
	                    	<c:forEach items="${reply}" var="r">
	                    		<tr>
	                    			<td>${r.memberId}</td>
	                    			<td>${r.reply}</td>
	                    			<td>${r.replyDate}</td>
	                    		</tr>
	            
	                    	</c:forEach>
                    	</c:if>
                    </tbody>
                </table>
                <a href="boardList.do">목록으로</a>
            </div>
        </div>
    </div>
</header>
<script type="text/javascript">
    $('.good').on('click', function () {
        let boardId = $('#boardId').val();
        let good = $('#goodBox').val();
        $.ajax({
            url: 'boardGood.do',
            type: "POST",
            data: {
                boardId: boardId
            },
            success: function (result) {
                console.log(result);
                if (result == 0) {
                    alert("좋아요");
                    $('.good').attr("src", "images/good.png");
                    $('#goodBox').val(Number(good) + 1);
                } else if (result == 1) {
                    alert("좋아요 취소");
                    $('.good').attr("src", "images/nogood.png");
                    $('#goodBox').val(Number(good) - 1);
                }
            },
            error: function (err) {
                console.log(err);
            }

        })
    })

    $('#addreplyBtn').on('click',function(){
        let boardId = $('#boardId').val();
        let reply = $('#reply').val();
        console.log(boardId);
        console.log(reply);
        if(reply == null || reply == ''){
            alert("댓글을 입력해주세요");
        }else{
            $.ajax({
                url:'replyAdd.do',
                type:"POST",
                dataType:"json",
                data:{
                    boardId : boardId,
                    reply : reply
                },
                headers:{
                    'Content-type' : 'application/x-www-form-urlencoded'
                },
                success:function(result){
                    console.log(result);
                },
                error:function(err){
                    console.log(err);
                }
            })

        }
    })
</script>
