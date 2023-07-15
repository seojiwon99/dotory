<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<head>
			<style>
				.center a {
					color: black;
				}

				.tbody a {
					color: white;
				}

				a:hover {
					color: blue;
				}

				.content-wrapper {
					margin-top: 50px;
				}

				.input-group-text {
					background-color: lightgray;
				}

				th {
					background-color: gray;
				}

				tr {
					text-align: center;
				}
			</style>
		</head>

		<table class="table">
			<thead>
				<tr>
					<th scope="col" class="title">아이디</th>
					<th scope="col" class="title">이름</th>
					<th scope="col" class="title">연락처</th>
					<th scope="col" class="title">주소</th>
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
		</table>

		<div>
			<form>
				<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="key" id="key">
					<option selected>검색키워드</option>
					<option value="name">이름</option>
					<option value="tel">전화번호</option>
					<option value="addr">주소</option>
					<option value="all">전체</option>
				</select>
				<div class="input-group flex-nowrap">
					<span class="input-group-text" id="addon-wrapping">검색</span>
					<input type="text" class="form-control" aria-describedby="addon-wrapping">
				</div>
			</form>
		</div>

		<div class="center" align="center">
			<div>
				<c:if test="${page.prev}">
					<a href="adminMemberPage.do?page=${ page.startPage-1 }">prev</a>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
					<c:choose>
						<c:when test="${i == page.curPage}">
							<a href="adminMemberPage.do?page=${i}" class="active">
								<c:out value="${i}"></c:out>
							</a>
						</c:when>
						<c:otherwise>
							<a href="adminMemberPage.do?page=${i}">
								<c:out value="${i}"></c:out>
							</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.next}">
					<a href="adminMemberPage.do?page=${ page.endPage + 1 }">next</a>
				</c:if>
			</div>
		</div>

		<script type="text/javascript">
			function memberSearch() {
				let key = document.getElementById("key").value;
				let val = document.getElementById("val").value;
				let payload = "key=" + key + "&val=" + val;
				let url = "ajaxMemberSearchList.do";
				fetch(url, {
					method: "POST",
					headers: {
						"Content-type": "application/x-www-form-urlencoded"
					},
					body: payload
				}).then(response => response.json())
					.then(json => viewHtml(json));
			}

			function viewHtml(datas) {
				document.querySelector('tbody').remove();
				const tbody = document.createElement('tbody');
				tbody.innerHTML = datas.map(data => htmlConvert(data)).join('');
				document.querySelector('table').appendChild(tbody);
			}


			function htmlConvert(data) {
				console.log(data);
				let str = '<tr>';
				str += '<td align="center"><a href="adminMemberForm.do?uid=' + data.memberId + '">' + data.memberId + '</a></td>';
				str += '<td align="center">' + data.memberName + '</td>';
				str += '<td align="center">' + data.memberTel + '</td>';
				str += '<td align="center">' + data.memberAddr + '</td>';
				str += '</tr>';
				return str;

			}
		</script>