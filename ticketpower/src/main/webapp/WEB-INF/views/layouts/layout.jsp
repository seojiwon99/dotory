<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<!-- 헤더 -->
		<tiles:insertAttribute name="header"/>
		<hr>
		<!-- body -->
		<tiles:insertAttribute name="body"/>
		<hr>
		<!-- 푸터 -->
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>