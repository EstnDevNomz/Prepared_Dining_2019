<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="style/style_font.css">
<link rel="stylesheet" href="style/style_shape.css">
<link href="https://fonts.googleapis.com/css?family=Delius+Unicase" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Bungee+Hairline" rel="stylesheet">

<style type="text/css">
.bg{
background: #58a;
background: 
	linear-gradient(-45deg, transparent 65px, #655 0)
		right,
	linear-gradient(45deg, transparent 65px, #58a 0)
		left;
background-size: 50% 220%;
background-repeat: no-repeat;

}

.blur {
	transition: 1s;
}
.blur:hover {
	color:transparent;
	text-shadow: 0 0 .01em white, 0 0 .3em white;
}
.font_a{
	font-size: 160%;
	font-family: 'Bungee Hairline', cursive;
}

#insite {
	width:3%;
	height:1%;
	line-height: 1.5;
	padding: .3em .8em;
	border: 1px solid rgba(0,0,0,.1);
	background: #ADD7F4 linear-gradient(hsla(0,0%,100%,.2), 
				transparent);
	border-radius: .4em;
	box-shadow: 0 .05em .25em rgba(0,0,0,.5);
	color:white;
	text-shadow: 0 -.05em .05em rgba(0,0,0,.5);
	line-height: 1.5;	
	transition-duration: 0.3s;
	transition-timing-function: ease;
	font-size: 5%;
}
#insite:hover {
	background: #EA575B;
}

</style>

<title>Insert title here</title>

</head>
<body class="bg">
<form action="main.do">
<span><input id="insite" class="g_font site" type="submit" value="enter the Site"/></span>
</form>
<form action="">
<span><input id="insite" class="g_font ppt" type="submit" value="enter the PPT"/></span>
</form>

<div class="font_a"style="font-size: 280%"> AJAX APPLE spring SPRING javascript jsp zameika newyork NEWYORK</div>
<div class="font_a" style="font-weight: bolder;font-size: 180%"> hello HELLO world WORLD apple APPLE spring SPRING</div>
</body>
</html>