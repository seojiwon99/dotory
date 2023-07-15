<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
        </head>

        <body>
        <div align="center">
			<div>
				<form>
					<select name="key" id="key" class="form-select form-select-sm" aria-label=".form-select-sm example">
						<option value="id">영화ID</option>
						<option value="name">영화제목</option>
						<option value="all">전체</option>
					</select>
					<input type="text" id="val" name="val" class="form-control" aria-describedby="addon-wrapping" Placeholder="값을 입력하세요">
					<button type="button" id="search" onclick="movieSearch()">검색</button>
				</form>
			</div>
		</div>
            <form action="adminMovieAdd.do">               
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
            <script type="text/javascript">
                
                let check = [];
                $(document).ready(function () {
                    $('#delete').click(function () {
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
                function movieSearch(){
                let key = document.getElementById("key").value;
                let val = document.getElementById("val").value;
                let payload = "key="+key+"&val="+val;
                let url="ajaxMovieSearchList.do";
                fetch(url,{
                    method: "POST",
                    headers:{
                        "Content-type": "application/x-www-form-urlencoded"
                    },
                    body:payload
                }).then(response => response.json())
                .then(json => viewHtml(json));
            }
            
            function viewHtml(datas){
                document.querySelector('tbody').remove();
                const tbody= document.createElement('tbody');
                tbody.innerHTML = datas.map(data => htmlConvert(data)).join('');
                document.querySelector('table').appendChild(tbody);
            }
            
            
            function htmlConvert(data){
                let url="https://image.tmdb.org/t/p/w500/+"
                console.log(data);
                let str = '<tr>';                                                           
                str+= '<td align="center"><input type="checkbox" id="'+ data.movieId +'" name="check"></td>';
                str+= '<td align="center"><a href="adminMovieForm.do?movieid='+ data.movieId + '">'+ data.movieId + '</a></td>';
             	if(data.movieId < 188814){
                     str += '<td align="center"><img src="https://image.tmdb.org/t/p/w500/'+ data.moviePosterImg +'"style="width:80px"></td>';

                }else if(data.movieId > 188813){
                    str += '<td align="center"><img src="images/'+ data.moviePosterImg +'"style="width:80px"></td>';

                }
        
                str+= '<td align="center">'+ data.movieName + '</td>';
                str+= '<td align="center">'+ data.movieAge + '</td>';
                str+= '<td align="center">'+ data.movieGenre + '</td>';
                str +=	'</tr>';
                return str;
        
            }
		

            </script>
        </body>

        </html>