<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100" style="background-color:white;">
        <div class="row gx-4 gx-lg-5 align-items-center justify-content-center text-center">
            <div class="content" style="padding: 50px;">
                <table class="table">
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
                    	<td>${board.boardDate}</td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <textarea cols="70" rows="30">${board.boardContent}</textarea>
                        </td>
                    </tr>
                    <tr>
                    	<td colspan="4">
                    		 <a href="boardList.do">목록으로</a>
                    	</td>
                    </tr>
                   
                </table>
            </div>
        </div>
    </div>
    
</header>
