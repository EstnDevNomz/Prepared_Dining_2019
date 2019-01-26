<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 	request.setCharacterEncoding("UTF-8");  %>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="googlebot" content="noindex, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1">

 <!-- 			Outside Link			 -->
 <link href="https://fonts.googleapis.com/css?family=Bungee+Hairline" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Gruppo" rel="stylesheet"> 
	<script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<script type="text/javascript" src="http://www.macosxsupport.com/jquery.zoomooz.min.js"></script>
 <!-- 			Inside Link			 	-->
	<link rel="stylesheet" href="../style/join_style.css" type="text/css"	media="screen" />
	<link rel="stylesheet" href="../style/style_shape.css" type="text/css"	media="screen" />
	<link rel="stylesheet" href="../style/style_font.css" type="text/css"	media="screen" />
	<link rel="stylesheet"  href="../style/payment_style.css" type="text/css"	media="screen"></link>
	<script type="text/javascript" src="../script/menuWrite.js"></script>



<title>Menu</title>
</head>
<body>
<%
	if(session.getAttribute("ValidMem") == null){
%>
		<script type="text/javascript">
			var popUrl = "../member/loginForm.jsp";
			var popOption = "top=150, left=650, width=440, height=360, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no;";
			window.open(popUrl, "", popOption);
		</script>
<%
	}else{
%>

	<form action="write.do" name="box" method="post">	
		<div id="menuWrite" style="margin: 5%;">
		
				<div class="write_font joinTitle">
					<label style="padding-bottom: 1%;font-size: 40px;"> Add List </label><br/>
				</div> <hr/>
					
				<div class="write_font">
					<label style="padding-bottom: 1%;"> Image View </label><br/>
					<span>
						<input 
							type="file" 
							name="menuImg" src=""
							size = "20%" 
							class="writeImg"
							style="font-size: 15px;">
					</span>	
					<span>
						<input 
							type="button" 
							name="button" 
							value="Insert" 
							class="btn btn-sm"	
							style="margin-left: 84%" onclick="change();" >
					</span> <br/><br/>
					
					<img name="img" src="" width="360px">
						<hr/>
				</div>
				
				<div class="write_font">			
					<label style="padding-bottom: 1%;"> Menu name </label><br/>					 
					<input type="text" name="menuName" size = "35%"><hr/>
				</div>
				
				<div class="write_font">			
					<label style="padding-bottom: 1%;"> Content </label><br/>					
					<textarea name="content" cols="35%" rows="5"></textarea>
					<hr/>
				</div>
				
				<div class="write_font">		
					<label style="padding-bottom: 1%;"> Price </label><br/>	
					<input type="text" name="price" size = "35%">
				</div> <br /><br />
								
				<div >
					<input 
						style="margin-left: 88%;" 
						class="btn btn-sm" 
						type="button"
						onclick="javascript:checkProductWrite()"
						value="Done">
				</div>
		</div>
	</form>

<%
	}
%>
</body>
</html>