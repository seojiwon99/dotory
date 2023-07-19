<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>
	<tiles:getAsString name="title"/>
</title>
<script src="https://kit.fontawesome.com/257f34c49d.js" crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: 100;
    font-style: 100;
}
*{
	font-family: 'GangwonEdu_OTFBoldA';
}
</style>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>

        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dotory</title>
		 <!-- CSS Files -->
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/font-awesome.min.css" rel="stylesheet">
		<script src="js/jquery-3.7.0.min.js"></script>
        <!-- Colors -->
        <link href="css/css-index.css" rel="stylesheet" media="screen"> 
</head>
 <body data-spy="scroll" data-target="#navbar-scroll">
		<c:if test="${!empty id}">
		
    	  <!-- 헤더 -->
	      <tiles:insertAttribute name="header" /> 
		</c:if>

      <!-- body -->
      <tiles:insertAttribute name="body" />

      <!-- 푸터 -->
      <tiles:insertAttribute name="footer" />
 
  </body>
</html>


