<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.js"></script>

<title>Insert title here</title>
</head>
<body>
<div>
   <input type="text" id="cdn">
</div>
<div>
   <input type="text" id="recdn"readonly="readonly">
</div>

<script type="text/javascript">
//하나 입력 시 실시간으로 입력되게 한다.
/* $('#reg_mb_name').keydown(function(){
    $('#mb_nick').val($('#reg_mb_name').val());
}); */
//마지막에 입력 시 입력되게 한다.
$('#cdn').change(function(){
    $('#recdn').val($('#cdn').val());
});
</script>

</body>
</html>