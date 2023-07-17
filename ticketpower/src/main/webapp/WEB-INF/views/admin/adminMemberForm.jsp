<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>

		<style>
			.btn-outline-secondary {
				--bs-btn-color: #0d6efd;
				--bs-btn-border-color: #0d6efd;

			}

			th:first-child {
				text-align: right;
				/* Align the text to the right */
				margin-right: 20px;
				/* Add right margin for additional space */
				width: 50px;
			}
			form{
				margin: 0 auto;
				width:700px;
			}
			.input-group-text{
				width:100px;
			}
			input[type='text']{
				text-align: center;
			}
		</style>
		<form action="adminMemberModify.do" style="margin-top: 50px;">

			<table class="table" border="2" align="center">

				<tr>
					<th><span class="input-group-text" id="inputGroup-sizing-default">아이디</span></th>
					<td><input type="text" class="form-control" id="memberId" name="memberId" readonly value="${search.memberId}"></td>
				</tr>
				<tr>
					<th><span class="input-group-text" id="inputGroup-sizing-default">이름</span></th>
					<td><input type="text" class="form-control" id="memberName" name="memberName" value="${search.memberName}"></td>
				</tr>
				<tr>
					<th><span class="input-group-text" id="inputGroup-sizing-default">전화번호</span></th>
					<td><input type="text" class="form-control" id="memberTel" name="memberTel" value="${search.memberTel}"></td>
				</tr>
				<tr>
					<th><span class="input-group-text" id="inputGroup-sizing-default">주소</span></th>
					<td><input type="text" class="form-control" id="memberAddr" name="memberAddr" value="${search.memberAddr}"></td>
				</tr>
				<tr>
					<th><span class="input-group-text" id="inputGroup-sizing-default">가입날짜</span></th>

					<td><input type="text" class="form-control" id="memberEdate" name="memberEdate" readonly value="${search.memberEdate}">
					</td>
				</tr>
				<tr>
					<th><span class="input-group-text" id="inputGroup-sizing-default">대표이미지</span></th>
					<td>
						<img width="190px" src="images/${search.memberImg}.jpg">
					</td>
				</tr>


			</table>
			<div align="center">
				<input type="submit" class="btn btn-secondary" id="modify" name="modify" value="수정">
				<input type="submit" class="btn btn-secondary" id="delete" name="delete" value="삭제"
					onclick='return submit2(this.form);'>
			</div>
		</form>
		<script>
			function submit2(frm) {
				frm.action = "adminMemberDelete.do"
				frm.submit();
				return true;
			}

		</script>