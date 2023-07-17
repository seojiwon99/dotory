<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
 <link href="css/login.css" rel="stylesheet" />
</head>
<body>
	<div align = "center" >
		<div name = "login"><h1>로 그 인</h1></div>
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
					<button type="submit" id="loginBtn" >로그인</button>
					<button type="button" onclick="location.href='main.do' ">취소</button>
				</div><br>
			</form>
		</div>
	</div>
<script type="text/javascript">
document.getElementById("loginBtn").addEventListener("click",function(e){
	if(document.getElementById("memberId").value == ""){
		e.preventDefault();
		alert("ID를 확인해주세요");
		document.getElementById("memberId").focus();
	}
	else if(document.getElementById("memberPw").value == ""){
		e.preventDefault();
		alert("PW를 확인해주세요");
		document.getElementById("memberPw").focus();
	}
	else{
		
	}
});
</script>
</body>
</html>