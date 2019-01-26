<%@page import="com.jsp.pj1.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("UTF-8");
    %> 
<jsp:useBean id="dto" class="com.jsp.pj1.dto.Dto" scope="page"/>
<jsp:setProperty name="dto" property="*"/>

<%
	String email = (String)session.getAttribute("email");	//email 불러옴
	dto.setCustomerEmail(email);
	
	Dao dao = Dao.getInstance();
	int ri = dao.updateCustomer(dto);
	
	if(ri == 1){
%>
	<script language="javascript">
		alert("completed updating User information");
		
		opener.parent.location.reload();
		self.close();
	</script>
<%		
	}else{
%>
	<script language="javascript">
		alert("Fail updating");
		history.go(-1);
	</script>
<%	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>