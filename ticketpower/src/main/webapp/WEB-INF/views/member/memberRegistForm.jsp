<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
<div align="center">
	<form action="Regist" name="memberRegi" method="post">
		<table style="text-align:left" width="400px">
			<tr>
				<td>아이디 : </td><td><input type="text" name="memberId" id="memberId"></td>
			</tr>
			<tr>
				<td>비밀번호: </td><td><input type="password" name="memberPw" id="pw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인: </td><td><input type="password" name="pwcheck" id="pwcheck"></td>
			</tr>
			<tr>
				<td>이름 : </td><td><input type="text" name="memberName" id="memberName"></td>
			</tr>
		</table>
	</form>
</div>
<script type="text/javascript">

</script>
</body>
</html>