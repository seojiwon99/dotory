<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<form action="adminMemberModify.do">
<table class="table" border="1" align="center">

	<tr>
		<th>아이디</th>
		<td><input id="memberId" name ="memberId"value="${search.memberId}"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input id="memberName" name ="memberName"value="${search.memberName}"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input id="memberTel" name ="memberTel"value="${search.memberTel}"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input id="memberAddr" name ="memberAddr"value="${search.memberAddr}"></td>
	</tr>
	<tr>
		<th>가입날짜</th>
		<td><input id="memberEdate" name ="memberEdate"value="${search.memberEdate}"></td>
	</tr>
	<tr>
		<th>이미지</th>
		<td><input id="memberImg" name ="memberImg"value="${search.memberImg}"></td>
	</tr>
	
	
</table>
<div align="center">
	<input type="submit" id="modify" name="modify" value="수정">
	<input type="submit" id="delete" name="delete" value="삭제" onclick='return submit2(this.form);'>
</div>
</form>
<script>
function submit2(frm){
	frm.action="adminMemberDelete.do"
	frm.submit();
	return true;
}

</script>