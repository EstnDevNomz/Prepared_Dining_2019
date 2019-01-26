<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	//preparences administer account
	String email = (String) session.getAttribute("email");
	log("email : " + email);
	String admin = "exorsa1525@gmail.com";
	String firstName = (String) session.getAttribute("firstName");
	String lastName = (String) session.getAttribute("lastName");
	String phone = (String)session.getAttribute("phone");
	
	// for Client Puchase List(plist is all list)
	Dao dao = Dao.getInstance();	
	ArrayList<RDto> dto = dao.clientbookList(email);
	request.setAttribute("cblist", dto);
	System.out.println("cblist : " + dto);

%>
	<%@page import="com.jsp.pj1.dto.RDto"%>
	<%@page import="java.util.ArrayList"%>
	<%@page import="com.jsp.pj1.dao.Dao"%>
	<%@page import="java.util.Locale"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
	
	<!--  Modal popup window 	-->	
	<%@ include file="menu/menuContent.jspf" %>
	<%@ include file="payment/paymentMainForm.jspf" %>

<!DOCTYPE html >
<html>
<head>

	<meta http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
	<meta name="robots" content="noindex, nofollow">
	<meta name="googlebot" content="noindex, nofollow">
 	<!-- 			Outside Link			 -->
	<script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.js"></script>
	<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<script type="text/javascript" src="http://www.macosxsupport.com/jquery.zoomooz.min.js"></script>
 	<!-- 			Inside Link			 	-->
	<link rel="stylesheet" href="style/style_shape.css" type="text/css"	media="screen" />
	<link rel="stylesheet" href="style/style_font.css" type="text/css"	media="screen" />
	<link rel="stylesheet"  href="style/payment_style.css" type="text/css"	media="screen"></link>
	<link rel="stylesheet"  href="style/reserve_style.css" type="text/css"	media="screen"></link>
	<script type="text/javascript" src="script/modal.js"></script>
	<script type="text/javascript" src="script/popup.js"></script>
	<script type="text/JavaScript" src="script/menuContent.js"></script>
	<script type="text/javascript" src="script/paymentInput.js"></script>
	<script type="text/javascript" src="script/paymentView.js"></script>
	<script type="text/javascript" src="script/ajax.js"></script>
		<!-- 				가로스크롤 						-->
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0" />
	<script type="text/javascript" src="jquery.HSlider.min.js"></script>
		<title>JSP AJAX</title>

</head>

<body onload="init();$('#inputpay').hide();$('#pay').hide();
			$('.table_1').hide();$('.table_2').hide();$('.table_3').hide();
			$('.table_4').hide();$('.table_5').hide();$('.table_6').hide();
			$('.table_7').hide();$('.table_8').hide();$('.table_9').hide();
			$('.table_10').hide();" style="background-color: #F6F5F4; height: 100%;">
			
<%
	//	고객 접속확인
	
	if(session.getAttribute("ValidMem") == null) {
%>
		<script type="text/javascript">
			var popUrl = "member/loginForm.jsp";
			var popOption = "top=150, left=650, width=440, height=360, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no";
			window.open(popUrl, "", popOption);
		</script>
<%
	}else{
		
	}
%>

	<div class="zoomViewport demo" style="height: 85%;">
	    <div class="zoomContainer" style="height: 85%;">
			<div class="container-fluid" style="height: 85%;">
				<div class="wrap">
					<div class="slider">
						<section>
							<!-- 	Descript sentence	-->
							<div class="raw description" 
							     style="position:absolute; left:40vw; height: 13vw;">
								<span class="col-xs-9"></span>
								<span class="col-xs-3">
									<%@ include file="header/printClock.jsp" %>
								</span>
							</div>	
						</section>	
						<section>
							<video id="video" poster="img/post_001.png" 
									class="video-js"
									width="350" height="260" 
									controls="controls" 
									style="display:block; position:absolute; border-radius: 20px;display: block;left: 78vw;top:-4vw;" 
									autoplay="autoplay">
								<source class="video" src="${filename }" type="video/mp4" />
							</video>
							<br/>
								
<%
	if(email == null ){
		
	} else if(!email.equals(admin)){
%>
							<div class="pList zoomTarget scroll scroll4" id="pList" data-duration="800">
										
										<!-- middle title -->
									<div class="col-xs-12 label label-default"
										style="font-family:monospace; text-align: center;
											padding: 1% 0% 0.3% 0%;border-bottom: 5px solid white">
										<label class="col-xs-2">Index</label>
										<label class="col-xs-2">Date</label>
										<label class="col-xs-1">time</label>
										<label class="col-xs-1">Table</label>
										<label class="col-xs-5">Ordered Menu</label>
										<label class="col-xs-1">Cancel</label>	
									</div>
									
										<!-- book list -->
									<c:forEach var="i" items="${cblist}" begin="0"	end="23" varStatus="st">
										<div class="col-xs-12" style="font-family:monospace; text-align: center;
												padding: 1% 0% 1% 0%;border-bottom: 5px solid white;overflow: auto;">
											<input type="hidden" class="bseq${st.index}" value="${i.b_seq }">
											<div class="col-xs-2">${i.b_seq }</div>
											<div class="col-xs-2">${i.reserved_wmy }</div>
											<div class="col-xs-1">${i.reserved_Time }</div>
											<div class="col-xs-1">${i.t_index }</div>
											<div class="col-xs-5">${i.menuname }</div>
											<div class="col-xs-1">
												<div class="col-xs-1">
													<a class="glyphicon glyphicon-minus-sign" 
														style="text-decoration: none;"
														onclick="bseq(${st.index});cancel();">
													</a>
												</div>
											</div>
										</div>
									</c:forEach>
								<!-- get bseq index when click cancel button -->
								<input type="hidden" class="bseq" value=""/>
							</div>	
												
						  <!--				location information			 -->
							
						  <div id="locationinformation" class="typing"> 
							<!-- get Distance method -->
							<script type="text/javascript" src="script/calcDistance.js"></script>
						      My location:<br/> 
						      <a id="home" data-toggle="modal" data-target="#myModal">
						      	<span id="startLat"></span>°, <span id="startLon"></span>°
						      </a>
						 	<br/><br/>
		
						      Store location:<br/> 
						      <a id="cl" href="javascript:mapPopupOpen()">
						      	<span id="currentLat"></span>°, <span id="currentLon"></span>°
						      </a>
						    <br/><br/>
						   	
						     Distance:<br/> 
						     <label class="distance" style="background-color:#F6F5F4;color:#FACCA8;font-size:5vw; border: none; font-weight:bolder;" >distance</label>
						      <input type="hidden" id="distance" name="distance"
								      readonly="readonly">
							<input type="hidden" id="a" value=""><input type="hidden" id="b" value="">
						  </div> 
<%		
	}else{
		
	}
%>						</section>
					</div>
				</div>
			<!-- Users account -->
	<%
		if (session.getAttribute("ValidMem") == null) {
	%>			
				<div class="login">
					<a id="login" href="javascript:loginPopupOpen();" > 
						<span class="signin blur">Sign in with your E-mail</span>
					</a><br />
					<a id="join" href="javascript:joinPopupOpen();"	class="blur" > 
						<span class="join">Create account</span>
					</a>
				</div><br />
		
			
	<%		
		} else {
	%>
				<div class="login">
					<a href="member/logOut.jsp" id="logout"	class="blur"> 
						<span class="out">Sign out</span>			
					</a>&nbsp;&nbsp;						
					<br/>
					
					<a href="javascript:modifyPopupOpen();" id="modify"	class="blur"> 
						<span class="modifyinfo">Modify information</span>
					</a>
	
				</div>
	<%
		}
	%>				
			<script type="text/javascript">
				// be pause video if click backyard 
				$('.container-fluid').click(function() {
					var video = document.getElementById("video");
					video.pause();
					$('#video').css('display', 'none');
				});
			</script>
			
			<!-- menu list -->
			
				<div id="menu" class="level0 blur" >
					<span class="apptitle" style="font-size: 1vw"> Menu</span>
					
	 					<!-- 			array List Image  : Sign In				-->
					<div>				
						<div  style="align-self:center; padding:4%; margin-top: 5%">
								<c:forEach var="j" items="${list}" begin="0" varStatus="status"	end="23">
									<span  style="padding: 0.3%;line-height: 1.3em;">
									<input id="" type="image" 
										src="img/${j.menuImg}" 
										class="listImg" alt=""	
										style="border-radius: 8%; 
										width: 15%;" 
										data-toggle="modal" 
										data-target="#myModal"
										onclick="modal_view('${j.menuImg}','${j.menuName}','${j.content}','${j.price }');">
									</span>
								</c:forEach>
						</div>
					</div>
				</div>	

		<!--	Bookup Table	   -->

		<div id="reserve" class="zoomTarget level0" data-duration="800">
			<span class="apptitle blur" style="font-size: 1vw">Book Up</span><br /> <br /> 
			<div style="width: 100%; height: 100%;">
				<img class="tableImg zoomTarget zoomButton "
					data-type="next" data-root=".demo" data-duration="800" 
					src="img/court.png" alt=""/>
				<br><br><br><br>
				
				<!-- 	no.1 Table book up 	-->
						
						<input type="button" name="t_index" class="table tb1 t1 zoomButton" 
								data-type="next" data-root=".demo" value="1" onclick="">					
		
						<input type="button" name="t_index" class="table tb1 t2 zoomButton" 
								data-type="next" data-root=".demo" value="2">
	
						<input type="button" name="t_index" class="table tb1 t3 zoomButton" 
								data-type="next" data-root=".demo" value="3">
	
						<input type="button" name="t_index" class="table tb1 t4 zoomButton" 
								data-type="next" data-root=".demo" value="4">
	
						<input type="button" name="t_index" class="table tb2 t5 zoomButton" 
								data-type="next" data-root=".demo" value="5">
	
						<input type="button" name="t_index" class="table tb2 t6 zoomButton" 
								data-type="next" data-root=".demo" value="6">
	
						<input type="button" name="t_index" class="table tb2 t7 zoomButton" 
								data-type="next" data-root=".demo" value="7">
	
						<input type="button" name="t_index" class="table tb3 t8 zoomButton" 
								data-type="next" data-root=".demo" value="8">
	
						<input type="button" name="t_index" class="table tb3 t9 zoomButton" 
								data-type="next" data-root=".demo" value="9">
																								
			</div>
		</div>
	
	<!--	 DatePicker View 	-->

	<%@ include file="reservation/bookup.jsp" %>		
	
		<div id="book" class="raw zoomTarget level0" 
			 style="font-family: 'Bungee Hairline', cursive; font-size: 0.8vw; font-weight:bolder;">
			<span style="color: black;"><%=dow %></span>&nbsp;&nbsp;
			<span style="color:#cfcfcf"><%= yyyy %></span>
				<br/><br/>

				<!-- 	Day of weeks	 -->
			<div id="datePicker" class="date">
			    <div class="col-xs-2 week_f"><%=EE[0] %>
		    		<br/><span id="today" class="today date_f date_sh" ><%=af[0] %></span>
		    	</div>
		    	<div class="col-xs-1 week_f"><%=EE[1] %>
		    		<br/><span id="manana" class="manana date_f date_sh" ><%=af[1] %></span>
		    	</div>
		    	<div class="col-xs-1 week_f"><%=EE[2] %>
		    		<br/><span id="third" class="third date_f date_sh" ><%=af[2] %></span>
		    	</div>
		    	<div class="col-xs-1 week_f"><%=EE[3] %>
		    		<br/><span id="fourth" class="fourth date_f date_sh" ><%=af[3] %></span>
		    	</div>
		    	<div class="col-xs-1 week_f"><%=EE[4] %>
		    		<br/><span id="fifth" class="fifth date_f date_sh" ><%=af[4] %></span>
		    	</div>
		    	<div class="col-xs-1 week_f"><%=EE[5] %>
		    		<br/><span id="sixth" class="sixth date_f date_sh" ><%=af[5] %></span>
		    	</div>
		    </div>	
		    	<br/>	
			    	<script type="text/javascript">
				    	$('#manana').click(function() {
							$('#footer').text('You have chosen <%=af[1] %> day. Please select your preferred time.');
						});
						$('#third').click(function() {
							$('#footer').text('You have chosen <%=af[2] %> day. Please select your preferred time.');
						});
						$('#fourth').click(function() {
							$('#footer').text('You have chosen <%=af[3] %> day. Please select your preferred time.');
						});
						$('#fifth').click(function() {
							$('#footer').text('You have chosen <%=af[4] %> day. Please select your preferred time.');
						});
						$('#sixth').click(function() {
							$('#footer').text('You have chosen <%=af[5] %> day. Please select your preferred time.');
						});
		    	</script>	    	
				
				<%
		if(email == null ){
			
		} else {
		%>
		<div class="table_1">				
			<!-- Calendar for Table No.1 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
		</div>
		
		<!-- Calendar for Table No.2 -->
		<div class="table_2">
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>		  
		</div>
		
		<div class="table_3">
			<!-- Calendar for Table No.3 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>		  
		</div>	
		
		<div class="table_4">
			<!-- Calendar for Table No.4 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>		  
		</div>	
		
		<div class="table_5">
			<!-- Calendar for Table No.5 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>		  
		</div>	
		
		<div class="table_6">
			<!-- Calendar for Table No.6 -->
			<div align="left"  class="tp timepicker0" style="padding-left:13%">
	 			<c:forEach var="j" begin="0" items="${t6_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left:13%">
	 			<c:forEach var="j" begin="0" items="${t6_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
		</div>
			
		<div class="table_7">
			<!-- Calendar for Table No.7 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
		</div>

		<div class="table_8">
						<!-- Calendar for Table No.7 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
		</div>	
		
		<div class="table_9">
			<!-- Calendar for Table No.9 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="time('${j.calendarTime}')">	
					</span>			
				</c:forEach>			
			</div>
		</div>
		
			<br /><br />
			<div style="position:relative; align-self: center; text-align: center;">
				<span>			
					<input type="text" class="reserve_label" style="background-color:#F6F5F4;border:none; font-size: 70%;" size="5" readonly="readonly"/>&nbsp;&nbsp;
					<input type="text" class="re_time" style="background-color:#F6F5F4;border:none;font-size: 70%;" size="5" readonly="readonly"/>&nbsp;&nbsp;
					<input type="text" class="re_day" style="background-color:#F6F5F4;border:none;font-size: 70%;" size="5" readonly="readonly"/>
				</span>
			</div>	
		
		<%
			}
		%>


		</div>		
			
			
		<script type="text/javascript" src="script/bookup.js"></script>		


		<!-- 	Basket	 -->
		<form id="bookup" action="bookup.do" name="bookup" method="post">
			<div id="basket" class="apptitle zoomTarget level0"  data-duration="800">
				<span id="bkTitle" class="blur" style="font-size: 1vw">Basket</span>
	<%
		if (session.getAttribute("ValidMem") == null) {

		}else{
	%>		
					<input  id="insite" 
							class="insite g_font site" 
							type="button" 
							value="Bookup"
							style="position: relative;"
							data-toggle="modal" 
							data-target="#payment"/>
	
	<%
		}
	%>							
				<!-- 	basket thumbnail image list -->
				<div  style="align-self:center; padding:4%; margin-top: 5%">
					<c:forEach var="j"  begin="0" varStatus="st"	end="7">
						<span  style="padding: 0.3%;line-height: 1.3em;">
						<img src="" 
							class="thumbnail${st.index}" alt=""	
							style="display:inline-block; 
									box-shadow:none; 
									border:none; border-radius: 5px 5px 25px 25px; 
									width: 20%;
									margin: 0px; padding: 0px 0px 5px 0px;">
						</span>
					</c:forEach>
				</div>
			</div>
			
			<!--  Reservation Information -->
		
			<div style="position:absolute; top:20vw; left:78vw; 
				 font-family: 'Bungee Hairline', cursive;font-size: 0.5vw; font-weight:bolder;">
				 
				<label style="border:none;">${email}</label>
				<input type="hidden" id="email" name="email" value="${email}"/>
				<br/>
				<label class="t_num" style="border:none;"></label>
				<input type="hidden" name="t_index" class="t_num" value=""/>
				       <br/>
				<label style=" border:none;"><%=dow %> <%=year %></label>
				<input type="hidden" name="reserved_wmy" 
					   value="<%=dow %> <%=year %>" />
				       <br/>
				<label class="reserve_day" style="border:none; font-size: 30%;"></label>      
				<input type="hidden" name="reserved_day" class="reserve_day" value=""/>
				       <br/>
				<label class="reserve_time" style="color: gray"></label>
				<input type="hidden" name="reserved_time" class="reserve_time" value="" />
				       <br/>       
				       
				<c:forEach var="j" begin="0" varStatus="st" end="5">
						<label class="menuname${st.index}" style="border:none; color: blue;" ></label>
						<input type="hidden" name="menuname${st.index}" 
							   class="menuname${st.index}" value=" " >
						<br/><br/>
				</c:forEach>

				  
				<!-- total menu -->
					<input type="hidden" name="menuname" class="menuname" value="">
					
			</div>
			
				<!-- Hidden information for submit -->
				<input type="hidden" name="distance" id="dist" class="dist" value="" style="color:black;">
				<input type="hidden" name="phone" value="${phone }">
				<input type="hidden" name="email" value="${email }">
				<input type="hidden" name="customer_name" value="${firstName }${lastName }">
				<input type="hidden" class="cdn" name="cdn" value="">
				<input type="hidden" class="validthru" name="inval" value="">
				<input type="hidden" class="cvc" name="cvc" value="">
				<input type="hidden" class="installment" name="installment" value="">	
				<input type="hidden" class="creditCardFirm" name="creditCardFirm" value="">
				<input type="hidden" name="withdraw" class="withdraw" value="">
		</form>
	
		<!-- init method -->
		<script type="text/javascript" src="script/init.js"></script>
		<!-- get List for reserve time -->
		<script type="text/javascript" src="script/calendar.js"></script>
		<!-- Collision Avoid for zoom & modal -->	
		<script type="text/javascript" src="script/modal.js"></script>
		
		<script type="text/javascript">
			//  Index of reserved menu convert by number
			function bseq(a){
				var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
				var b_seq= $('.bseq' + a).val();
				b_seq = b_seq.substring(2, b_seq.length-1);
				b_seq = b_seq.replace(/\s/g, ''); 
				b_seq= b_seq.replace(regExp, '');
				$('.bseq').val(b_seq);
			}
		
		</script>
		
			</div>
		</div>
	</div>
	

								
		<!-- 	Descript sentence	-->
		<div class="footer raw description" 
		     style="max-width:100%; width:100%; position:absolute; margin:1% 0 0 2%; align-self:center;
					font-family: 'Bungee Hairline', cursive; ">
				<label id="footer" class="typingFooter ">Welcome to my Store!! ${firstName} ${lastName} Would you like to select menu?</label>

		</div>	 
		
			<script type="text/javascript" src="script/automaticManual.js"></script>
	<%	
	if(session.getAttribute("ValidMem") == null){
	%>
		<script type="text/javascript">
			$('#basket').mouseenter(function() {
				$('#footer').text('You must be logged in to make reservations.');
				
			});
		</script>
	<%	
	}else{
	%>
		<script type="text/javascript">
			$('#basket').mouseenter(function() {
				$('#footer').text('Bookup Click the button to initiate the payment.');
			});
		</script>
	
	<%	
	}
	%>
	
	<script type="text/javascript">
		$(".slider").HSlider({
			easing: 'ease',
			animationTime: '400',
			pagination: true
		});
	</script>
</body>
</html>