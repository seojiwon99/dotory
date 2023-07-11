<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100" style="background-color:white;">
        <div class="row gx-4 gx-lg-5 align-items-center justify-content-center text-center">
            <div class="content" style="padding: 50px;">
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
                        <c:forEach items="${board}" var="b">
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
