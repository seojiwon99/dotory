<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://tiles.apache.org/tags-tiles"
prefix="tiles"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  	<link rel="stylesheet" href="css/netflix.css" />
  </head>
  <body>
    	<div class="container">
      <!-- 헤더 -->
      <tiles:insertAttribute name="header" />
      <!-- body -->
      <tiles:insertAttribute name="body" />
      <!-- 푸터 -->
      <tiles:insertAttribute name="footer" />
      </div>
  </body>
</html>
