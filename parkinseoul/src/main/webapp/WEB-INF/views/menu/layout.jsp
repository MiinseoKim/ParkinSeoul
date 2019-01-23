<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- title 영역 -->
    <title><tiles:insertAttribute name="title" /></title>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet"> 
    <link href="css/lightbox.css" rel="stylesheet"> 
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    
    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
    
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/lightbox.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
    <!-- kakao -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- naver -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!--   sweetalet -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <!-- table -->
  <link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"  rel="stylesheet">
<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon_16.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/favicon_144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/favicon_114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/favicon_72.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/favicon_57.png">
</head><!--/head-->
<body>
    <!-- Header  영역 -->
    <tiles:insertAttribute name="header" />
    <!-- Main 영역 -->
    <div id="main">
      <!-- Content 영역 -->
      <tiles:insertAttribute name="content" />
    </div>
    <!-- Footer 영역  -->
    <tiles:insertAttribute name="footer" />
</body>
</html>