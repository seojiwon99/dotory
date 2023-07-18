<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="css/admin.css">    
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style >
        	.table{
					width: 600px;
					margin: 0 auto;
					height: 700px;
					margin-top:30px;
				}
			
        </style>
    </head>

    <body>
        <form action="adminMovieAddControl.do" name="myFrm" enctype="multipart/form-data" method="post">
            <table align="center" border="1px" class="table">
                <!-- <tr>
                    <th>영화ID</th>
                    <td><input type="text" id="mvname" name="mvname"></td>
                </tr> -->
     
                <tr>
		                <th><span class="input-group-text" id="inputGroup-sizing-default">제목</span></th>
		                <td><input type="text" id="name" name="name"class="form-control"placeholder="제목을 입력하세요"></td>
                </tr>
              
                <tr>
                    <th><span class="input-group-text" id="inputGroup-sizing-default">등급</span></th>
                    <td><input type="text" id="age" name="age" class="form-control"placeholder="심의등급을 입력하세요"></td>
                </tr>
                <tr>
                    <th><span class="input-group-text" id="inputGroup-sizing-default">장르</span></th>
                    <td><input type="text" id="genre" name="genre" class="form-control"placeholder="장르를 입력하세요"></td>
                </tr>
                <tr>
                    <th><span class="input-group-text" id="inputGroup-sizing-default">상영시간</span></th>
                    <td><input type="text" id="runtime" name="runtime" class="form-control"placeholder="상영시간을 입력하세요"></input></td>
                </tr>
                <tr>
                    <th><span class="input-group-text" id="inputGroup-sizing-default">줄거리</span></th>
                    <td><textarea class="form-control" type="text" id="summary" name="summary" cols="50" placeholder="줄거리를 입력하세요"></textarea></td>
                </tr>
                <tr>
                    <th><span class="input-group-text" id="inputGroup-sizing-default">포스터이미지</span></th>
	                    <td>
		                    <input type="file" name="posterimg" id="posterimg"class="form-control" >
	  					</td>
                </tr>
                <tr>
                    <th><span class="input-group-text" id="inputGroup-sizing-default">배경이미지</span></th>
                    <td><input type="file" id="backimg" name="backimg" class="form-control"></td>
                </tr>
                <tr>
                    <th><span class="input-group-text" id="inputGroup-sizing-default">개봉날짜</span></th>
                    <td><input type="date" id="release" name="release"></td>
                </tr>
            </table>
            <div align="center">
                <input type="submit" name="addbtn" id="addbtn" value="등록" class="btn btn-secondary">
                <input type="reset" name="reset" id="reset" value="초기화" class="btn btn-secondary">
                <input type="submit" name="cancle" id="cancle" value="취소" onclick='return submit2(this.form);' class="btn btn-secondary">
            </div>
        </form>
    </body>
    <script type="text/javascript">
        function submit2(frm) {
            frm.action = "adminMoviePage.do"
            frm.submit();
            return true;
        }

    </script>

    </html>