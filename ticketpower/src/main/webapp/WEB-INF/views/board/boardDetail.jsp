<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> -->
        <header class="masthead">
            <div class="container px-4 px-lg-5 h-100" style="background-color:white;">
                <div class="row gx-4 gx-lg-5 align-items-center justify-content-center text-center">
                    <div class="content" style="padding: 50px;">
                        <table class="class=table table-bordered border-primary" style="width: 170px; height: 500px;text-align: center;">
                            <input type="hidden" value="${board.boardId}" id="boardId">
                            <input type="hidden" value="${id}" id="userId">
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
                                <td><input type="text" value="${board.boardGood}" id="goodBox"
                                        name="goodBox" style=" border: 0px solid salmon; width: 50px; text-align: center;" >
                                    </td>
                                    
                                    <td colspan="2">
                                        
                                        <c:if test="${goodchk eq 0}">
                                            <img src="images/nogood.png" style="width:30px " class="good">
                                        </c:if>
                                        <c:if test="${goodchk eq 1}">
                                            <img src="images/good.png" style="width:30px " class="good">
                                        </c:if>
                                </td>
                            </tr>
                            <tr>
                               <td colspan="4" style="height: 425px;" >
                                    <textarea cols="150" style="height: 425px; border:none" >${board.boardContent}</textarea>
                                    
                            </td>
                            </tr>
                        </table>
                            <!-- <div class="row mb-3">
                                <label for="inputEmail3" class="col-sm-2 col-form-label">reply</label>
                                <div class="col-sm-10" style="width: 40%;">
                                    <input type="text" class="form-control" id="reply" name="reply">
                                </div>
                                <button type="button" id="addreplyBtn" class="btn btn-primary">댓글 등록</button>
                            </div> -->
                            <div class="input-group mb-3" style="width: 100%; margin-bottom: 50px;">
                                <input type="text" class="form-control" placeholder="댓글" aria-label="Recipient's username" id="reply" name="reply" style="width: 1020px; margin-top: 30px;">
                                <button class="btn btn-outline-secondary" type="button" id="addreplyBtn" style="margin-top: 30px; float: left; ">등록</button>
                            </div>
                        <table class="table">
                            <thead>
                                <tr style="text-align:center;">
                                    <th>작성자</th>
                                    <th>내용</th>
                                    <th>날짜</th>
                                    <th>btn</th>               
                                </tr>
                            </thead>
                            <tbody class="replybody">
                                    <c:forEach items="${reply}" var="r">
                                        <tr class="addReply2" style="${r.replyLevel ne 1 ? 'background-color:rgba(0,0,0,0.05)':'' }">
                                            <input type="hidden" value="${r.replyId}">
                                            <td>
                                            
	                                        <c:forEach begin="1" end="${r.replyLevel - 1}">
	                                        	&nbsp&nbsp&nbsp
	                                        </c:forEach>
	                                        <c:if test="${r.replyLevel ne 1}">
	                                        
		                                        └
	                                        </c:if>
                                            	${r.memberId}
                                            </td>
                                            <td>${r.reply}</td>
                                            <td>${r.replyDate}</td>
                                            <td>
                                                <c:if test="${r.memberId == id }">
                                                    <input type="button" data-id="${r.replyId}" id="replydelete" class="replyAdd"
                                                        name="replydelete" value="삭제">
                                                    <input type="button" data-id="${r.replyId}" id="replyedit" class="replyAdd"
                                                        name="replydelete" value="수정">
                                                </c:if>
                                            </td>
                                        </tr>

                                    </c:forEach>
                          
                            </tbody>
                        </table>
                        <div style="text-align: center;">
                            <a href="boardList.do">목록으로</a>

                        </div>
                    </div>
                </div>
            </div>
        </header>
        <script type="text/javascript" >
            $(document).ready(function(){
                
            })


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
    
                $('#addreplyBtn').on('click', function () {
                    let boardId = $('#boardId').val();
                    let reply = $('#reply').val();
                    if (reply == null || reply == '') {
                        alert("댓글을 입력해주세요");
                    } else {
                        $.ajax({
                            url: 'replyAdd.do',
                            type: "POST",
                            dataType: "json",
                            data: {
                                boardId: boardId,
                                reply: reply,
                            },
                            headers: {
                                'Content-type': 'application/x-www-form-urlencoded'
                            },
                            success: function (result) {
                   
                                let str =`
                                    <tr class="addReply2">
                                        <td>\${result.memberId}</td>
                                        <td>\${result.reply}</td>
                                        <td>\${result.replyDate}</td>
                                        <td><button>삭제하기</button></td>
                                    </tr>
                                `   
                                $('tbody').prepend(str);
    
                                $('#reply').val('');
                            },
                            error: function (err) {
                                alert("등록실패");
                                console.log(err);
                            }
                        })
    
                    }
                })
                // $("input[name='replydelete']").on('click', function () {
                //     let id = $(this).data("id");
                //     let thi = $(this).parent().parent();
                //     console.log(this)
                //     $.ajax({
                //         url: 'adminReplyDelte.do',
                //         type: "post",
                //         dataType: "json",
                //         data: {
                //             replyid: id
                //         },
                //         headers: {
                //             'Content-type': 'application/x-www-form-urlencoded'
                //         },
                //         success: function (result) {
                //             if (result == 1) {
                //                 thi.remove();
                //             } else if (result == 0) {
                //                 alert("삭제실패");
    
                //             }
                //         },
                //         error: function (err) {
                //             console.log(err);
                //         }
    
                //     })
                // })
        
                $(document).on('click',".addReply2",function(){
                    let id = $('#memberId').val();
                    let parId = $(this).children("input").val();
                    $(this).removeClass();
       
                        let str = `
                        <tr>
                           	<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${id}</td>
                           	<td colspan="3">
                               <input type="text"  placeholder="대댓글" aria-label="Recipient's username" aria-describedby="button-addon2">
                               <button class="replyAdd" type="button" id="button-addon2"  data-par="\${parId}">등록</button>
                            </td>
                        </tr>
                                
                                `;
                                $(this).after(str);
  
                })
                
                $(document).on("click",".replyAdd",function(){
                    let board = $('#boardId').val();
                    let par = $(this).data("par");
                    let reply2 = $(this).siblings("input").val();
                    
                    console.log(board + par + reply2);
                    if (reply2 == null || reply2 == '') {
                        alert("댓글을 입력해주세요");
                    } else {
                        $.ajax({
                            url: 'replyAdd2.do',
                            type: "POST",
                            dataType:"json",
                            data: {
                                boardId: board,
                                reply: reply2,
                                parent: par
                            },
                            headers: {
                                'Content-type': 'application/x-www-form-urlencoded'
                            },
                            success: function (result) {
                                console.log(result);
                                
                            },
                            error: function (err) {
                                console.log(err);
                            }
                        })
    
                    }
                })
      
        </script>