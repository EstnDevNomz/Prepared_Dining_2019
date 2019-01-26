<%@page import="com.jsp.pj1.dao.Dao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="com.jsp.pj1.dto.Dto"/>
<jsp:setProperty name="dto" property="*"/>	<!-- 모든프로퍼티를 세팅하겠다 -->
<%
	dto.setRegJointime(new Timestamp(System.currentTimeMillis()));
	Dao dao = Dao.getInstance();		// 싱글톤 패턴의 특징 : 클래스로부터 객체를 getInstance()로 가져오는 것
	if(dao.confirmID(dto.getCustomerEmail()) == Dao.MEMBER_EXISTENT){
%>
		<script language="javascript" lang="UTF-8">
			alert("Existent ID.");
			history.back();	// go back joinForm.jsp
		</script>
		
<%
		}else{
				
			int ri = dao.insertCustomer(dto);
			
			if(ri == Dao.MEMBER_JOIN_SUCCESS){
				session.setAttribute("email", dto.getCustomerEmail());
	%>
				<script language="javascript">
					alert("Congratulation sign up.");
					document.location.href = "loginForm.jsp";
				</script>
<%		
		}else{
%>	
			<script language="javascript">
			alert("Failed sign up.");
			document.location.href = "loginForm.jsp";
			</script>
<%
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
</body>
</html>