<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    String c = "qzas";
    String d = "qwer";
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>연습문제</title>
    <script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
    <script type="text/JavaScript">
    
        function self_introduction($name, $email) {
            jQuery('#name_text').val($name);
            jQuery('#email_text').val($email);
        }
    </script>
</head>
<body>
    <input type = "hidden" id = "nic_name" value = "111" />
    <input type = "hidden" id = "nic_email" value = "222" />

    <input type = "text" id = "name_text" value = ""/>
    <input type = "text" id = "email_text" value = ""/>

    <input type = "button" onClick = "self_introduction(nic_name.value, nic_email.value)" value = "Click" />
</body>
</html>

