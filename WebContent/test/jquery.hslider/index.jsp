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
				<article>
					<h1>제목1</h1>
					<h2>내용1</h2>
					<h3>2015.10.1</h3>
				</article>
				<img src="pic/1.jpg" >
			</section>
			<section>
				<article class="left">
					<form>
						<input type="text" placeholder="폼테스트"/>
					</form>
					<h1>제목2</h1>
					<h2>내용2</h2>
					<h3>2015.10.1</h3>
				</article>
				<img src="pic/2.jpg" >
			</section>
			<section>
				<article>
					<h1>Digital Crystal</h1>
					<h2>751艺术区</h2>
					<h3>2015.10.1</h3>
				</article>
				<img src="pic/3.jpg" >
			</section>
			<section>
				<article class="left">
					<h1>제목3</h1>
					<h2>내용3</h2>
					<h3>2015.10.2</h3>
				</article>
				<img src="pic/4.jpg" >
			</section>
			<section>
				<article>
					<h1>제목4</h1>
					<h2>내용4</h2>
					<h3>2015.10.2</h3>
				</article>
				<img src="pic/5.jpg" >
			</section>
			<section>
				<article>
					<h1>제목5</h1>
					<h2>내용5</h2>
					<h3>2015.10.2</h3>
				</article>
				<img src="pic/6.jpg" >
			</section>
			<section>
				<article class="left">
					<h1>제목6</h1>
					<h2>내용6</h2>
					<h3>2015.10.2</h3>
				</article>
				<img src="pic/7.jpg" >
			</section>
			<section>
				<article>
					<h1>제목7</h1>
					<h2>내용7</h2>
					<h3>2015.10.2</h3>
				</article>
				<img src="pic/8.jpg" >
			</section>
			<section>
				<article>
					<h1>제목8</h1>
					<h2>내용8</h2>
					<h3>2015.10.3</h3>
				</article>
				<img src="pic/9.jpg" >
			</section>
			<section>
				<article >
					<h1>제목9</h1>
					<h2>내용9</h2>
					<h3>2015.10.3</h3>
				</article>
				<img src="pic/10.jpg" >
			</section>
			<section>
				<article >
					<h1>제목10</h1>
					<h2>내용10</h2>
					<h3>2015.10.4</h3>
				</article>
				<img src="pic/11.jpg" >
			</section>
			<section>
				<article >
					<h1>제목11</h1>
					<h2>내용12</h2>
					<h3>2015.10.5</h3>
				</article>
				<img src="pic/12.jpg" >
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
