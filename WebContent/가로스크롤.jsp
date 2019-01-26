<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>HSlider | Demo</title>
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0" />
	<link rel="stylesheet" type="text/css" href="style/reset.css">
	<link rel="stylesheet" type="text/css" href="style/hsilder.css">
	<link rel="stylesheet" type="text/css" href="style/default-style.css">
	<script type="text/javascript" src="jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="jquery.HSlider.min.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="slider">
			<section>

				
			</section>
			<section>
					<form>
						<input type="text" placeholder="폼테스트"/>
					</form>

				
			</section>
			
		</div>
	</div>

	<script type="text/javascript">
		$(".slider").HSlider({
			easing: 'ease',
			animationTime: '400',
			pagination: true
		});
	</script>
</body>
</html>
