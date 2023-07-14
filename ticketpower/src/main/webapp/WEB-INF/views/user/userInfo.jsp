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
        readonly
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
        readonly
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
        readonly
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
      <img class="image" width="190px" src="images/${search.memberImg }" />
    </td>
  </tr>

  <tr>
    <td colspan="2" align="center">
      <a href="userPick.do">내가 찜한 영화 목록</a>
    </td>
  </tr>

  <tr>
    <td colspan="2" align="center">
      <a href="userGood.do">내가 좋아요한 게시글 목록</a>
    </td>
  </tr>

  <tr>
    <td colspan="2" align="center">
      <a
        href="userModifyForm.do?memberId=${search.memberId }&memberName=${search.memberName }&memberTel=${search.memberTel}&memberAddr=${search.memberAddr}&memberEdate=${search.memberEdate}&memberImage=${search.memberImg}"
        >정보 수정하기
      </a>
    </td>
  </tr>
  <th>
    <a href="userMain.do"> 메인으로 돌아가기 </a>
  </th>
</table>

<script></script>
