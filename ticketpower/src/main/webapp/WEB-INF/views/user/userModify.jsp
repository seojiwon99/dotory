<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="css/user.css" />
<div class="container">
<h2>회원정보 수정</h2>
<form action="userModify.do">
  <table class="table" border="1" align="center">
    <tr>
      <th>아이디</th>
      <td colspan="3">
        <input
          id="memberId"
          class="memberId"
          name="memberId"
          value="${search.memberId}"
          readonly
        />
      </td>
    </tr>
    <tr>
      <th>이름</th>
      <td colspan="3">
        <input id="memberName" name="memberName" value="${search.memberName}" />
      </td>
    </tr>
    <tr>
      <th>전화번호</th>
      <td colspan="3">
        <input id="memberTel" name="memberTel" value="${search.memberTel}" />
      </td>
    </tr>
    <tr>
      <th>주소</th>
      <td colspan="3">
        <input id="memberAddr" name="memberAddr" value="${search.memberAddr}" />
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
      <th>대표이미지</th>
      <td class="id">
        <img class="image" width="190px" src="images/${search.memberImg }" />
        <input type="file" id="image" style="display= none;" />
      </td>
    </tr>

    <tr>
      <td colspan="4" align="center">
        <button type="button" id="saveBtn">저장하기</button>
      </td>
    </tr>
    <tr>
    	<td colspan="4" align="center">
      		<a href="userInfo.do"> 마이페이지로 돌아가기 </a>
    	</td>
    </tr>
  </table>
</form>
</div>
<script>
  //change 이벤트
  document.getElementById("image").addEventListener("change", function (e) {
    console.log(e.target.files[0]);
    // multipart/form-data
    let formData = new FormData(); // <form></form>
    formData.append("id", document.querySelector("input.memberId").value);
    formData.append("image", e.target.files[0]);

    $.ajax({
      type: "POST", //POST GET
      url: "imageUpload.do",
      data: formData,
      enctype: "multipart/form-data",
      processData: false, //프로세스 데이터 설정 : false 값을 해야 form data로 인식합니다
      contentType: false, //헤더의 Content-Type을 설정 : false 값을 해야 form data로 인식합니다
      success: function (e) {
        console.log(e);
        if (e != 0) {
          alert("이미지 등록에 성공했습니다");
          $("img.image").attr("src", "images/"+e);
        } else if (e == 0) {
          alert("이미지 등록에 실패했습니다ㅜㅜ");
        }
      },
      error: function (err) {
        alert("뭔가 문제가 있는듯 한디옹");
      },
    });

    /*     let xhtp = new XMLHttpRequest();
    xhtp.open("post", "imageUpload.do");
    xhtp.send(formData);
    console.log(formData)
    xhtp.onload = function () {
      let result = JSON.parse(xhtp.responseText);
      if (result.retCode == "Success") {
        document.querySelector("img.image").src = "images/" + result.path;
      } else if (result.retCode == "Fail") {
        alert("처리중 문제가 발생했습니다 흑흑");
      } else {
        alert("뭔가 문제가 있는듯 한디옹");
      }
    }; */
  });
  //img 태그에 클릭 이벤트 발생했을때
  document.querySelector("img.image").addEventListener("click", function (e) {
    document.getElementById("image").click();
  });
  //저장하기 이벤트
  document.querySelector("#saveBtn").addEventListener("click", function (e) {
    let id = document.querySelector("input#memberId").value;
    let nm = document.querySelector("input#memberName").value;
    let tel = document.querySelector("input#memberTel").value;
    let addr = document.querySelector("input#memberAddr").value;

    $.ajax({
      type: "POST", //POST GET
      url: "userModify.do",
      data: {
        memberId: id,
        memberName: nm,
        memberTel: tel,
        memberAddr: addr,
      },
      success: function (res) {
        if (res == 1) {
          alert("수정에 성공했습니다");
          location.href = "userInfo.do"; //userinfo.do로 이동
        } else if (res == 0) {
          alert("수정에 실패했습니다");
        }
      },
      error: function (err) {
        alert("뭔가 문제가 있는듯 한디옹");
      },
    });

    // let xhtp = new XMLHttpRequest();
    // //xhtp.open('get', 'memberModify.do?uid='+id+'&upw='+pw+'&unm='+nm+'&uph='+ph+'&uad='+ad);
    // //xhtp.send();
    // xhtp.open("post", "userModify.do");
    // xhtp.setRequestHeader(
    //   "Content-Type",
    //   "application/x-www-form-urlencoded; charset=utf-8"
    // );
    // xhtp.send(
    //   "memberId=" +
    //     id +
    //     "&memberName=" +
    //     name +
    //     "&memberTel=" +
    //     tel +
    //     "&memberAddr=" +
    //     addr
    // );
    // xhtp.onload = function () {
    //   /* let result = JSON.parse(xhtp.responseText); */
    //   console.log(xhtp.responseText);
    //   /* if (result.retCode == "Success") {
    //     } else if (result.retCode == "Fail") {
    //       alert("처리중 문제가 발생했습니다 흑흑");
    //     } else {
    //       alert("뭔가 문제가 있는듯 한디옹");
    //     } */
    // };

    // xhtp.onload = function () {
    //   console.log(xhtp.responseText);
    //   let result = JSON.parse(xhtp.responseText);
    //   if (result.retCode == "Success") {
    //     alert("저장성공.");
    //   } else if (result.retCode == "Fail") {
    //     alert("저장에 실패했습니다 흑흑");
    //   } else {
    //     alert("알 수 없는 코드입니다.");
    //   }
    // };
  });

  function submit2(frm) {
    frm.action = "UserModify.do";
    frm.submit();
    return true;
  }
</script>

<!--   버튼이벤트
   $("#btn").on("click", function () {
    $("#memberTel").attr("readonly", false);
    $(this).remove();
    $(".test").append(
      '<td colspan="2" align="center"><button id="saveBtn">저장하기</button></td>'
    );
  }); 
 -->
