<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table class="table">
	<h2> 회원 상세정보 </h2>
	<tr>
		<th>아이디</th><td class="id">${member.memberId }</td>
	</tr>
	<tr>
		<th>이름</th><td><input type="text" class="name" value="${member.memberName }"></td>
	</tr>
	<tr>
		<th>연락처</th><td><input type="text" class="tel" value="${member.memberTel }"></td>
	</tr>
	<tr>
		<th>권한</th><td><input type="text" class="author" value="${member.memberAuthor }"></td>
	</tr>
	<tr>
		<th>대표이미지</th>
		<td>
		<img class="image" width = "190px" src="images/${member.memberImg }">
		<input type="file" id="image" style="display= none;">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button id="saveBtn">저장하기</button>
		</td>
	</tr>
</table>

<script>
	//change 이벤트
	document.getElementById('image').addEventListener('change', function (e) {
		console.log(e.target.files[0]);
		// multipart/form-data
		let formData = new FormData(); // <form></form>
		formData.append('id', document.querySelector('td.id').innerText);
		formData.append('image', e.target.files[0]);
		
		let xhtp = new XMLHttpRequest();
		xhtp.open('post', 'imageUpload.do');
		xhtp.send(formData);
		xhtp.onload = function () {
			let result = JSON.parse(xhtp.responseText);
			if(result.retCode == 'Success'){
				document.querySelector('img.image').src = 'images/' + result.path;
			} else if(result.retCode == 'Fail'){
				alert('처리중 문제가 발생했습니다 흑흑');
			} else {
				alert('뭔가 문제가 있는듯 한디옹');
			}
		}
	})

	//img 태그에 클릭 이벤트 발생했을때
	document.querySelector('img.image').addEventListener('click',function (e) {
		document.getElementById('image').click();
	})
	document.querySelector('#saveBtn').addEventListener('click',function (e) {
		let id = document.querySelector('td.uid').innerText;
		let pw = document.querySelector('input.passwd').value;
		let nm = document.querySelector('input.name').value;
		let ph = document.querySelector('input.phone').value;
		let ad = document.querySelector('input.addr').value;
		console.log(id, pw, nm, ph, ad)
		
		let xhtp = new XMLHttpRequest();
		//xhtp.open('get', 'memberModify.do?uid='+id+'&upw='+pw+'&unm='+nm+'&uph='+ph+'&uad='+ad);
		//xhtp.send(); 
		xhtp.open('post', 'memberModify.do');
		xhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=utf-8')
		xhtp.send('uid='+id+'&upw='+pw+'&unm='+nm+'&uph='+ph+'&uad='+ad);
		xhtp.onload = function () {
			console.log(xhtp.responseText);
			let result = JSON.parse(xhtp.responseText);
			if(result.retCode == 'Success'){
				alert("저장성공.")
			} else if (result.retCode == 'Fail'){
				alert("저장에 실패했습니다 흑흑")
			} else {
				alert("알 수 없는 코드입니다.")
			}
		}
		
	})
</script>