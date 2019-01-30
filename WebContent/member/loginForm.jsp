<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("EUC-KR");%>
<%String email = (String)session.getAttribute("email"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://ssl.gstatic.com/accounts/static/_/ss/k=gaia.gaiafe_glif.n0gjjPwuyc4.L.I11.O/am=AgXAAAAAAPi_AQAGEEEBNAB3Afzf_P-LIwIAAqAAC4T-AzrQuYsC/d=0/rs=ABkqax3MHqepB9ekA8nxEsHHVvZut81oBw" rel="stylesheet" type="text/css">
<script type="text/javascript" nonce="yUbipBQNsvQ">	window['cssLoaded'] = true;</script>
<script id="base-js" src="https://ssl.gstatic.com/accounts/static/_/js/k=gaia.gaiafe_glif.en.nCyNW0BF8uI.O/am=AgXAAAAAAPi_AQAGEEEBNAB3Afzf_P-LIwIAAqAAC4T-AzrQuYsC/rt=j/d=1/rs=ABkqax3U7EKPGC1Ag3HYNeSteRxpMEEJYA/m=webcreateaccount" async="" nonce="yUbipBQNsvQ"></script>
<!-- 블루라인 -->
<script nonce="yUbipBQNsvQ" data-id="_gd">
	window.WIZ_global_data = {
		"Mo6CHc" : 3322081921034540239,
		"OewCAd" : "%.@.\"xsrf\",null,[\"\"]\n,\"AFoagUU7db1HdiqPhWXM3uZGF1cN4Zuq-w:1543234344370\"]\n",
		"Qzxixc" : "S-703833166:1543234344362000",
		"thykhd" : "ADk_-TP1VmR8yDQPNFFUhcmBZvmQvXGJyRXShtlbcccdJCgv2VDyWgAEgeij1C_uDBamdCHNdiqodsXVc_oSBxd5F0c5BhiQeCT7",
		"w2btAe" : "%.@.null,null,\"\",false,null,null,true]\n"
	};
</script>

<!-- 부트스트랩, css관련 링크 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"	href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://ssl.gstatic.com/accounts/static/_/ss/k=gaia.gaiafe_glif.n0gjjPwuyc4.L.I11.O/am=AgXAAAAAAPi_AQAGEEEBNAB3Afzf_P-LIwIAAqAAC4T-AzrQuYsC/d=0/rs=ABkqax3MHqepB9ekA8nxEsHHVvZut81oBw" rel="stylesheet" type="text/css"/>
<!-- google font -->
<link href="https://fonts.googleapis.com/css?family=Bungee+Hairline" rel="stylesheet"> 
<link rel="stylesheet" href="../style/style_font.css?v=<%=System.currentTimeMillis() %>" type="text/css"	media="screen" />
<script type="text/javascript" src="../script/popup.js" lang="UTF-8"></script>
<link rel="stylesheet" href="../style/join_style.css" type="text/css"	media="screen" />
<script type="text/javascript" src="../script/calcDistance.js"></script>

<script type="text/javascript">

	var startPos;
     
    if (navigator.geolocation) { 
      navigator.geolocation.getCurrentPosition(function(position) {
        startPos = position;

      }, function(error) {
        alert("Error occurred. Error code: "+error.code);
      });
  
      navigator.geolocation.watchPosition(function(position) {

        var calc =  calculateDistance(startPos.coords.latitude, startPos.coords.longitude,
          				  37.508286743400000, 126.73514674630000);
     					   /* position.coords.latitude, position.coords.longitude); */
        calc = calc.toString();
        calc = calc.substr(0,7);
        document.getElementById("userDistance").value = calc;	  
      });
    }

  
  function calculateDistance(lat1, lon1, lat2, lon2) {
    var R = 6371; // km
    var dLat = (lat2-lat1).toRad();
    var dLon = (lon2-lon1).toRad(); 
    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
            Math.sin(dLon/2) * Math.sin(dLon/2); 
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
    var d = R * c;
    return d;
  }
  Number.prototype.toRad = function() {
    return this * Math.PI / 180;
  }
</script>

</head>
<title></title>

<body class="login_body">

	<h1 align="center" class="joinTitle">
		Sign in
	</h1>
		<form name="loginForm" method="post" action="loginOk.jsp">
			<div class="container">
				<div style="font-family: 'Bungee Hairline', cursive;">
					<div class="panel1 rFrNMe RSJo4e uIZQNc og3oZc zKHdkd sdJrJc Tyc9J" style="width: 93%;"
						jsaction="clickonly:KjsqPd; focus:Jt1EX; blur:fpfTEe; input:Lg5SV;"
						jscontroller="pxq3x" jsname="qTMFQd" jsshadow="">
						<div class="aXBtI Wic03c">
							<input id="" name="email" tabindex="0" class="whsOnd zHQkBf"
								aria-label="email" type="email" jsname="YPqjbf"
								value="${email }" autocomplete="tel">
							<div class="AxOyFc loginstyle" aria-hidden="true">Email Address</div>
							<div class="i9lrp mIZh1c"></div>
							<div class="OabDMe cXrdqd Y2Zypf"
								style="transform-origin: center;"></div>
						</div>

					</div>
					<br />


					<div class="panel1 rFrNMe RSJo4e uIZQNc og3oZc zKHdkd sdJrJc Tyc9J"
						jsaction="clickonly:KjsqPd; focus:Jt1EX; blur:fpfTEe; input:Lg5SV;"
						jscontroller="pxq3x" jsname="qTMFQd" jsshadow="">
						<div class="aXBtI Wic03c">
							<input id="" name="pw" tabindex="0" class="whsOnd zHQkBf" id="phoneNumberId"
								aria-label="password" type="password" jsname="YPqjbf"
								data-initial-value="" autocomplete="tel">
							<div class="AxOyFc loginstyle" aria-hidden="true">Password</div>
							<div class="i9lrp mIZh1c"></div>
							<div class="OabDMe cXrdqd Y2Zypf"
								style="transform-origin: center;"></div>
						</div>
					</div>
					
					<div class="lDwpOe"></div>
					<!-- 블루라인 클래스-->
					
					<!-- Distance value -->
					<input type="hidden" id="userDistance" name="distance" 
							class="" style="position: absolute; top:50px;" value=""/>
					
					<div style="padding-top: 3%; padding-left: 77%">
						<div class="aXBtI">
							<input type="button" class="btn btn-primary loginstyle" value="Next"
								onclick="javascript:checkLogin()">

						</div>
					</div>
				</div>
			</div>
		</form>
</body>
</html>