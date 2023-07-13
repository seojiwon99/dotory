<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>

    <body>
        <h3>adminMovieadd</h3>
        <form action="adminMovieAddControl.do">
            <table align="center">
                <!-- <tr>
                    <th>영화ID</th>
                    <td><input type="text" id="mvname" name="mvname"></td>
                </tr> -->
                <tr>
                    <th>영화제목</th>
                    <td><input type="text" id="name" name="name"></td>
                </tr>
                <tr>
                    <th>등급</th>
                    <td><input type="text" id="age" name="age"></td>
                </tr>
                <tr>
                    <th>장르</th>
                    <td><input type="text" id="genre" name="genre"></td>
                </tr>
                <tr>
                    <th>상영시간</th>
                    <td><input type="text" id="runtime" name="runtime"></td>
                </tr>
                <tr>
                    <th>줄거리</th>
                    <td><input type="text" id="summary" name="summary"></td>
                </tr>
                <tr>
                    <th>포스터이미지</th>
                    <td><input type="file" id="posterimg" name="posterimg"></td>
                </tr>
                <tr>
                    <th>배경이미지</th>
                    <td><input type="file" id="backimg" name="backimg"></td>
                </tr>
                <tr>
                    <th>개봉날짜</th>
                    <td><input type="date" id="release" name="release"></td>
                </tr>
            </table>
            <div align="center">
                <input type="submit" name="addbtn" id="addbtn" value="등록">
                <input type="reset" name="reset" id="reset" value="초기화">
                <input type="submit" name="cancle" id="cancle" value="취소" onclick='return submit2(this.form);'>
            </div>
        </form>
    </body>
    <script>
        function submit2(frm) {
            frm.action = "adminMoviePage.do"
            frm.submit();
            return true;
        }
    </script>

    </html>