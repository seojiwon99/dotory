<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="masthead" style="margin-top: 90px;margin-bottom:300px">
    <div class="container px-4 px-lg-5 h-100" style="background-color:white; width: 40%; border: 1px solid; padding: 5px; border-radius:5px;">
                <h2>글쓰기</h2>
                <form name="myFrm" action="boardAdd.do">
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">글 제목</label>
                        <input type="text" class="form-control"  name="brdtitle" id="brdtitle" placeholder="제목을 입력해주세요">
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlInput1" class="form-label">작성자</label>
                        <input type="text" class="form-control" name="memberid" value="${id}" id="memberid" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">내용</label>
                        <textarea class="form-control" rows="3"  name="brdcontent" id="brdcontent"
                        placeholder="글 내용을 입력해주세요"></textarea>
                    </div>
                    <div class="mb-3" style="text-align: center;">
                        <input type="submit" value="등록" id="addBtn">
                        <input type="button" value="취소" id="cancleBtn">
                    </div>
                </form>
    </div>
</header>
<script type="text/javascript">
    $('#cancleBtn').on('click', function () {
        location.href = "boardList.do";
    })

    $('form[name="myFrm"]').on('submit', submitForm);

    function submitForm(e) {
        e.preventDefault();

        let id = $('#memberid').val();
        let title = $('#brdtitle').val();
        let content = $('#brdcontent').val();

        if (title == null || title == '') {
            alert("제목을 입력해주세요.");
            return false;
        } else if (content == null || content == '') {
            alert("내용을 입력해주세요.");
        } else {
            $.ajax({
                url: $('form[name="myFrm"]').attr('action'),
                method: "POST",
                data: $('form[name="myFrm"]').serialize(),
                success: function (result) {
                    console.log(result);
                    if (result == 0) {
                        alert("등록실패");
                    } else if (result == 1) {
                        alert("등록성공");
                        location.href = "boardList.do";
                    }
                },
                error: function (err) {
                    console.log(err);
                    alert("에러발생");
                }

            })
        }
    }
</script>