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
                                    <textarea cols="150" style="height: 425px; border:none" readonly >${board.boardContent}</textarea>
                                    
                            </td>
                            </tr>
                        </table>
        
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
                                        <tr class="${r.replyLevel ne 1 ? '':'addReply2' }" style="${r.replyLevel ne 1 ? 'background-color:rgba(0,0,0,0.05)':' '}">
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
                                                    <input type="button" data-id="${r.replyId}" id="replydelete" class="replydelete"
                                                    name="replydelete" value="삭제">
                                                    <input type="button" data-id="${r.replyId}" id="replyedit" class="replyedit"
                                                    name="replyedit" value="수정">
                                                </c:if>
                                            </td>
                                            <input type="hidden" value="${r.replyId}" class="rreplyId" data-parent="${r.parentNum}"> 
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
        let today = new Date();  

        let year = today.getFullYear(); // 년도
        let month = today.getMonth() + 1;  // 월
        let date = today.getDate(); 
        let to = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+date.toString()).slice(-2));
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
            

            $(document).on('click',".replyedit",function(e){
                e.stopPropagation();
                let t =  $(this).parent().parent().children().eq(1);
                let text = t.text();
                console.log(text);
                t.text('');
                t.append('<input type="text" value="'+ text +'" class="textbox" style="width:200px;">');
                t.append('<button type="button" class="edit">수정하기</button><button type="button" class="cancle">취소</button>');
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
                            console.log(result);
                            let str =`
                                <tr class="addReply2">
                                    <td>\${result.memberId}</td>
                                    <td>\${result.reply}</td>
                                    <td>\${to}</td>
                                    <td>
                                        <input type="button" data-id="\${result.replyId}" id="replydelete" class="replydelete"
                                        name="replydelete" value="삭제">
                                        <input type="button" data-id="\${result.replyId}" id="replyedit" class="replyedit"
                                        name="replydelete" value="수정">
                                        </td>
                                    <input type="hidden" value="\${result.replyId}" data-parent="\${result.parentNum}">
                                </tr>
                            `   
                            $('.replybody').prepend(str);

                            $('#reply').val('');
                        },
                        error: function (err) {
                            alert("등록실패");
                            console.log(err);
                        }
                    })

                }
            })
  
    
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
            

            $(document).on('click',".textbox",function(e){
                e.stopPropagation();
            })

            $(document).on('click',".edit",function(e){
                e.stopPropagation();    
                let td = $(this).parent();
                let replyId = $(this).parent().parent().children("input").val();
                let reply =$(this).siblings("input").val();
                if(reply == null || reply == ''){
                    alert("댓글을 입력해주세요.")
                }else{
                    $.ajax({
                        url: 'replyEdit.do',
                        type: "POST",
                        dataType:"json",
                        data: {
                            replyId: replyId,
                            reply: reply,
                        },
                        headers: {
                            'Content-type': 'application/x-www-form-urlencoded'
                        },
                        success: function (result) {
                            console.log(result);
                            td.children().remove();
                            td.text(result.reply)
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    })
                }
            })


            $(document).on("click",".cancle",function(e){
                e.stopPropagation();
               
                let text = $(this).siblings('input').val();
                $(this).parent().text(text);
                $(this).parent().children().remove();
            });
  

            $(document).on("click",".replydelete",function(e){
                e.stopPropagation();
                let tr = $(this).parent().parent().parent().children();
                let replyId = $(this).data('id');
                console.log($(this).parent().parent());
                let thistr = $(this).parent().parent()
                
                
                if (!confirm("삭제하시겠습니까?")) {
                    return false;                        
                } else {
                    $.ajax({
                        url: 'replyDelete.do',
                        type: "POST",
                        dataType:"json",
                        data: {
                            replyId: replyId,
                        },
                        headers: {
                            'Content-type': 'application/x-www-form-urlencoded'
                        },
                        success: function (result) {
                            console.log(result);
                            if(result == 1){
                                alert("삭제완료");
                                thistr.remove();
                                tr.each(function(index,data){
                                    if($(data).children().last().data('parent') == replyId){
                                        $(data).remove();
                                    }
                                
                                })
                            }else{
                                alert("삭제 실패");
                            }
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    })
                }
                
            });

            $(document).on("click",".replyAdd",function(){
                

                let board = $('#boardId').val();
                let par = $(this).data("par");
                let reply2 = $(this).siblings("input").val();
                let tr = $(this).parent().parent();
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
                            tr.children().remove();
                            let str = 
                            `   
                            <td>
                                &nbsp&nbsp&nbsp
                                └ \${result.memberId}
                                </td>
                                <td>\${result.reply}</td>
                                <td>\${to}</td>
                                <td>
                                    <input type="button" data-id="\${result.replyId}" id="replydelete" class="replydelete"
                                    name="replydelete" value="삭제">
                                    <input type="button" data-id="\${result.replyId}" id="replyedit" class="replyedit"
                                    name="replydelete" value="수정">
                                    </td>
                                    <input type="hidden" value="\${result.replyId}" data-parent="\${result.parentNum}"/>
                            `
                     
                            tr.css({'background-color':'rgba(0,0,0,0.05)',})
                            tr.append(str);

                        },
                        error: function (err) {
                            console.log(err);
                        }
                    })

                }
            })
  
        </script>