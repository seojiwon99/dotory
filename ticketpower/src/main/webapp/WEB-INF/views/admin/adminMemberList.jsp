<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div align="center">
	<div><h1>회원목록</h1></div>
	<div>
		<form action="" id="frm" method="post">
			<label>검색할 키 선택</label>
			<select name="key" id="key">
				<option value="name">이름</option>
				<option value="tes">전화번호</option>
				<option value="addr">주소</option>
				<option value="all">전체</option>
			</select>
			<input type="text" id="val" name="val">
			<button type="button" onclick="memberSearch()">검색</button>
		</form>
	</div>
</div>
<table class="table" border="1">
<thead>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
		<th>주소</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="list" items="${list}">
		<tr>
			<td><a href="adminMemberForm.do?uid=${list.memberId}">${list.memberId}</a></td>
			<td>${list.memberName}</td>
			<td>${list.memberTel}</td>
			<td>${list.memberAddr}</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<script type="text/javascript">
	function memberSearch(){
		let key = document.getElementById("key").value;
		let val = document.getElementById("val").value;
		let payload = "key="+key+"&val="+val;
		let url="ajaxMemberSearchList.do"
		fetch(url,{
			method: "POST",
			headers:{
				"Content-type": "application/x-www-form-urlencoded"
			},
			body:payload
		}).then(response => response.json())
		.then(json => viewHtml(json));
	}
	
	function viewHtml(datas){
		document.querySelector('tbody').remove();
		const tbody= document.createElement('tbody');
		tbody.innerHTML = datas.map(data => htmlConvert(data)).join('');
		document.querySelector('table').appendChild(tbody);
	}
	
	
	function htmlConvert(data){
		console.log(data);
		let str = '<tr>';
		str+= '<td align="center">'+ data.memberId + '</td>';
		str+= '<td align="center">'+ data.memberName + '</td>';
		str+= '<td align="center">'+ data.memberTel + '</td>';
		str+= '<td align="center">'+ data.memberAddr + '</td>';
		str +=	'</tr>';
		return str;
	}
</script>