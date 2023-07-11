<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="css/user.css" />
<h2>회원 상세정보</h2>
<table class="table">
  <tr>
    <th>아이디</th>
    <td>
      <input
        id="memberId"
        name="memberId"
        value="${search.memberId}"
        readonly
      />
    </td>
  </tr>
  <tr>
    <th>이름</th>
    <td>
      <input
        id="memberName"
        name="memberName"
        value="${search.memberName}"
      />
    </td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td>
      <input
        id="memberTel"
        name="memberTel"
        value="${search.memberTel}"
      />
    </td>
  </tr>
  <tr>
    <th>주소</th>
    <td>
      <input
        id="memberAddr"
        name="memberAddr"
        value="${search.memberAddr}"
      />
    </td>
  </tr>
  <tr>
    <th>가입날짜</th>
    <td>
      <input
        id="memberEdate"
        name="memberEdate"
        value="${search.memberEdate}"
        readonly
      />
    </td>
  </tr>

  <tr>
    <th>대표이미지</th>
    <td>
      <img class="image" width="190px" src="images/${member.memberImg }" />
      <input type="file" id="image" style="display= none;" />
    </td>
  </tr>

  <tr>
    <td colspan="2" align="center">
      <button id="saveBtn">저장하기</button>
    </td>
  </tr>
  <th>
    <a href="userMain.do"> 목록으로 돌아가기 </a>
  </th>
</table>

<script>
  //change 이벤트
  document.getElementById("image").addEventListener("change", function (e) {
    console.log(e.target.files[0]);
    // multipart/form-data
    let formData = new FormData(); // <form></form>
    formData.append("id", document.querySelector("td.id").innerText);
    formData.append("image", e.target.files[0]);

    let xhtp = new XMLHttpRequest();
    xhtp.open("post", "imageUpload.do");
    xhtp.send(formData);
    xhtp.onload = function () {
      let result = JSON.parse(xhtp.responseText);
      if (result.retCode == "Success") {
        document.querySelector("img.image").src = "images/" + result.path;
      } else if (result.retCode == "Fail") {
        alert("처리중 문제가 발생했습니다 흑흑");
      } else {
        alert("뭔가 문제가 있는듯 한디옹");
      }
    };
  });

  //img 태그에 클릭 이벤트 발생했을때
  document.querySelector("img.image").addEventListener("click", function (e) {
    document.getElementById("image").click();
  });
  document.querySelector("#saveBtn").addEventListener("click", function (e) {
    let id = document.querySelector("td.id").innerText;
    let nm = document.querySelector("input.name").value;
    let ph = document.querySelector("input.tel").value;
    let ad = document.querySelector("input.addr").value;
    console.log(id, name, tel, author);

    let xhtp = new XMLHttpRequest();
    //xhtp.open('get', 'memberModify.do?uid='+id+'&upw='+pw+'&unm='+nm+'&uph='+ph+'&uad='+ad);
    //xhtp.send();
    xhtp.open("post", "userModify.do");
    xhtp.setRequestHeader(
      "Content-Type",
      "application/x-www-form-urlencoded; charset=utf-8"
    );
    xhtp.send(
      "memberId=" +
        id +
        "&memberName=" +
        name +
        "&memberTel=" +
        tel +
        "&memberAddr=" +
        addr
    );
    xhtp.onload = function () {
      console.log(xhtp.responseText);
      let result = JSON.parse(xhtp.responseText);
      if (result.retCode == "Success") {
        alert("저장성공.");
      } else if (result.retCode == "Fail") {
        alert("저장에 실패했습니다 흑흑");
      } else {
        alert("알 수 없는 코드입니다.");
      }
    };
  });

  //버튼이벤트
/*   $("#btn").on("click", function () {
    $("#memberTel").attr("readonly", false);
    $(this).remove();
    $(".test").append(
      '<td colspan="2" align="center"><button id="saveBtn">저장하기</button></td>'
    );
  }); */
</script>
