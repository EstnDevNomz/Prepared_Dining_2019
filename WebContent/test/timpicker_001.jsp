<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
      <script type="text/javascript" src="http://www.macosxsupport.com/jquery.zoomooz.min.js"></script>
 
<title>Insert title here</title>
</head>
<body>
<div class="container" style="width: 1200px; height: 800px;align-self:center; padding:4%; margin-top: 5%">

	<c:forEach var="i" begin="0" end="39" varStatus="status"	>

			<span style="padding: 0.3%; text-align: center;">
				<a 
					style="line-height: 50px;position:relative; padding: 1% 2%; font-size: 150%;
					color:white; background-color: #bec3c7; border-radius: 5px;">10:45
				</a>
			</span>		
	</c:forEach><br/>

	<c:forEach var="i" begin="0" end="39" varStatus="status"	>

			<a style="line-height: 50px;position:relative;margin:0.3%; padding:1% 1.1%;
				color:white; background-color: #bec3c7; border-radius: 5px;">
					<span style="font-size: 150%; padding: 3%; text-align: center;"> 10:45	</span>	
			</a>
			
	</c:forEach>


</div>

</body>
</html>