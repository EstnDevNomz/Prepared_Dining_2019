<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var number = [0,1,2,3,4,5];

function add(acc, value) {

return acc + value;

}

var sum = number.reduce(add, 0);

var total = number.reduce(function(a, b) {return a + b;});
alert(number);

</script>
</body>
</html>