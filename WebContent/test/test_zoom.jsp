<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<script type="text/javascript" src="script/jquery.zoomooz.min.js"></script>
	
	<link rel="stylesheet" href="style/style_shape.css" type="text/css"	media="screen" />
	<link rel="stylesheet" href="style/style_font.css" type="text/css"	media="screen" />
	
	<style type="text/css">
	.a {
	width:1300px;
	height:700px;	
	position:absolute;	
	font-size: 30px;
	color: gray;
	font-weight: bolder;
	text-align: center;
	border: 5px solid gray;
	top: 100px;
	left:400px;
	
}
	</style>

<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	settings = {
		    targetsize: 0.3,
		    scalemode: "both",
		    duration: 1450,
		    easing: "ease",
		    nativeanimation: true,
		    root: $(document.body),
		    debug: false,
		    animationendcallback: null,
		    closeclick: false,
		    preservescroll: false
	}
		function mv(settings) {
			$("#delivery").zoomTo(settings);
		}
	</script>
	
	
	<div class="zoomViewport demo" style="position:absolute;	width: 100%; height: 100%">
	    <div class="zoomContainer" style="">

				<div id="reserve" class="zoomTarget level0 blur" data-duration="800" data-targetsize= 0.3>
				<span class="apptitle">Reserve</span></div>
				<div id="delivery" class="zoomTarget level0 blur"  data-duration="800" data-targetsize= 0.3>
				<span class="apptitle">Delivery</span></div>
			
		</div>	
	</div>		
					
	<div class="btn col-xs-2 zoomButton" style="position:absolute; border:2px solid blue; bottom:500px; left: 400px;;" data-type="next" data-root=".demo">next</div>
	<div class="btn col-xs-2 zoomButton" style="right:80px; width: 30px; height: 20px" onclick="mv()" >button</div>	
		
</body>
</html>	
	

