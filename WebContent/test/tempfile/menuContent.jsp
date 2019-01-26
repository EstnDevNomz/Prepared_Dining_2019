<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
String menuImg = request.getParameter("menuImg");
String menuName = request.getParameter("menuName");
String content = request.getParameter("content");
String price = request.getParameter("price");
log(menuImg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script type="text/javascript" src="script.js"></script>
<title>Insert title here</title>
</head>
<body>
<form id="aaa" name="aaa">
<div class="row">
	<div class="" id="" tabindex="-1">
		<div class="">
			<div class="">				
				<div class="row"> 
					<div class="col-sm-12">
					<div class="col-xs-7 menu"> 
						<img id="" src="../img/<%=menuImg %>" style="width: 100%; height: 100%"> 
					</div>
					<div id="menuContent" class="row"><br/>
						<span>Menu name : <%=menuName %></span><hr/>
						<span>Content : <%=content %></span><hr/>
						<p id="price">Price : <%=price %></p><hr/>
						<a class="btn btn-default">Reservation</a>
						<a class="btn btn-default">Delivery</a>&nbsp;&nbsp;
						<input type="image" src="../img/basket.png" style="position:absolute; width:35px ;height:30px; ">
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>