package com.jsp.pj1.Services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.pj1.dao.Dao;

public class BookUpService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in BookUpService");
		
		String t_index = request.getParameter("t_index");
		System.out.println(t_index);
		String email = request.getParameter("email");
		System.out.println(email);
		String menuname = request.getParameter("menuname");
		System.out.println(menuname);
		String withdraw = request.getParameter("withdraw");
		System.out.println(withdraw);
		String distance = request.getParameter("distance");
		System.out.println(distance);
		String reserved_wmy = request.getParameter("reserved_wmy");
		System.out.println(reserved_wmy);
		String reserved_day = request.getParameter("reserved_day");		
		System.out.println(reserved_day);
		String reserved_time = request.getParameter("reserved_time");
		System.out.println(reserved_time);
		
		
		System.out.println("in PaymentService");
		String creditCardFirm = request.getParameter("creditCardFirm");
			System.out.println("creditCardFirm : " + creditCardFirm);
		String cdn = request.getParameter("cardNumber");
			System.out.println("cardNumber : " + cdn);
		String customer_name = request.getParameter("customer_name");
			System.out.println("cumtomer_name : " + customer_name);
		String inval = request.getParameter("inval");
			System.out.println("inval : " + inval);
		String cvc = request.getParameter("cvc");
			System.out.println("cvc : " + cvc);
		String phone = request.getParameter("phone");
			System.out.println("phone :" + phone);
		String installment = request.getParameter("installment");
			System.out.println("installment : " + installment);
		String p_withdraw = request.getParameter("withdraw");
		
			if(distance == null) {
				distance = "0";
			}else if(withdraw == null) {
				withdraw = "0";
			}
		
			System.out.println("distance : " + distance);
			System.out.println("withdraw : " + withdraw);
		
		Dao dao = Dao.getInstance();	//�������� �ʰ� ���⼭ dao�� ����
		dao.bookup(t_index, email, menuname, withdraw, distance, 
								reserved_wmy, reserved_day, reserved_time, creditCardFirm, 
								cdn,  customer_name, inval, cvc, phone, installment, p_withdraw);
	}

}

