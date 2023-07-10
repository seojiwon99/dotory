<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<table class="table" border="1">
<thead>
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.memberId}</td>
			<td>${list.memberName}</td>
			<td>${list.memberTel}</td>
		</tr>
	</c:forEach>
</tbody>
</table>