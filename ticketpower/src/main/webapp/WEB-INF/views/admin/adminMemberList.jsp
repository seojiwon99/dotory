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
					margin-top: 0px;
				}

				.input-group-text {
					background-color: lightgray;
				}
				.table{
					width: 600px;
					margin: 0 auto;
					height: 700px;
					margin-top:30px;
				}
				.table>thead {
			     padding: 0.5rem 0.5rem;
			    color: var(--bs-table-color-state,var(--bs-table-color-type,var(--bs-table-color)));
			    background-color: gray;
			    border-bottom-width: var(--bs-border-width);
			    box-shadow: inset 0 0 0 9999px var(--bs-table-bg-state,var(--bs-table-bg-type,var(--bs-table-accent-bg))); 
				}
				 
				{
					width:570px;
					margin: 0 auto;
					border-top:30px;
				}
				.title{
					background-color:gray;
				}
				tr {
					text-align: center;
				}
			</style>
		</head>
		  <div>
		  	<div>
		  	</div>
			<form >
				<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="key" id="key">
					<option selected>검색키워드</option>
					<option value="name">이름</option>
					<option value="tel">전화번호</option>
					<option value="addr">주소</option>
					<option value="all">전체</option>
				</select>
				<div class="input-group flex-nowrap">
					<input type="text" id="val" name="val" class="form-control" aria-describedby="addon-wrapping" Placeholder="값을 입력하세요">
					<button type="button" id="search" onclick="memberSearch()" class="btn btn-secondary">검색</button>
				</div>
			</form>
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
		</div>



		<div  align="center">
			<div class="pg_wrap">
				<c:if test="${page.prev}">
					<a href="adminMemberPage.do?page=${ page.startPage-1 }" class="btn btn-primary" role="button">prev</a>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
					<c:choose>
						<c:when test="${i == page.curPage}">
							<a href="adminMemberPage.do?page=${i}"  class="btn btn-primary" role="button">
								<c:out value="${i}"></c:out>
							</a>
						</c:when>
						<c:otherwise>
							<a href="adminMemberPage.do?page=${i}" class="btn btn-primary" role="button">
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