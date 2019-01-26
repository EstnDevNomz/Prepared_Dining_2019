<%@page import="com.jsp.pj1.dto.RDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jsp.pj1.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//preparences administer account
	String email = (String) session.getAttribute("email");
	log("email : " + email);
	String admin = "exorsa1525@gmail.com";
	
	Dao dao = Dao.getInstance();	
	ArrayList<RDto> dto = dao.clientbookList(email);
	request.setAttribute("cblist", dto);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="../style/payment_style.css" type="text/css"	media="screen" />
<link href="https://fonts.googleapis.com/css?family=Bungee+Hairline" rel="stylesheet"> 
<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid" >
		<div class="row">
			<div class="payTitlebox col-lg-12">
				<div>
					<label class="payTitle" style="color: red;">Payment is complete</label>			
				</div>
				<div>
					<label class="paymidTitle">${firstName} ${lastName}'s payment has been processed normally.</label>
				</div>
			</div>
			
			<div class="payhistory col-lg-12"><label>Descriptions</label></div>
			<div class="payContent">
				<div class="payLabel" >Table number</div>
				<div class="payvalue">${cblist[0].t_index }</div>	
			</div>

			<div class="payContent">
				<div class="payLabel" >product</div>
				<div class="payProduct payvalue">${cblist[0].menuname }</div>	
			</div>				
			<div class="payContent">
				<div class="payLabel" >Order total</div>
				<div class="paySum payvalue">${cblist[0].withdraw }</div>	
			</div>	
			<div class="payContent">
				<div class="payLabel" >Order date</div>
				<div class="payvalue">${cblist[0].b_seq }</div>	
			</div>
		</div>
		<div class="col-xs-10" ></div>
		<!-- reload parent window & self close method if click this button -->
		<div class="col-xs-2" >
			<button type="button" class="confirmButton btn btn-light"
					onclick="opener.parent.location.reload();self.close()">Confirm</button>
		</div>

	</div>
</body>
</html>