<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="masthead">
    <div class="container px-4 px-lg-5 h-100" style="background-color:white;">
        <div class="row gx-4 gx-lg-5 align-items-center justify-content-center text-center">
            <div class="content" style="padding: 50px;">
             	<form id="frm" name="frm" action="" method="post">
                        <select id="key" name="key">
                            <option value="all">전체</option>
                            <option value="userId">아이디</option>
                            <option value="title">제목</option>
                        </select>
                        <input name="val" id="val" type="text" placeholder="검색어를 입력해주세요">
                        <button type="submit">검색하기</button>
                </form>

                <table class="table">
                    <thead>
                        <tr>
                            <th>글 번호</th>
                            <th>글 제목</th>
                            <th>글쓴이</th>
                            <th>작성시간</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${board}" var="b" >
                            <tr>
                                <td>${b.boardId}</td>
                                <td><a href="boardDetail.do?boardId=${b.boardId}" style="color: black; text-decoration: none;">${b.boardTitle}</a><span
                                        style="color:red;">[${b.boardReply}]</span></td>
                                <td>${b.memberId}</td>
                                <td>${b.boardDate}</td>
                                <td>${b.boardCnt}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5"><a href="boardForm.do">글쓰기</a></td>
                        </tr>
                        
                    </tfoot>
                </table>
                <div class="center" align="center">
                    <div class="pagination">
                        <c:if test="${page.prev}">
                            <a href="boardList.do?page=${ page.startPage-1 }">prev</a>
                        </c:if>
                        <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
                            <c:choose>
                                <c:when test="${i == page.curPage}">
                                    <a href="boardList.do?page=${i}" class="active">
                                        <c:out value="${i}"></c:out>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="boardList.do?page=${i}">
                                        <c:out value="${i}"></c:out>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${page.next}">
                            <a href="boardList.do?page=${ page.endPage + 1 }">next</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<script type="text/javascript">
    $('form[name="frm"]').on('submit',boardSearch);

    function boardSearch(e){
        e.preventDefault();
        let key = $('#key').val();
        let val = $('#val').val();

        if(val == null || val == ''){
            alert("검색어를 입력해주세요")
        }else{
            $.ajax({
                url:"boardSearch.do?key=" + key +"&val=" + val,
                method:"POST",
                // dataType:JSON,
                headers:{
                    'Content-type' : 'application/x-www-form-urlencoded'
                },
                success:function(result){
                    $('tbody').children().remove();
                    JSON.parse(result).forEach(item =>{
                        console.log(item.boardId);
                        let str = `
                            <tr>
                                <td>\${item.boardId}</td>
                                <td><a href="boardDetail.do?boardId=\${item.boardId}" style="color: black; text-decoration: none;">\${item.boardTitle}</a><span
                                        style="color:red;">[\${item.boardReply}]</span></td>
                                <td>\${item.memberId}</td>
                                <td>\${item.boardDate}</td>
                                <td>\${item.boardCnt}</td>
                            </tr>
                        `;

                        $('tbody').append(str);
                        
                    })
                    
                },
                error:function(err){
                    alert("검색실패");
                    console.log(err);
                }
            })
        }
    }
    
</script>