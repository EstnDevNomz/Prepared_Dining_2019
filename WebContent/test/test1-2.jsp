<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form name="box" method="get">

	<input type="file" name="menuImg" readonly="readonly" >
	<input type="button" name="button" value="Insert" onclick="change();">
	<img name="img" src="">

</form>

<script>
function change() {
	filename = document.box.menuImg.value;
	var filename=filename.substr(filename.lastIndexOf("damdak"));	//파일이름 자르기
	alert(filename);
	document.box.img.src = "../img/" + filename;	//파일이름 이미지 src에 넣기
}
</script>

</body>
</html>