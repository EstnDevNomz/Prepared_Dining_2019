<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://www.macosxsupport.com/jquery.zoomooz.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.js"></script>
<link href="https://fonts.googleapis.com/css?family=Bungee+Hairline" rel="stylesheet">
<script type="text/javascript" src="../script/ajax.js"></script>

<script type="text/javascript">

var time_array = new Array(); // AM/PM hh:mm
var m_array = new Array();	// mm
var m_interval = 0;	//term

var h = 0;
var m = 0;
var rn = 0;	// Amount
var pmam = 'AM';	// PM or AM
var h_str = 0;	// initial hour value 
var m_str = 0;	//initial minute value 
var hours = new Array();
var minutes = new Array();

function schedule_time() {
	
	rn = parseInt($('.rn').val());
	step = parseInt($('.step').val());
	m_str =  parseInt($('.mm').val());

	//m_str = $('.m_str').val()
	
	for(var i=0; i <= rn; i++) {
		m_array.push(i* step + m_str);
		
	}
		//input
		for(var i=0; i <= rn-1; i++) {
			
			h_str = parseInt($('.hh').val());
			
			
			
			h = parseInt(m_array[i] / 60 + h_str);
			m = m_array[i] % 60;
			
			if(h >= 13) {
					h = h - 12;
			}
			
			if(h >= 12) {
				pmam = 'PM';
			}else{
				
			}
			
			var H = pad(h, 2);
			var M = pad(m, 2);
			
			hours[i] = H;
			minutes[i] = M;
			
			//output
			
			$('.record'+i).val(pmam+' '+hours[i] +':'+ minutes[i]);
			
		}
}

function pad(n, width) {
	  n = n + '';
	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}


	
</script>
<style type="text/css">
	.record {
		position:relative;
		width:20%; height:10%;
		border-radius : 3px;
		border : none;
		outline:0;
		padding:1%;
		margin: 1% 0% 0% 0%;
		color : #ffffff; 
		font-size: 130%;
		font-family: 'Bungee Hairline', cursive;
		font-weight: bolder;
		text-align: center;
	}
	.qr {
		text-align : center;
		border-radius : 5px;
		padding : 1%;
		margin: 1%;
	}
</style>
</head>
<body>
	<form id="schedule" action="schedule.do" name="schedule" method="post">		
		<div class="container-fluid" >
			<div class="row">
				<div class="col-xs-12">
						<input type="text" name="calendarTable" id="calendarTable" 
							   class="calendarTable col-xs-2 qr" value="Table No.<%=request.getParameter("calendarTable")%>"> <!-- 팝업URI에서 추출한 Value -->
						<input type="text" name="calendarDay" id="day" class="day col-xs-1	qr" value="<%=request.getParameter("re_day")%>">
						<input type="text" class="hh col-xs-1 qr" value="" placeholder="Hour">
						<input type="text" class="mm col-xs-2 qr" value="" placeholder="Minute">
						<input type="text" class="step col-xs-1 qr" value="" placeholder="step">
						<input type="text" class="rn col-xs-1 qr" value="" placeholder="Amount">
						
						<button type="button" class="col-xs-2 qr" style=""onclick="javascript:schedule_time();">Input</button>
				</div>
				<div class="col-xs-12" style="margin-top:5px; padding-left: 13%">
					<div>
						<c:forEach var="i" begin="0" end="27" varStatus="st">
							<input name="calendarTime" type="submit" id="time" class="record${st.index } record"  value=""/>
						</c:forEach>
					</div>	
				</div>
				
			</div>
		</div>
	</form>
</body>
</html>