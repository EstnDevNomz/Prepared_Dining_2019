<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="style/style_font.css" type="text/css" media="screen" />

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="script/jquery.zoomooz.js"></script>
<script type="text/javascript" src="script/popup.js"></script>

<style type="text/css">
.basket {
	left:65%;
	top:350px;
	
	position:absolute;	
	font-size: 30px;
	color: gray;
	font-weight: bolder;
	text-align: center;
	border-radius: 20%;
	border-top:120px solid;
	border-left:50px solid;
	border-right:50px solid;
	border-color:gray transparent green transparent;
	height:0;
	width:120px;
	margin:0;
	padding:0;
	display:block;
	border-bottom-style:none;
}
ef
.basket::before {  
	display: block;
    content: '';
    position: absolute;
    top: 80%;
    right: 50%;
    width: 10px;
    height: 10px;
    margin-top: -105px;
    border-radius: 100px;
    background: #8000ff;

}
</style>
<title>Insert title here</title>
</head>
<body>

	<div id="basket" class="basket">Basket</div>	
</body>
</html>