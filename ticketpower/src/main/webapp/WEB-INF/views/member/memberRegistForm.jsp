<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align ="center">
	<div><h1>회원가입</h1></div>
	<div>
		<form id="frm" onsubmit="return formCheck()" method="post">
			<p>아이디는 4그
			<input type="text" id="memberId" name="memberId">
			<button type="button" id="btnChk" value="No" onclick="idCheck()">중복체크</button>
			<br>
			<input type="password" id="memberPw" name="memberPw" placeholder = "Password">
			<br>
			<input type="password" id="Pwcheck" name="Pwcheck" placeholder= "require Same Password">
			<br>
			<input type="text" id="memberName" name="memberName" placeholder="Name">
			<br>
			<input type="text" id="memberTel" name="memberTel" placeholder="Tel">
			<br>
			<input type="text" id="memberAddr" name="memberAddr" placeholder="Address">
			<br>
			<input type="submit" value="가입하기">
		</form>
	</div>
	<div id="message"></div>
</div>
<script type="text/javascript">
	function formCheck(){
		let chk = document.getElementById("btnChk").value;
		if(chk == 'No'){
			alert("아이디 중복체크를 해주세요")
			return false;
		}
		let frm = document.getElementById("frm");
		frm.action="memberRegist.do";
		frm.submit();
	}
	function idCheck(){ //ajax를 통한 아이디 중복 체크
		let id = document.getElementById("memberId").value;
		let url = "memberIdcheck.do?id="+id;
		fetch(url)
			.then(response => response.text())
			.then(text => viewHtml(text));
			
	}
	
	function viewHtml(data){
		if(data == 1){
			alert("이미 사용하는 아이디입니다.");
		}else{
			alert("사용가능한 아이디입니다.");
			document.getElementById("btnChk").value="Yes";
		}
	}
</script>
</body>
</html>