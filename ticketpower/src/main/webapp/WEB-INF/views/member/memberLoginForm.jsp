<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
	<div align = "center" >
		<div><h1>로 그 인</h1></div>
		<div>
			<form id="frm" action="memberLogin.do" method="post">
				<div>
					<table border ="1">
						<tr>
							<th width="150"> 아 이 디</th>
							<td width="200">
								<input type="text" id="memberId" name="memberId">
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="password" id="memberPw" name="memberPw">
							</td>
						</tr>
					</table>
					<input type="submit" value="로그인" />
					<button>취소</button>
				</div><br>
			</form>
		</div>
	</div>
</body>
</html>