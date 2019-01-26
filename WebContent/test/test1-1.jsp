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
<input type="button" value="change1" onclick="change1();">
<input type="text" name="name" size="11" value="이김">

<input type="button" onclick="change();" value="change">
<input type="file" name="file" value="val" readonly="readonly">
<img name="img" src="">

</form>

<script>
function change1(){
   document.box.name.value = '이현석';
}

function change() {
	filename = document.box.file.value;
	var filename=filename.substr(filename.lastIndexOf("/")+-13);
	alert(filename);
	document.box.img.src = "img/" + filename;
}
</script>

</body>
</html>