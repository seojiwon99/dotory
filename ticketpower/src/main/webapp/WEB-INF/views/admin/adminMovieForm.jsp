<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="css/admin.css"> 
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <style>
                form {
                    margin: 0 auto;
                    width: 80%;
                }

                td,span,th {
                    text-align: center;
                }

                button {
                    color: #6c757d;
                    border-color: #6c757d;
                }

  
            </style>
        </head>

        <body>
            <form action="adminMovieModify.do" style="margin-top: 50px" enctype="multipart/form-data" method="post">
                <table class="table" border="1" align="center">

                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">이미지</span></th>
                    </tr>
                    <c:if test="${search.movieId < 81775}">
                        <tr>
                            <td>
                                <img src="https://image.tmdb.org/t/p/w500/${search.moviePosterImg}" style="width:80px">
                                <!-- <input type="file" id="movieImg" name="movieImg"> -->
                                <input type="file" class="form-control" name="movieposterimg" accept="image/*" id="movieposterimg">
                                
                                <!-- <label for="movieposterimg" class="btn fileBtn">파일선택</label> -->
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${search.movieId > 81774}">
                        <td>
                            <img src="images/${search.moviePosterImg}" style="width:80px" />
                            <!-- <input type="file" id="movieImg" name="movieImg"> -->
                            <input type="file" class="form-control" name="movieposterimg" accept="image/*" id="movieposterimg">
                            <!-- <label for="movieposterimg" class="btn fileBtn">파일선택</label>	 -->
                        </td>
                    </c:if>

                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">아이디</span></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="form-control" id="movieid" name="movieid" value="${search.movieId}"
                                style=" text-align: center;" readonly></td>
                    </tr>
                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">제목</span></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="form-control" id="moviename" name="moviename" value="${search.movieName}"
                                style=" text-align: center;"></td>
                    </tr>
                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">등급</span></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="form-control" id="movieage" name="movieage" value="${search.movieAge}"
                                style=" text-align: center"></td>
                    </tr>
                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">장르</span></th>
                    </tr>
                    <tr>
                        <td><input type="text" class="form-control" id="moviegenre" name="moviegenre" value="${search.movieGenre}" style="text-align: center;"></td>
                    </tr>
                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">상영시간</span></th>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" class="form-control" id="movieruntime" name="movieruntime" value="${search.movieRuntime}"
                                style=" text-align: center">
                        </td>
                    </tr>
                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">좋아요</span></th>
                    </tr>
                    <tr>
                        <td>${search.movieLike}</td>
                    </tr>
                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">줄거리</span></th>
                    </tr>
                    <tr>
                        <div class="form-floating">
                            <td>
                                <textarea id=" moviesummary" name="moviesummary" rows="10" cols="70"
                                    class="form-control" placeholder="Leave a comment here"
                                    id="floatingTextarea">${search.movieSummary}</textarea>
                            </td>
                        </div>
                    </tr>

                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">배경이미지</span></th>
                    </tr>
                    <c:if test="${search.movieId < 81774}">
                        <tr>
                            <td>
                                <img src="https://image.tmdb.org/t/p/w500/${search.movieBackImg}" style="width:80px">
                                <input type="file" name="moviebackimg" accept="image/*" id="moviebackimg"
                                    style="display: none;">
                                <span id="fileName">${search.movieBackImg}</span>
                                <label for="moviebackimg" class="btn fileBtn">파일선택</label>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${search.movieId > 81775}">
                        <td>
                            <img src="images/${search.movieBackImg}" style="width:80px" /><input type="file"
                                id="movienackImg" name="moviebackImg" value="${search.moviePosterImg}">
                            <input type="file" name="moviebackimg" accept="image/*" id="moviebackimg"
                                style="display: none;">
                            <span id="fileName">${search.movieBackImg}</span>
                            <label for="moviebackimg" class="btn fileBtn">파일선택</label>
                        </td>
                    </c:if>
                    <tr>
                        <th><span class="input-group-text" id="inputGroup-sizing-default">개봉날짜</span></th>
                    </tr>
                    <tr>
                        <td><input type="date" id="movierelease" name="movierelease" value="${search.movieRelease}">
                        </td>
                    </tr>
                </table>
                <div align="center">
                    <input type="submit" id="modify" name="modify" value="수정" class="btn btn-secondary">
                    <input type="reset" id="reset" name="reset" value="초기화" class="btn btn-secondary">
                    <input type="submit" id="back" name="back" value="뒤로가기" onclick='return submit2(this.form);' class="btn btn-secondary">
                </div>

            </form>
        </body>

        </html>
        <script>
            function submit2(frm) {
                frm.action = "adminMoviePage.do"
                frm.submit();
                return true;
            }


        </script>