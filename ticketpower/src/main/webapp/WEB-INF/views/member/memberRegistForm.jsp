<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>회원가입 페이지</title>

    <link href="css/Regist.css" rel="stylesheet" />

</head>

<body>
    <div class="wrapper" align="center">
        <div class="title"><h1 style="font-size: 21px;">회원가입</h1></div>
        <form id="frm" method="post" name = "frm">
        <div class="id">
            <input id="memberId" name="memberId" type="text" placeholder="아이디를 입력해 주세요.(4글자이상)" oninput="putId()">
            <div id="idError" class="error"></div>
        </div>
        <div class="idCheck">
        	<button type="button" disabled id="idcheck"  onclick="idCheck()">중복체크</button>
        	<button type="button" disabled id="idDecide" value="No" onclick="setId()">사용하기</button>
        </div>
        <div class="name">
            <input id="memberName" name="memberName" type="text" placeholder="이름을 입력해 주세요.">
            <div id="nameError" class="error"></div>
        </div>
        <div class="password">
            <input id="memberPw" name="memberPw" type="password" placeholder="비밀번호를 입력해 주세요.">
            <div id="passwordError" class="error"></div>
        </div>
        <div class="passwordCheck">
            <input id="memberPw2" name="memberPw2" type="password" placeholder="비밀번호를 다시 입력해 주세요.">
            <div id="passwordCheckError" class="error"></div>
        </div>
        <div class="phone">
            <input id="memberTel" name="memberTel" type="text"  maxlength="11" oninput="changePhone1()">
		</div>
        <div class="auth">
            <div id="certificationNumber">000000</div>
            <button type="button" disabled id="sendMessage" onclick="getToken()">인증번호 전송</button>
        </div>

        <div class="timer">
            <div id="timeLimit">03:00</div>
            <button type="button" disabled id="completion" onclick="checkCompletion()">인증확인</button>
        </div>
        <div class="line">
            <hr>
        </div>
        <div class="signUp">
            <button type="submit" id="signUpButton" disabled onclick="signUpCheck()">가입하기</button>
        </div>
        </form>
    </div>
</body>
<script type="text/javascript">
//휴대폰 번호 입력 부분

function changePhone1(){
    const phone = document.getElementById("memberTel").value // 010
    if(phone.length === 11){
      document.getElementById("sendMessage").focus();
      document.getElementById("sendMessage").setAttribute("style","background-color:yellow;")
      document.getElementById("sendMessage").disabled = false;
    }
}

// 문자인증+타이머 부분
function initButton(){
  document.getElementById("sendMessage").disabled = true;
  document.getElementById("completion").disabled = true;
  document.getElementById("certificationNumber").innerHTML = "000000";
  document.getElementById("timeLimit").innerHTML = "03:00";
  document.getElementById("sendMessage").setAttribute("style","background-color:none;")
  document.getElementById("completion").setAttribute("style","background-color:none;")
}

function putId(){
	const mid = document.getElementById("memberId").value
		if(mid.length > 3){
			document.getElementById("idcheck").focus();
		    document.getElementById("idcheck").setAttribute("style","background-color:yellow;")
		    document.getElementById("idcheck").disabled = false;
	}
}
function idCheck(){
	let id = document.getElementById("memberId").value;
	let url = "memberIdcheck.do?id="+id;
	fetch(url)
		.then(response => response.text())
		.then(text => viewHtml(text));
}

function viewHtml(data){
	const idBtn = document.getElementById(setId);
	if(data == 1){
		alert("이미 사용하는 아이디입니다.")
	}else{
		alert("사용 가능한 아이디입니다.")
		document.getElementById("idDecide").disabled = false;
	}
}
function setId(){
	document.getElementById("memberId").readOnly = true;
	document.getElementById("idcheck").disabled = true;
	document.getElementById("idDecide").value = "Yes";
	alert("아이디가 확정되었습니다.")
}


let processID = -1;

const getToken = () => {

  // 인증확인 버튼 활성화
  document.getElementById("completion").setAttribute("style","background-color:yellow;")
  document.getElementById("completion").disabled = false;
  document.getElementById("memberTel").readOnly = true;

  if (processID != -1) clearInterval(processID);
  const token = String(Math.floor(Math.random() * 1000000)).padStart(6, "0");
  document.getElementById("certificationNumber").innerText = token;
  let time = 180;
  processID = setInterval(function () {
    if (time < 0 || document.getElementById("sendMessage").disabled) {
      clearInterval(processID);
      initButton();
      return;
    }
    let mm = String(Math.floor(time / 60)).padStart(2, "0");
    let ss = String(time % 60).padStart(2, "0");
    let result = mm + ":" + ss;
    document.getElementById("timeLimit").innerText = result;
    time--;
  }, 50);
};

function checkCompletion(){
  alert("문자 인증이 완료되었습니다.")
  initButton();
  document.getElementById("completion").innerHTML="인증완료"
  document.getElementById("signUpButton").disabled = false;
  document.getElementById("signUpButton").setAttribute("style","background-color:yellow;")
}


// 가입부분 체크

function signUpCheck(){

  let userId = document.getElementById("memberId").value
  let name = document.getElementById("memberName").value
  let password = document.getElementById("memberPw").value
  let passwordCheck = document.getElementById("memberPw2").value
  let check = true;

  // 이메일확인
  if(userId != null){
	let chk = document.getElementById("idDecide").value;
	if(chk === "No"){
      document.getElementById("idError").innerHTML="아이디 사용 확정이 되지 않았습니다."
      check = false
    }
    else{
      document.getElementById("idError").innerHTML=""
    }
  }else{
    document.getElementById("idError").innerHTML="아이디에는 공백이 올 수 없습니다."
    check = false
  }


  // 이름확인
  if(name===""){
    document.getElementById("nameError").innerHTML="이름이 올바르지 않습니다."
    check = false
  }else{
    document.getElementById("nameError").innerHTML=""
  }


  // 비밀번호 확인
  if(password !== passwordCheck){
    document.getElementById("passwordError").innerHTML=""
    document.getElementById("passwordCheckError").innerHTML="비밀번호가 동일하지 않습니다."
    check = false
  }else{
    document.getElementById("passwordError").innerHTML=""
    document.getElementById("passwordCheckError").innerHTML=""
  }

  if(password===""){
    document.getElementById("passwordError").innerHTML="비밀번호를 입력해주세요."
    check = false
  }else{
    //document.getElementById("passwordError").innerHTML=""
  }
  if(passwordCheck===""){
    document.getElementById("passwordCheckError").innerHTML="비밀번호를 다시 입력해주세요."
    check = false
  }else{
    //document.getElementById("passwordCheckError").innerHTML=""
  }

  
  if(check){
    document.getElementById("idError").innerHTML=""
    document.getElementById("nameError").innerHTML=""
    document.getElementById("passwordError").innerHTML=""
    document.getElementById("passwordCheckError").innerHTML=""
    //비동기 처리이벤트
    setTimeout(function() {
      alert("가입이 완료되었습니다.")
  },0);
    
	document.frm.action ="memberRegist.do";
	document.frm.submit();
  }
}
</script>

</html>