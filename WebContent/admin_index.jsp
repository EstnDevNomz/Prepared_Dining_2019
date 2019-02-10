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
	
	// for Client Purchase List(plist is all list)
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
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<meta name="robots" content="noindex, nofollow">
<meta name="googlebot" content="noindex, nofollow">
<!-- 			Outside Link			 -->
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Gruppo" rel="stylesheet"> 
<script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.js"></script>

<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://www.macosxsupport.com/jquery.zoomooz.min.js"></script>
<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet" />
<script src="http://vjs.zencdn.net/c/video.js"></script>

<!-- 			Inside Link			 	-->
<link rel="stylesheet" href="style/style_shape.css" type="text/css"	media="screen" />
<link rel="stylesheet" href="style/style_font.css" type="text/css"	media="screen" />
<link rel="stylesheet"  href="style/payment_style.css" type="text/css"	media="screen"></link>
<link rel="stylesheet"  href="style/reserve_style.css" type="text/css"	media="screen"></link>
<link rel="stylesheet"  href="style/modal.css" type="text/css"	media="screen"></link>

<script type="text/javascript" src="script/modal.js"></script>
<script type="text/javascript" src="script/popup.js"></script>
<script type="text/JavaScript" src="script/menuContent.js"></script>
<script type="text/javascript" src="script/paymentInput.js"></script>
<script type="text/javascript" src="script/paymentView.js"></script>
<script type="text/javascript" src="script/ajax.js"></script>

<!-- 				가로스크롤 						-->
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0" />
<script type="text/javascript" src="jquery.HSlider.min.js"></script>
<script type="text/javascript" src="script/checkInvalid.js"></script>

		<title>JSP AJAX</title>

</head>

<body onload="init();$('#inputpay').hide();$('#pay').hide();"style="background-color: #000;">
		
<%	//	고객 접속확인
	if(session.getAttribute("ValidMem") == null){
%>
		<script type="text/javascript">
			alert("Invalid connection.");
			self.location.replace('http://localhost:8181/Project_OpenDining_L.H-S/index.do');
		</script>
<%
	}else if(email.equals(admin)){
%>

	<div class="zoomViewport demo" style=" height: 85%;">
	    <div class="zoomContainer" style="height: 85%;" data-duration="100">
			<div class="container-fluid" style="height: 85%;">
			
				<div class="wrap">
					<div class="slider">
						<!-- 	Page 1	 -->
						<section>
							<!-- 	Descript sentence	-->
							<div class="footer raw typing description" 
							     style="max-width:100%; width:100%; 
										font-family: 'Bungee Hairline', cursive;">
								<span class="col-xs-9 " >
								</span>
								<span class="col-xs-3">
									<%@ include file="header/printClock.jsp" %>
								</span>
							</div>	
							
						</section>
						<!-- 	Page 2	 -->
						<section class="order-list">
						
										<!--  Cumstomer's Purchase Full List -->
							
							<div class="form-group row pull-right" 
								style="position:absolute; top:-45px; width:95%; align-self: center;">
								<div class="col-xs-5"></div>
								<div class="col-xs-2">
									<input class="form-control" 
											id="keyword" 
											onkeyup="$('.table').show();searchFunction()" 
											type="text" 
											size="26">
								</div>	
								<div class="col-xs-1">
									<button id="delete" class="btn btn-primary" 
											style="width:100%;" type="button" 
											onclick="$('.search_table').hide();$('.pList').css('display','block');" >											
											Delete
									</button>
								</div>
							</div>
							<table class="search_table row form-group">
								<thead style="padding: 5px;">
									<tr class="table">
										<th class="col-xs-1" style="text-align: center;
											padding:1% 0% 1% 0%;">Payment_date </th>
										<th class="col-xs-1" style="text-align: center;">E-mail </th>
										<th class="col-xs-1" style="text-align: center;">phone </th>
										<th class="col-xs-1" style="text-align: center;">withdraw</th>
										<th class="col-xs-1" style="text-align: center;">Card</th>
										<th class="col-xs-1" style="text-align: center;">CDN</th>
										<th class="col-xs-1" style="text-align: center;">Customer</th>
										<th class="col-xs-1" style="text-align: center;">installment</th>
									</tr>
								</thead>
								
								<tbody id="ajaxTable"></tbody>
								
							</table>
							<%
								if(email == null ){
							
								}else if(email.equals(admin)){
							%>	
										<!--  Administrator's Purchase Full List -->
							
										<div class="pList scroll scroll4" id="pList">
											
											<div class="listSub col-xs-12 label label-info">
												<label class="col-xs-1">Index</label>
												<label class="col-xs-1">Date</label>
												<label class="col-xs-1">time</label>
												<label class="col-xs-1">Table</label>
												<label class="col-xs-5">Ordered Menu</label>
												<label class="col-xs-1">Email</label>
												<label class="col-xs-1">Price</label>	
												<label class="col-xs-1">Cancel</label>	
											</div>
											
											<c:forEach var="i" items="${plist}" begin="0" end="23" varStatus="st">
												<div class="listContent col-xs-12">
													<input type="hidden" class="bseq${st.index}" value="${i.b_seq }">
													<div class="col-xs-1">${i.b_seq }</div>
													<div class="col-xs-1">${i.reserved_wmy }</div>
													<div class="col-xs-1">${i.reserved_Time }</div>
													<div class="col-xs-1">${i.t_index }</div>
													<div class="col-xs-5">${i.menuname }</div>
													<div class="col-xs-1">${i.email }</div>
													<div class="col-xs-1">${i.distance }</div>
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
							<%		
								}else{
									
								}
							%>

						</section>	
						<!-- 	Page 3	 -->
						<section>
							<article>
								<!-- Video Section -->
								<video id="video" poster="" 
										class="video-js"
										width="350" height="260" 
										controls="controls" autoplay
										loop="loop">
									<source class="video" src="videos/SlowInfantileCusimanse.mp4" type="video/mp4" />
								</video>
								<br/>
								<div class="vidOps">
									<button type="button" id="stop" 
											class="glyphicon glyphicon-stop" >
									</button>
									<button type="button" id="play" 
											class="glyphicon glyphicon-pause" >
									</button>
									<button type="button" onclick="change();insertVideo()"
											class="upload glyphicon glyphicon-eject" >
									</button>
									<br/><br/>
									<input type="file" class="filename" src="" size="20px"/>
								</div>
								
							</article>

						<!--				location information			 -->
							
						  	<div id="locationinformation" class="location" style="width:20vw; text-align: right;"> 
							<!-- get Distance method -->
							<script type="text/javascript" src="script/calcDistance.js"></script>
						     <label style="width:20vw;">My location:</label> <br/> 
						      <a id="home" data-toggle="modal" data-target="#myModal"style="color:#5E959F; text-align: left;">
						      	<span id="startLat"></span>°, <span id="startLon"></span>°
						      </a>
						 	<br/><br/>
		
						      Store location:<br/> 
						      <a id="cl" href="javascript:mapPopupOpen()" style="color: #5E959F">
						      	<span id="currentLat"></span>°, <span id="currentLon"></span>°
						      </a>
						    <br/><br/>
						   	
						     Distance:<br/> 
						     <label class="distance" >distance</label>
						      <input type="hidden" 
								     id="distance" 
								     name="distance"
								     readonly="readonly">
							<input type="hidden" id="a" value="">
							<input type="hidden" id="b" value="">
						  </div>  
								
						</section>
					</div>
				</div>	
				
								
				<!-- video control -->
				<script type="text/javascript" src="script/video.js"></script>
				
				<!-- 		Description sentence		-->
				
				<div class=""style="position:relative; top:50px;">
					<span class="col-xs-10">						
					</span>
					<span class="col-xs-2">
						<%@ include file="header/printClock.jsp" %>
					</span>
				</div>	
						
			<!-- 				Users account 				-->
			
				<div class="login">
					<a href="member/logOut.jsp" id="logout"	class="admin_blur" style="color: #659EA8"> 
						<span class="out">Sign out</span>			
					</a>&nbsp;&nbsp;						
					<br/>
					
					<a href="javascript:modifyPopupOpen();" id="modify"	class="admin_blur" style="color: #659EA8"> 
						<span class="modifyinfo">Modify information</span>
					</a>
	
				</div>

			
			<!-- 				menu list 				-->
				<div id="admin_menu" class="level0 frame">
					<!-- 		for insert menu			 -->
					<a href="javascript:menuPopupOpen()"  > 
					<span class="addMenu apptitle" >Add List</span>
				</a>
	 					<!-- 			array List Image  : sign out				-->
					<div>				
						<div style="align-self:center; padding:4%; margin-top: 5%">
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

		<div id="reserve" class="zoomTarget level0 frame" data-duration="100">
			<span class="apptitle blur" style="font-size: 1vw; color: #3DA585">Book Up</span><br /> <br /> 
			<div style="width: 100%; height: 100%;">
				<img class="tableImg zoomButton "
					src="img/court_black.png" alt=""/>
				<br><br><br><br>
				
				<!-- 	no.1 Table book up 	-->
						
						<input type="button" name="t_index" 
								class="table tb1 t1 zoomButton" 
								data-type="next" data-root=".demo" value="1" onclick="">					
		
						<input type="button" name="t_index" 
								class="table tb1 t2 zoomButton" 
								data-type="next" data-root=".demo" value="2">
	
						<input type="button" name="t_index" 
								class="table tb1 t3 zoomButton" 
								data-type="next" data-root=".demo" value="3">
	
						<input type="button" name="t_index" 
								class="table tb1 t4 zoomButton" 
								data-type="next" data-root=".demo" value="4">
	
						<input type="button" name="t_index" 
								class="table tb2 t5 zoomButton" 
								data-type="next" data-root=".demo" value="5">
	
						<input type="button" name="t_index" 
								class="table tb2 t6 zoomButton" 
								data-type="next" data-root=".demo" value="6">
	
						<input type="button" name="t_index" 
								class="table tb2 t7 zoomButton" 
								data-type="next" data-root=".demo" value="7">
	
						<input type="button" name="t_index" 
								class="table tb3 t8 zoomButton" 
								data-type="next" data-root=".demo" value="8">
	
						<input type="button" name="t_index" 
								class="table tb3 t9 zoomButton" 
								data-type="next" data-root=".demo" value="9">
																								
			</div>
		</div>
		
	<%
		}
	%>
	
	<!--	 DatePicker View 	-->

	<%@ include file="reservation/bookup.jsp" %>		
	
		<div id="book" class="raw zoomTarget level0 frame"  data-duration="100"
			 style="font-family: 'Bungee Hairline', cursive; font-size: 80%; font-weight:bolder;">
			<span style="color:#659EA8;"><%=dow %></span>&nbsp;&nbsp;
			<span style="color:#659EA8;"><%= yyyy %></span>
				<br/><br/>

				<!-- 	Day of weeks	 -->
			<div class="date">
			    <div class="col-xs-1 week_f">
			    	<div class="admin_dow_f"><%=EE[0] %></div>			    
		    		<br/>
		    		<div id="today" 
			    		class="today admin_date_f admin_date_sh">
			    		<%=af[0] %>
		    		</div>
		    	</div>
		    	<div class="col-xs-1 week_f">
			    	<div class="admin_dow_f"><%=EE[1] %></div>			    
		    		<br/>
		    		<div id="manana" 
			    		class="manana admin_date_f admin_date_sh"">
			    		<%=af[1] %>
		    		</div>
		    	</div>
		    	<div class="col-xs-1 week_f">
			    	<div class="admin_dow_f"><%=EE[2] %></div>			    		    	
		    		<br/>
		    		<div id="third" 
			    		class="third admin_date_f admin_date_sh"">
			    		<%=af[2] %>
		    		</div>
		    	</div>
		    	<div class="col-xs-1 week_f">
			    	<div class="admin_dow_f"><%=EE[3] %></div>			    		    	
		    		<br/>
		    		<div id="fourth" 
			    		class="fourth admin_date_f admin_date_sh"">
			    		<%=af[3] %>
		    		</div>
		    	</div>
		    	<div class="col-xs-1 week_f">
			    	<div class="admin_dow_f"><%=EE[4] %></div>		
			    	<br />	    		    	
		    		<div id="fifth" 
			    		class="fifth admin_date_f admin_date_sh"">
			    		<%=af[4] %>
		    		</div>
		    	</div>
		    	<div class="col-xs-1 week_f">
			    	<div class="admin_dow_f"><%=EE[5] %></div>			    		    	
		    		<br/>
		    		<div id="sixth" 
			    		class="sixth admin_date_f admin_date_sh"">
			    		<%=af[5] %>
		    		</div>
		    	</div>
		    </div>	
		    	<br/>		    	
				
	<%
		if(email == null ){
		
		} else if(email.equals(admin)){
	%>
			<!-- 	TimePicker View for Administor		-->
						<!-- 	Add Canlendar	-->
				<div>
					<button type="button" id="" class="a1 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t1').val(), $('.re_day').val())">
						+
					</button>
				</div>
				<div>
					<button type="button" id="" class="a2 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t2').val(), $('.re_day').val())">
						+
					</button>
				</div>	
				<div>
					<button type="button" id="" class="a3 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t3').val(), $('.re_day').val())">
						+
					</button>
				</div>
				<div>
					<button type="button" id="" class="a4 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t4').val(), $('.re_day').val())">
						+
					</button>
				</div>	
				<div>
					<button type="button" id="" class="a5 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t5').val(), $('.re_day').val())">
						+
					</button>
				</div>									
				<div>
					<button type="button" id="" class="a6 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t6').val(), $('.re_day').val())">
						+
					</button>
				</div>				
				<div>
					<button type="button" id="" class="a7 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t7').val(), $('.re_day').val())">
						+
					</button>
				</div>		
				<div>
					<button type="button" id="" class="a8 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t8').val(), $('.re_day').val())">
						+
					</button>
				</div>																
				<div>
					<button type="button" id="" class="a9 add_cal" style="display:none;"
							onclick="javascript:addCalendar($('.t9').val(), $('.re_day').val())">
						+
					</button>
				</div>	
	<div class="timePicker">
		<div class="table_1" style="display:none;">	
		
<%-- 			<c:forEach var="item" begin="0" items="${fn:split('today|manana|third|fourth|fifth|sixth', '|') }" end="8" varStatus="status">
				<div align="left"  class="tp timepicker${status.index }"  style="padding-left: 13%">
				
		 			<c:forEach var="j" begin="0" items="${calendar_0}" end="15" varStatus="st">
			 			

						<span class="" style="text-align: center;">	
							<input type="button" id="" class="time time_admin time-sh"
								value="${j.calendarTime} " 
								onclick="deleteCalendar('${j.calendarTime}', '${item }')">	
						</span>			
						
					</c:forEach>	
							
				</div>
			</c:forEach> --%>
			
			<!-- Calendar for Table No.1 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime}" 
							onclick="deleteCalendar($('.t1').val(), '${j.calendarTime}', 'today')">
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t1').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} "
							onclick="deleteCalendar($('.t1').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t1').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t1').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t1_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t1').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>										
		</div>
		
		<!-- Calendar for Table No.2 -->
		<div class="table_2" style="display:none;">
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t2').val(), '${j.calendarTime}', 'today')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t2').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t2').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t2').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t2').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t2_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t2').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>
		</div>
		
		<div class="table_3" style="display:none;">
			<!-- Calendar for Table No.3 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t3').val(), '${j.calendarTime}', 'today')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t3').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t3').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t3').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t3').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t3_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t3').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>
		</div>	
		
		<div class="table_4" style="display:none;">
			<!-- Calendar for Table No.4 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t4').val(), '${j.calendarTime}', 'today')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t4').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t4').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t4').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t4').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t4_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t4').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>
		</div>	
		
		<div class="table_5" style="display:none;">
			<!-- Calendar for Table No.5 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t5').val(), '${j.calendarTime}', 'today')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t5').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t5').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t5').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t5').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t5_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t5').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>
		</div>	
		
		<div class="table_6" style="display:none;">
			<!-- Calendar for Table No.6 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t6').val(), '${j.calendarTime}', 'today')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t6').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t6').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t6').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t6').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t6_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t6').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>
		</div>
			
		<div class="table_7" style="display:none;">
			<!-- Calendar for Table No.7 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t7').val(), '${j.calendarTime}', 'today')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t7').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t7').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t7').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t7').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t7_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t7').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>
		</div>	

		<div class="table_8" style="display:none;">
						<!-- Calendar for Table No.7 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t8').val(), '${j.calendarTime}', 'today')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t8').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t8').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t8').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t8').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t8_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t8').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>		  
		</div>	
		
		<div class="table_9" style="display:none;">
			<!-- Calendar for Table No.9 -->
			<div align="left"  class="tp timepicker0"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_today_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t9').val(), '${j.calendarTime}', 'today')">	
					</span>			
				</c:forEach>			
			</div>
			<div align="left"  class="tp timepicker1"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_manana_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t9').val(), '${j.calendarTime}', 'manana')">	
					</span>			
				</c:forEach>			
			</div>					  
			<div align="left"  class="tp timepicker2"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_third_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t9').val(), '${j.calendarTime}', 'third')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker3"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_fourth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t9').val(), '${j.calendarTime}', 'fourth')">	
					</span>			
				</c:forEach>			
			</div>				
			<div align="left"  class="tp timepicker4"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_fifth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t9').val(), '${j.calendarTime}', 'fifth')">	
					</span>			
				</c:forEach>			
			</div>	
			<div align="left"  class="tp timepicker5"  style="padding-left: 13%">
	 			<c:forEach var="j" begin="0" items="${t9_sixth_calendar }" end="15" varStatus="st">
					<span class="" style="text-align: center;">	
						<input type="button" class="time time_admin time-sh"
							value="${j.calendarTime} " 
							onclick="deleteCalendar($('.t9').val(), '${j.calendarTime}', 'sixth')">	
					</span>			
				</c:forEach>			
			</div>
		</div>
	</div>

		<!-- temp cell -->
		<input type="hidden" class="re_day" value="">		
		<%
			}
		%>

		</div>	
			
		<script type="text/javascript" src="script/bookup.js"></script>		

		<!-- 	Basket	 -->
		
		<form id="bookup" action="bookup.do" name="bookup" method="post">
			<div id="basket" class="apptitle zoomTarget level0 frame"  data-duration="100">
				<span id="bkTitle" class="blur" style="color: #3DA585">Basket</span>
	<%
		if (session.getAttribute("ValidMem") == null) {

		}else{
	%>		
					<input  id="insite" 
							class="insite g_font site" 
							type="button" 
							value="Bookup"
							style="position: relative;background-color:#659EA8 "
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
		
				<div class="reserv-info">					 
					<input type="hidden" id="email" name="email" value="${email}"/>
					<label class="t_num" style="border:none;"></label>
					<input type="hidden" name="t_index" class="t_num" value=""/>
					       <br/>
					<label style=" border:none;"><%=dow %> <%=year %></label>
					<input type="hidden" name="reserved_wmy" 
						   value="<%=dow %> <%=year %>" />
					<label class="reserve_day" style="border:none; font-size: 30%;"></label>      
					<input type="hidden" name="reserved_day" class="reserve_day" value=""/>
					       <br/>
					<label class="reserve_time" style="color: gray"></label>
					<input type="hidden" name="reserved_time" class="reserve_time" value="" />
					       <br/>       
					<label class="withdraw"></label>
					<c:forEach var="j" begin="0" varStatus="st" end="5">
							<label class="menuname${st.index}" style="border:none; color: blue;" ></label>
							<input type="hidden" name="menuname${st.index}" 
								   class="menuname${st.index}" value="" >
							<br/>
					</c:forEach>
					  
					<!-- total menu -->
						<input type="hidden" name="menuname" class="menuname" value="">						
				</div>
			
				<!-- Hidden information for submit -->
				<input type="hidden" name="distance" id="dist" class="dist"value="">
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
	<script type="text/javascript">
	//HSlider
		$(".slider").HSlider({
			easing: 'ease',
			animationTime: '400',
			pagination: true
		});
	</script>
		<!-- Description Footer -->
		<label class="admin_footer ">You are logged in as administrator.</label>
	<script type="text/javascript" src="script/automaticManual.js"></script>	
</body>

</html>
