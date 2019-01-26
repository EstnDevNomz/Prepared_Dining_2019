<%@page import="com.jsp.pj1.dto.Dto"%>
<%@page import="com.jsp.pj1.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>	
<%
	if(session.getAttribute("ValidMem") == null){
		
	}else{

		//preparences administer account
    	String email = (String) session.getAttribute("email");
    	String t_index = request.getParameter("t_index");
    	String menuname = request.getParameter("menuname");
    	String payerdistance = request.getParameter("distance");
    	String reserved_wmy = request.getParameter("reserved_wmy");
    	String reserved_day = request.getParameter("reserved_day");
    	String reserved_time = request.getParameter("reserved_time");
    	
    	String creditCardFirm = request.getParameter("creditCardFirm");
    	String cdn = request.getParameter("cdn");
    	String customer_name = request.getParameter("customer_name");
    	String inval = request.getParameter("inval");
    	String cvc = request.getParameter("cvc");
    	String phone = request.getParameter("phone");
    	String installment = request.getParameter("installment");
    	String withdraw = request.getParameter("withdraw");
    	
    	Dao dao = Dao.getInstance();
    	Dto dto = dao.getCustomer(email);
    	
    	String sessionDistance = null;
    	String serverDistance = null;
    	sessionDistance = (String)session.getAttribute("userDistance");
    	serverDistance = dao.confirmDistance(dto.getCustomerEmail()).getCustomerDistanceInfo();
    	
    	log("serverDistance:  " + serverDistance);
    	log("sessionDistance:  " + sessionDistance);
    	log("serverDistance:  " + serverDistance);
    	
    	%>
		<script type="text/javascript">			
			// confirm window for payer certification
			var con_test = confirm('From now on, we will collect and verify '
					+ 'location information stored in the database, '
					+ ' location information stored in the session, '
					+ 'and payer location information.');
			if(con_test == true){
			  
			}
			else if(con_test == false){
				history.go(-1);
			}
		</script>
		<%
    	
    	if (!payerdistance.equals(sessionDistance) || !payerdistance.equals(serverDistance)) {
    		
    	%>
    		<script type="text/javascript">
    			alert('Fail : Compared your location information' 
    					+ ' with location information in server,' 
    					+ 'As a result did not match!');
    			setTimeout('',100000);
    			history.go(-1);
    		</script>
    	<%
    		
    	}else if (payerdistance.equals(sessionDistance) && payerdistance.equals(serverDistance)) {
    		// confirm Credit information
    		int ri = dao.confirmCdn(cdn);
    		log("cdn ri = " + ri);
    		ri += dao.confirmInval(inval);
    		log("cdn ri = " + ri);
    		ri += dao.confirmCvc(cvc);
    		log("cdn ri = " + ri);
    		
    		if( ri != 3) {
    	%>
	    		<script language="javascript">
					alert("Fail : Not exist credit card informaion.");
					setTimeout('',100000);
					history.go(-1);
				</script>
    	<%		
    			
    		}else{
    	
    	%>
	    		<script language="javascript">					
				// confirm window for about whether to proceed with book up;
					var con_test = confirm('Success : Your location, credit information' 
										+ 'has been verified. Do you want to continue?');
					if(con_test == true){
					  
					}
					else if(con_test == false){
						history.go(-1);
					}
				</script>
    	<%	
    		
	     	ri = 0;
	     	
	     	ri = dao.bookup(t_index, email, menuname, withdraw, payerdistance, reserved_wmy, 
	     			reserved_day, reserved_time, creditCardFirm, cdn,  customer_name, 
	     			inval, cvc, phone, installment, withdraw);
	     	log("bookupOk ri : " + ri);
        	
     	  	if(ri == 2){
    	%>
				<script type="text/javascript">
					alert("completed bookup.");
					history.go(-1);
					
					var popUrl = "payment/complet_payment.jsp";
					var popOption = "top=150, left=650, width=580, height=400, resizable=no, menubar=no, location=no, directoryies=no, resizable=no, toolbar=no, scrollbars=no, status=no;";
					window.open(popUrl, "", popOption);
				</script>
    	<%		
			}else{
    	%>	
				<script type="text/javascript">
				alert("Failed bookup.");
				history.go(-1);
				</script>
    	<%
			}
		}
	}
}
    	%> 
