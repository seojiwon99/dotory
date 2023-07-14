<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">


<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard 3</title>

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <link rel="stylesheet" href="css/font.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <link rel="stylesheet" href="css/admin.css">
  <script src="js/jquery-3.7.0.min.js"></script>
  <script src="https://kit.fontawesome.com/257f34c49d.js" crossorigin="anonymous"></script>
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
<tiles:insertAttribute name="header" />
 <tiles:insertAttribute name="aside" />
 

  <div class="content-wrapper">
   	<tiles:insertAttribute name="body" />
  </div>

<tiles:insertAttribute name="footer" />
 </div>
</body>
</html>



