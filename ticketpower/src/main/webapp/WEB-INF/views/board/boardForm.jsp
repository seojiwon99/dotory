<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="masthead">
    <div class="container px-4 px-lg-5 h-100" style="background-color:white;">
        <div class="row gx-4 gx-lg-5 align-items-center justify-content-center text-center">
            <div class="content" style="padding: 50px;">
                <h2>글쓰기</h2>
                <form name="myFrm" action="boardAdd.do">
                    <table class="table">
                        <tr>
                            <th>글 제목</th>
                            <td><input type="text" name="brdtitle" id="brdtitle"></td>
                            <th>회원 정보</th>
                            <td><input type="text" name="memberid" value="${id}" id="memberid" readonly></td>
                        </tr>
                        <tr>
                            <th>글 내용</th>
                            <td colspan="3"><textarea cols="80" rows="20" name="brdcontent" id="brdcontent"
                                    placeholder="글 내용을 입력해주세요"></textarea></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <input type="submit" value="등록" id="addBtn">
                                <input type="button" value="취소" id="cancleBtn">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</header>
<script type="text/javascript">
	$('#cancleBtn').on('click',function(){
		location.href = "boardList.do";
	})
	
    $('form[name="myFrm"]').on('submit',submitForm);
    
    function submitForm(e){
        e.preventDefault();

        let id = $('#memberid').val();
        let title = $('#brdtitle').val();
        let content = $('#brdcontent').val();

        if(title == null || title == ''){
            alert("제목을 입력해주세요.");
            return false;
        }else if(content == null || content == ''){
            alert("내용을 입력해주세요.");
        }else{
            $.ajax({
                url:$('form[name="myFrm"]').attr('action'),
                method: "POST",
                data: $('form[name="myFrm"]').serialize(),
                success:function(result){
                    console.log(result);
                    if(result == 0){
                        alert("등록실패");
                    }else if(result == 1){
                        alert("등록성공");
                        location.href = "boardList.do";
                    }
                },
                error:function(err){
                    console.log(err);
                    alert("에러발생");
                }

            })
        }
    }    
     


</script>