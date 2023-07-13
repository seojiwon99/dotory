<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>

    <body>
        <h3>adminMovieadd</h3>
        <form action="adminMovieAddControl.do" name="myFrm" enctype="multipart/form-data" method="post">
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
                    <td><textarea id="runtime" name="runtime" cols="50"></textarea></td>
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
    <script type="text/javascript">
        function submit2(frm) {
            frm.action = "adminMoviePage.do"
            frm.submit();
            return true;
        }
        // $('form[name="myFrm"]').on('submit',submitForm);

        // function submitForm(e){
        //     e.preventDefault();

        //     let name = $('#name').val();
        //     let age = $('#age').val();
        //     let genre = $('#genre').val();
        //     let runtime = $('#runtime').val();
        //     let summary = $('#summary').val();
        //     let posterimg = $('#posterimg').val();
        //     let backimg = $('#backimg').val();
        //     let release = $('#release').val();

        //     if(name ==null || name=='' || age ==null || age=='' 
        //     || genre ==null || genre=='' || runtime ==null || runtime==''
        //     || summary ==null || summary=='' || release ==null || release==''){
        //         alert("값을 입력해주세요");
        //         return false;
        //     }else {
        //         $.ajax({
        //             url:$('form[name="myFrm"]').attr('action'),
        //             method: "POST",
        //             data: $('form[name="myFrm"]').serialize(),
        //             success: function(result){
        //                 console.log(result);
        //                 if(result == 0){
        //                     alert("등록실패");
        //                 }else if(result == 1){
        //                     alert("등록성공");
        //                     location.href = "adminMoviePage.do";
        //                 }
        //             },
        //             error:function(err){
        //                 console.log(err);
        //                 alert("에러발생");
        //             }
        //         })
        //     }
        // }
    </script>

    </html>