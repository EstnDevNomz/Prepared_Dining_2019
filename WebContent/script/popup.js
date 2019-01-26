//popup window
function joinPopupOpen() {

	var popUrl = "member/joinForm.jsp"; // 팝업창에 출력될 페이지 URL
	var popOption = "top=150, left=650, width=440, height=480, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no;";
	window.open(popUrl, "", popOption);
}
function loginPopupOpen() {

	var popUrl = "member/loginForm.jsp";
	var popOption = "top=150, left=650, width=440, height=360, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no;"; 
	window.open(popUrl, "", popOption);
}
function modifyPopupOpen() {

	var popUrl = "member/modifyForm.jsp"; 
	var popOption = "top=150, left=650, width=440, height=570, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no;";
	window.open(popUrl, "", popOption);
}
function menuPopupOpen() {

	var popUrl = "menu/menuWriteForm.jsp"; 
	var popOption = "top=-5, left=50%, width=430, height=750, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no;";
	window.open(popUrl, "", popOption);
}
function mapPopupOpen() {
	
	var popUrl = "http://127.0.0.1:8181/Project_OpenDining_L.H-S/location/map.jsp"; 
	var popOption = "top=200, left=500, width=420, height=420, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no;";
	window.open(popUrl, "", popOption);
}
function paymentPopupOpen() {
	//when you click the payment button
	//$("#creditcard").attr("action","payment.do").submit();
	$("#bookup").attr("action","bookup.do").submit();
	
	//response.sendRedirect("../reservation/bookupOk.jsp");
}

function addCalendar(calendarTable, re_day) {
	 //Attach the parameter from the Calender in index.jsp 
	var popUrl = "reservation/scheduling.jsp?calendarTable=" + calendarTable + "&re_day=" + re_day;
	var popOption = "top=150, left=650, width=910, height=450, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no;";
	window.open(popUrl, "", popOption);
	
}

// alert window
function checkLogin() {
	if (document.loginForm.email.value == "") {
		alert("please insert into Email");
		document.loginForm.firstName.focus();
	} else if (document.loginForm.pw.value == "") {
		alert("please insert into Password");
		document.loginForm.pw.focus();
	} else {
		document.loginForm.submit();
	}
}

function checkWrite() {
	if (document.joinForm.firstName.value == "") {
		alert("please insert into firstname");
		document.joinForm.firstName.focus();
	} else if (document.joinForm.lastName.value == "") {
		alert("please insert into lastname");
		document.joinForm.lastName.focus();

	} else if (document.joinForm.customerEmail.value == "") {
		alert("please insert into E-mail");

	} else if (document.joinForm.customerPwd.value == "") {
		alert("please insert into password");

	} else if (document.joinForm.customerPwd.value !== document.joinForm.repw.value) {
		alert("Passwords do not match");

	} else {
		document.joinForm.submit();
	}
}


function checkModify(){
	if (document.modifyForm.customerPwd.value ==""){
		alert("please insert into password");
		document.modifyForm.customerPwd.focus();
		
	} else if(document.modifyForm.customerPwd.value != document.modifyForm.repw.value){
		alert("Passwords do not match");
		modifyForm.repw.focus();
		
	} else if(document.modifyForm.customerPhone.value.length == ""){
		alert("please insert into phone number");
		modifyForm.customerPhone.focus();
		
	} else if(document.modifyForm.customerAddr.value.length == ""){
		alert("please insert into address");
		modifyForm.customerAddr.focus();
		
	} else {
	document.modifyForm.submit();
	}
}

//function checkMenuWrite() {
//	if (document.box.m_img.value == "") {
//		alert("please insert into image");
//	} else if (document.box.m_name.value == "") {
//		alert("please insert into menu name");
//		document.box.m_name.focus();
//
//	} else if (document.box.m_content.value == "") {
//		alert("please insert into content");
//		document.menuWrite.m_content.focus();
//	} else if (document.box.m_price.value == "") {
//		alert("please insert into price");
//		document.box.m_price.focus();
//	}else {
//		document.box.submit();
//	}
//}

