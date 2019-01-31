<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 	<!-- 			Outside Link			 -->
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	
	<link href="https://fonts.googleapis.com/css?family=Delius+Unicase" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Bungee+Hairline" rel="stylesheet">

<style type="text/css">

.typingFooter {
  font-size:5vw;
  color:#F4F3F2;
  white-space: nowrap;
  overflow: hidden;
  border-right: .0em solid black;
  -webkit-animation: typing 2s steps(36, end), blink-caret 1s step-end ;
  -webkit-animation-delay: 1s;
  -webkit-animation-fill-mode: both;
  -moz-animation-delay: 3s;
}

.subject {
	position:absolute;
	background-color: #fff;
	font-size: 5vw;
	border: none;
	font-weight: bolder;
	left: 34%;
	top: 40%;
	transition-duration: 1s;
}
.subject:hover {
	color:transparent;
	text-shadow: 0 0 .01em #e5e0dc, 0 0 .3em white;
}
</style>

<title>Insert title here</title>

</head>
<body>

<label id="" class="subject" onclick="goHome()">OPEN DINING</label>

</body>
<script type="text/javascript">
	function goHome(){
		document.location.href = "index.do";
	}
	
</script>
</html>