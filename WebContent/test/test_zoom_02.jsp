<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="../script/jquery.zoomooz.js"></script> 

<style type="text/css">
.a {
	width:600px;
	height:600px;	
	position:absolute;	
	font-size: 30px;
	color: gray;
	font-weight: bolder;
	text-align: center;
	border: 5px solid gray;
	top: 100px;
	left:400px;
	
}
.b {
	width:100px;
	height:100px;	
	position:absolute;	
	font-size: 30px;
	color: gray;
	font-weight: bolder;
	text-align: center;
	border: 5px solid gray;	
	top: 10px;
	left: 10px;
}

.c {
	width:100px;
	height:100px;	
	position:absolute;	
	font-size: 30px;
	color: gray;
	font-weight: bolder;
	text-align: center;
	border: 5px solid gray;
	top:10px;
	left:150px;
}
.d {
	width:100px;
	height:100px;	
	position:absolute;	
	font-size: 30px;
	color: gray;
	font-weight: bolder;
	text-align: center;
	border: 5px solid gray;	
	top: 10px;
	left: 300px;
}

.e {
	width:10px;
	height:10px;	
	position:absolute;	
	font-size: 2px;
	color: gray;
	text-align: center;
	border: 2px solid gray;
	top:500px;
	left:450px;
}

.p{
	position:absolute;	
	top: 720px;
	left:500px;
	width:40px;
	height:40px;
	color: gray;
	text-align: center;
	border: 3px solid gray;

}
.n{
	position:absolute;	
	top: 720px;
	left:550px;
	width:40px;
	height:40px;
	color: gray;	
	text-align: center;
	border: 3px solid gray;	
}
</style>

<title>Insert title here</title>
</head>
<body>

	<div class="a zoomViewport demo">
	    <div class="zoomContainer">

<!-- 위에서부터 아애로 순차적으로 개체 사이를 이동한다 -->
	        <div class="d zoomTarget">Target 2</div>
	        <div class="e zoomTarget">Target 4</div>
	        <div class="c zoomTarget">Target 3</div>
	        <div class="b zoomTarget">Target 1</div>
	    </div>
	</div>
	
	<div class="p zoomButton" data-type="prev" data-root=".demo">prev</div>
	<div class="n zoomButton" data-type="next" data-root=".demo">next</div>

</body>
</html>