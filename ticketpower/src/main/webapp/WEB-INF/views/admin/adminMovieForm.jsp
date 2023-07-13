<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>

    <body>
        <form action="adminMovieModify.do" style="margin-top: 50px">
            <table class="table" border="1" align="center">

                <tr>
                    <th>이미지</th>
                </tr>
                <c:if test="${search.movieId < 188814}">
                    <tr>
                        <td> 
                            <img src="https://image.tmdb.org/t/p/w500/${search.moviePosterImg}" style="width:80px">
                            <input type="file" name="file" accept="image/*" id="bizFile" style="display: none;">
                            <span id="fileName">${search.moviePosterImg}</span>
                            <label for="bizFile" class="btn fileBtn">파일선택</label>
                        </td>
                    </tr> 
                </c:if>
                <c:if test="${search.movieId > 188813}">
                   <td><img src="images/${search.moviePosterImg}" style="width:80px"/><input type="file" id="memberImg" name="memberImg" value="${search.moviePosterImg}"></td>
                </c:if>
                <tr>
                    <th>아이디</th>
                </tr>
                <tr>
                    <td><input type="text" id="memberId" name="memberId" value="${search.movieId}"></td>
                </tr>
                <tr>
                    <th>제목</th>
                </tr>
                <tr>
                    <td><input type="text" id="memberName" name="memberName" value="${search.movieName}"></td>
                </tr>
                <tr>
                    <th>등급</th>
                </tr>
                <tr>
                    <td><input type="text" id="memberAge" name="memberAge" value="${search.movieAge}"></td>
                </tr>
                <tr>
                    <th>장르</th>
                </tr>
                <tr>
                    <td><input type="text" id="memberGenre" name="memberGenre" value="${search.movieGenre}"></td>
                </tr>
                <tr>
                    <th>상영시간</th>
                </tr>
                <tr>
                    <td><input type="text" id="memberRuntime" name="memberRuntime" value="${search.movieRuntime}"></td>
                </tr>
                <tr>
                    <th>좋아요</th>
                </tr>
                <tr>
                    <td><input type="text" id="memberLike" name="memberLike" value="${search.movieLike}"></td>
                </tr>
                <tr>
                    <th>줄거리</th>
                </tr>
                <tr>
                    <td><input type="text" id="memberSummary" name="memberSummary" value="${search.movieSummary}"></td>
                </tr>
                <tr>
                    <th>배경이미지</th>
                </tr>
                <c:if test="${search.movieId < 188814}">
                    <tr>
                        <td> 
                            <img src="https://image.tmdb.org/t/p/w500/${search.movieBackImg}" style="width:80px">
                            <input type="file" name="file" accept="image/*" id="bizFile" style="display: none;">
                            <span id="fileName">${search.movieBackImg}</span>
                            <label for="bizFile" class="btn fileBtn">파일선택</label>
                        </td>
                    </tr> 
                </c:if>
                <c:if test="${search.movieId > 188813}">
                   <td><img src="images/${search.moviePosterImg}" style="width:80px"/><input type="file" id="memberImg" name="memberImg" value="${search.moviePosterImg}"></td>
                </c:if>
            </table>
                <div align="center">
                    <input type="submit" id="modify" name="modify" value="수정">
                    <input type="reset" id="reset" name="reset" value="초기화">
                    <input type="submit" id="modify" name="modify" value="뒤로가기" onclick='return submit2(this.form);'>
                </div>
        </form>
    </body>
    </html>
    <script>
        function submit2(frm){
            frm.action="adminMoviePage.do"
            frm.submit();
            return true;
        }

        document.getElementById('bizFile').addEventListener('change', function(){
            var filename = document.getElementById('fileName');
            if(this.files[0] == undefined){
                filename.innerText = '선택된 파일없음';
                return;
            }
            filename.innerText = this.files[0].name;
        });
    </script>