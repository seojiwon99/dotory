<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
        </head>

        <body>
            <form action="adminMovieAdd.do">
                <h3>adminmovielist</h3>
                <table class="table" border="5" align="center">
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>일련번호</th>
                            <th>사진</th>
                            <th>영화제목</th>
                            <th>시청나이</th>
                            <th>장르</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="mvlist" items="${mvlist}">
                            <tr>
                                <td><input type="checkbox" id="${mvlist.movieId}" name="check"></td>
                                <td>${mvlist.movieId}</td>
                                <td>
                                	<c:if test="${mvlist.movieId < 188814}">
	                                	<img src="https://image.tmdb.org/t/p/w500/${mvlist.moviePosterImg}" style="width:80px">
                                	</c:if>
                                	<c:if test="${mvlist.movieId > 188813}">
                                		<img src="images/${mvlist.moviePosterImg}" style="width:80px"/>
                                	</c:if>
                                </td>
                                <td><a href="adminMovieForm.do?movieid=${mvlist.movieId }">${mvlist.movieName}</a></td>
                                <td>${mvlist.movieAge}</td>
                                <td>${mvlist.movieGenre}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div align="center">
                    <input type="submit" id="add" name="add" value="등록">
                    <input type="button" id="delete" name="delete" value="삭제">
                </div>
            </form>
            <script>
                let check = [];
                $(document).ready(function () {
                    $('#delete').click(function () {
                        console.log($('input:checkbox[name=check]:checked').parent().parent());
                        $('input:checkbox[name=check]').each(function (index) {
                            if ($(this).is(":checked")) {
                                check.push($(this).attr("id"))
                            }
                        })
                        console.log(check);
                        $.ajax({
                            url: "adminMovieDelete.do",
                            method: "POST",
                            data:{
                                check: check
                               
                            },
                            traditional: true,
                            success:function(result){
                                alert("삭제성공");
                                $('input:checkbox[name=check]:checked').parent().parent().remove();
                            },
                            error: function(error){
                                alert("삭제실패");
                            }
                        });
                    })
                })



            </script>
        </body>

        </html>