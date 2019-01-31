<%@page import="com.jsp.pj1.dto.Dto"%>
<%@page import="com.jsp.pj1.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8"); 
	
	String email = (String)session.getAttribute("email");	//id 불러옴
	Dao dao = Dao.getInstance();
	Dto dto = dao.getCustomer(email);	// getMember에 세션중인 id를 넣어서 '해당하는 회원정보를 dto에 담고' 리턴된 dto데이터를 가져옴
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../script/popup.js" lang="UTF-8"></script>
<link rel="stylesheet" href="../style/style_shape.css" type="text/css"	media="screen" />
<link rel="stylesheet" href="../style/join_style.css" type="text/css" media="screen" />
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

<style nonce="yUbipBQNsvQ"></style>
<link href="https://ssl.gstatic.com/accounts/static/_/ss/k=gaia.gaiafe_glif.n0gjjPwuyc4.L.I11.O/am=AgXAAAAAAPi_AQAGEEEBNAB3Afzf_P-LIwIAAqAAC4T-AzrQuYsC/d=0/rs=ABkqax3MHqepB9ekA8nxEsHHVvZut81oBw" rel="stylesheet" type="text/css">
<script type="text/javascript" nonce="yUbipBQNsvQ">	window['cssLoaded'] = true;</script>
<script id="base-js" src="https://ssl.gstatic.com/accounts/static/_/js/k=gaia.gaiafe_glif.en.nCyNW0BF8uI.O/am=AgXAAAAAAPi_AQAGEEEBNAB3Afzf_P-LIwIAAqAAC4T-AzrQuYsC/rt=j/d=1/rs=ABkqax3U7EKPGC1Ag3HYNeSteRxpMEEJYA/m=webcreateaccount" async="" nonce="yUbipBQNsvQ"></script>


<!-- 부트스트랩, css관련 링크 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="join_style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../style/style_font.css" type="text/css"	media="screen" />
<link	href="https://ssl.gstatic.com/accounts/static/_/ss/k=gaia.gaiafe_glif.n0gjjPwuyc4.L.I11.O/am=AgXAAAAAAPi_AQAGEEEBNAB3Afzf_P-LIwIAAqAAC4T-AzrQuYsC/d=0/rs=ABkqax3MHqepB9ekA8nxEsHHVvZut81oBw" rel="stylesheet" type="text/css">

<!-- google font -->
<link href="https://fonts.googleapis.com/css?family=Bungee+Hairline" rel="stylesheet"> 
<link rel="stylesheet" href="../style/style_font.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../style/join_style.css" type="text/css"	media="screen" />

<style type="text/css">
	.loginstyle {
		font-family: 'Bungee Hairline', cursive;
		font-weight: bolder;	
	}
</style>
</head>

<body class="modify_body">

<%	//	고객 접속확인
	if(session.getAttribute("ValidMem") == null){
%>
	<script type="text/javascript">
		alert('Invalid connection.')
		// Go back to Client View
		opener.parent.location.replace('http://localhost:8181/Project_OpenDining_L.H-S/index.do');
		self.close();
	</script>
<%
	}else{
%>

	<div class="" style="position: absolute;"><div class="joinTitle" style="align-self: center;">My information</div>		
		<form name="modifyForm" method="post" action="modifyOk.jsp">
			<div class="container">
				<div class="loginstyle">
					<div class="panel1 rFrNMe RSJo4e uIZQNc og3oZc zKHdkd sdJrJc Tyc9J"
						jsaction="clickonly:KjsqPd; focus:Jt1EX; blur:fpfTEe; input:Lg5SV;"
						jscontroller="pxq3x" jsname="qTMFQd" jsshadow="">
						<div class="aXBtI Wic03c">
							<span name="firstName" tabindex="0" class="loginstyle" id="phoneNumberId"
								aria-label="firstName" type="text"></span>
							<div class="AxOyFc loginstyle" aria-hidden="true">${firstName}</div>
							<div class="i9lrp mIZh1c"></div>
							<div></div>
						</div>

					</div>

					<div class="rFrNMe RSJo4e uIZQNc og3oZc zKHdkd sdJrJc Tyc9J"
						jsaction="clickonly:KjsqPd; focus:Jt1EX; blur:fpfTEe; input:Lg5SV;"
						jscontroller="pxq3x" jsname="qTMFQd" jsshadow="">
						<div class="aXBtI Wic03c">
							<span name="lastName" class="whsOnd zHQkBf loginstyle" id="phoneNumberId"
								aria-label="E-Mail" type="text"></span>
							<div class="AxOyFc loginstyle" aria-hidden="true">${lastName}</div>
							<div class="i9lrp mIZh1c"></div>
							<div></div>
						</div>
					</div><br /><br />


					<div class="panel1 rFrNMe RSJo4e uIZQNc og3oZc zKHdkd sdJrJc Tyc9J"
						jsaction="clickonly:KjsqPd; focus:Jt1EX; blur:fpfTEe; input:Lg5SV;"
						jscontroller="pxq3x" jsname="qTMFQd" jsshadow="">
						<div class="aXBtI Wic03c">
							<span name="customerEmail" class="whsOnd zHQkBf loginstyle" id="phoneNumberId"
								aria-label="E-Mail" type="text" autocomplete="email"></span>
							<div class="AxOyFc loginstyle" aria-hidden="true">${email}</div>
							<div class="i9lrp1 mIZh1c"></div>
							<div class="OabDMe cXrdqd Y2Zypf" style="transform-origin: center;"></div>
						</div>
					</div>
					<br /><br />


					<div class="panel1 rFrNMe RSJo4e uIZQNc og3oZc zKHdkd sdJrJc Tyc9J"
						jsaction="clickonly:KjsqPd; focus:Jt1EX; blur:fpfTEe; input:Lg5SV;"
						jscontroller="pxq3x" jsname="qTMFQd" jsshadow="">
						<div class="aXBtI Wic03c">
							<input name="customerPwd" tabindex="0" class="whsOnd zHQkBf loginstyle"
								id="phoneNumberId" aria-label="password" type="password"
								jsname="YPqjbf" data-initial-value="" autocomplete="tel">
							<div class="AxOyFc loginstyle" aria-hidden="true" style="color: #ff8000; font-size: 70%;">Password</div>
							<div class="i9lrp mIZh1c"></div>
							<div class="OabDMe cXrdqd Y2Zypf" style="transform-origin: center;"></div>
						</div>

					</div>
					<div class="rFrNMe RSJo4e uIZQNc og3oZc zKHdkd sdJrJc Tyc9J"
						jsaction="clickonly:KjsqPd; focus:Jt1EX; blur:fpfTEe; input:Lg5SV;"
						jscontroller="pxq3x" jsname="qTMFQd" jsshadow="">
						<div class="aXBtI Wic03c">
							<input tabindex="0" class="whsOnd zHQkBf loginstyle" name="repw"
								aria-label="password" type="password" jsname="YPqjbf"
								data-initial-value="" autocomplete="tel">
							<div class="AxOyFc loginstyle" aria-hidden="true" style="color: #ff8000; font-size: 70%;">Confirm</div>
							<div class="i9lrp mIZh1c"></div>
							<div class="OabDMe cXrdqd Y2Zypf" style="transform-origin: center;"></div>
						</div>
					</div><br /><br />

					<div class="panel1 loginForm">
						<div class="aXBtI Wic03c">
							<input name="customerPhone" value="<%=dto.getCustomerPhone() %>" tabindex="0"
								class="whsOnd zHQkBf loginstyle" id="phoneNumberId" aria-label="phone"
								type="text" jsname="YPqjbf" autocomplete="tel"></input>
							<div class="i9lrp mIZh1c"></div>
							<div class="OabDMe cXrdqd Y2Zypf" style="transform-origin: center;"></div>
						</div>
					</div><br /><br />

					<div class="panel1 loginForm">
						<div class="aXBtI Wic03c">
							<input name="customerAddr" value="<%=dto.getCustomerAddr() %>" tabindex="0"
								class="whsOnd zHQkBf loginstyle" id="phoneNumberId" aria-label="firstName"
								type="text" jsname="YPqjbf" autocomplete="tel"></input>
							<div class="i9lrp mIZh1c"></div>
							<div class="OabDMe cXrdqd Y2Zypf" style="transform-origin: center;"></div>
						</div>
					</div><br />

					<div class="lDwpOe"></div>
					<!-- 블루라인 클래스-->

					<div style="padding-left: 85%">
						<div class="aXBtI">
							<p>
								<input type="button" class="btn btn-primary loginstyle" 
										value="Done" onclick="checkModify()">
							</p>

						</div>
					</div>
				</div>
			</div>
		</form>
	</div>	
<%
		}
%>
</body>
</html>