<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.js"></script>

<script type="text/javascript">
$(function() {
	$('#btn').click(function() {

	var dbTxt = $('#src').val();
	dbTxt = dbTxt.replace(/(?:\r\n|\n)/g, '<br />');
	alert(dbTxt);
	dbTxt = dbTxt
	$('#test').html(dbTxt);

	});
	});
</script>
<title>Insert title here</title>
</head>
<body>
<button id="btn">버튼</button>
<textarea type="textarea" id="src" rows="10" cols="10"></textarea>


  <div id="test" rows="10" cols="10"> test</div>

</body>
</html>