package com.jsp.pj1.Services;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jsp.pj1.dao.Dao;
import com.jsp.pj1.dto.CDto;
import com.jsp.pj1.dto.MDto;
import com.jsp.pj1.dto.RDto;

public class MenuInfoService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	System.out.println("MenuInfoService");
		Dao dao = new Dao();
		//make menu information list
		ArrayList<MDto> dtos = dao.menuInfo();
		request.setAttribute("list", dtos);
		System.out.println("list : " + dtos);
		
		//make calendar information list
		
		//// Table No.1 today ~ sixth all time
		ArrayList<CDto> today = dao.t1_today_calendar();
		request.setAttribute("t1_today_calendar", today);
		System.out.println("t1_today_calendar : " + today);
		
		ArrayList<CDto> manana = dao.t1_manana_calendar();
		request.setAttribute("t1_manana_calendar", manana);
		System.out.println("t1_manana_calendar : " + manana);
		
		ArrayList<CDto> third = dao.t1_third_calendar();
		request.setAttribute("t1_third_calendar", third);
		System.out.println("t1_third_calendar : " + third);
		
		ArrayList<CDto> fourth = dao.t1_fourth_calendar();
		request.setAttribute("t1_fourth_calendar", fourth);
		System.out.println("t1_fourth_calendar : " + fourth);
		
		ArrayList<CDto> fifth = dao.t1_fifth_calendar();
		request.setAttribute("t1_fifth_calendar", fifth);
		System.out.println("t1_fifth_calendar : " + fifth);
		
		ArrayList<CDto> sixth = dao.t1_sixth_calendar();
		request.setAttribute("t1_sixth_calendar", sixth);
		System.out.println("t1_sixth_calendar : " + sixth);
		
		// Table No.2 today ~ sixth all time
		ArrayList<CDto> today2 = dao.t2_today_calendar();
		request.setAttribute("t2_today_calendar", today2);
		System.out.println("t2_today_calendar : " + today2);
		
		ArrayList<CDto> manana2 = dao.t2_manana_calendar();
		request.setAttribute("t2_manana_calendar", manana2);
		System.out.println("t2_manana_calendar : " + manana2);
		
		ArrayList<CDto> third2 = dao.t2_third_calendar();
		request.setAttribute("t2_third_calendar", third2);
		System.out.println("t2_third_calendar : " + third2);
		
		ArrayList<CDto> fourth2 = dao.t2_fourth_calendar();
		request.setAttribute("t2_fourth_calendar", fourth2);
		System.out.println("t2_fourth_calendar : " + fourth2);
		
		ArrayList<CDto> fifth2 = dao.t2_fifth_calendar();
		request.setAttribute("t2_fifth_calendar", fifth2);
		System.out.println("t2_fifth_calendar : " + fifth2);
		
		ArrayList<CDto> sixth2 = dao.t2_sixth_calendar();
		request.setAttribute("t2_sixth_calendar", sixth2);
		System.out.println("t2_sixth_calendar : " + sixth2);
		
		// Table No.3 today ~ sixth all time
		ArrayList<CDto> today3 = dao.t3_today_calendar();
		request.setAttribute("t3_today_calendar", today3);
		System.out.println("t3_today_calendar : " + today3);
		
		ArrayList<CDto> manana3 = dao.t3_manana_calendar();
		request.setAttribute("t3_manana_calendar", manana3);
		System.out.println("t3_manana_calendar : " + manana3);
		
		ArrayList<CDto> third3 = dao.t3_third_calendar();
		request.setAttribute("t3_third_calendar", third3);
		System.out.println("t3_third_calendar : " + third3);
		
		ArrayList<CDto> fourth3 = dao.t3_fourth_calendar();
		request.setAttribute("t3_fourth_calendar", fourth3);
		System.out.println("t3_fourth_calendar : " + fourth3);
		
		ArrayList<CDto> fifth3 = dao.t3_fifth_calendar();
		request.setAttribute("t3_fifth_calendar", fifth3);
		System.out.println("t3_fifth_calendar : " + fifth3);
		
		ArrayList<CDto> sixth3 = dao.t3_sixth_calendar();
		request.setAttribute("t3_sixth_calendar", sixth3);
		System.out.println("t3_sixth_calendar : " + sixth3);
		
		// Table No.4 today ~ sixth all time
		ArrayList<CDto> today4 = dao.t4_today_calendar();
		request.setAttribute("t4_today_calendar", today4);
		System.out.println("t4_today_calendar : " + today4);
		
		ArrayList<CDto> manana4 = dao.t4_manana_calendar();
		request.setAttribute("t4_manana_calendar", manana4);
		System.out.println("t4_manana_calendar : " + manana4);
		
		ArrayList<CDto> third4 = dao.t4_third_calendar();
		request.setAttribute("t4_third_calendar", third4);
		System.out.println("t4_third_calendar : " + third4);
		
		ArrayList<CDto> fourth4 = dao.t4_fourth_calendar();
		request.setAttribute("t4_fourth_calendar", fourth4);
		System.out.println("t4_fourth_calendar : " + fourth4);
		
		ArrayList<CDto> fifth4 = dao.t4_fifth_calendar();
		request.setAttribute("t4_fifth_calendar", fifth4);
		System.out.println("t4_fifth_calendar : " + fifth4);
		
		ArrayList<CDto> sixth4 = dao.t4_sixth_calendar();
		request.setAttribute("t4_sixth_calendar", sixth4);
		System.out.println("t4_sixth_calendar : " + sixth4);
		
		// Table No.5 today ~ sixth all time
		ArrayList<CDto> today5 = dao.t5_today_calendar();
		request.setAttribute("t5_today_calendar", today5);
		System.out.println("t5_today_calendar : " + today5);
		
		ArrayList<CDto> manana5 = dao.t5_manana_calendar();
		request.setAttribute("t5_manana_calendar", manana5);
		System.out.println("t5_manana_calendar : " + manana5);
		
		ArrayList<CDto> third5 = dao.t5_third_calendar();
		request.setAttribute("t5_third_calendar", third5);
		System.out.println("t5_third_calendar : " + third5);
		
		ArrayList<CDto> fourth5 = dao.t5_fourth_calendar();
		request.setAttribute("t5_fourth_calendar", fourth5);
		System.out.println("t5_fourth_calendar : " + fourth5);
		
		ArrayList<CDto> fifth5 = dao.t5_fifth_calendar();
		request.setAttribute("t5_fifth_calendar", fifth5);
		System.out.println("t5_fifth_calendar : " + fifth5);
		
		ArrayList<CDto> sixth5 = dao.t5_sixth_calendar();
		request.setAttribute("t5_sixth_calendar", sixth5);
		System.out.println("t5_sixth_calendar : " + sixth5);
		
		// Table No.6 today ~ sixth all time
		ArrayList<CDto> today6 = dao.t6_today_calendar();
		request.setAttribute("t6_today_calendar", today6);
		System.out.println("t6_today_calendar : " + today6);
		
		ArrayList<CDto> manana6 = dao.t6_manana_calendar();
		request.setAttribute("t6_manana_calendar", manana6);
		System.out.println("t6_manana_calendar : " + manana6);
		
		ArrayList<CDto> third6 = dao.t6_third_calendar();
		request.setAttribute("t6_third_calendar", third6);
		System.out.println("t6_third_calendar : " + third6);
		
		ArrayList<CDto> fourth6 = dao.t6_fourth_calendar();
		request.setAttribute("t6_fourth_calendar", fourth6);
		System.out.println("t6_fourth_calendar : " + fourth6);
		
		ArrayList<CDto> fifth6 = dao.t6_fifth_calendar();
		request.setAttribute("t6_fifth_calendar", fifth6);
		System.out.println("t6_fifth_calendar : " + fifth6);
		
		ArrayList<CDto> sixth6 = dao.t6_sixth_calendar();
		request.setAttribute("t6_sixth_calendar", sixth6);
		System.out.println("t6_sixth_calendar : " + sixth6);
		
		// Table No.7 today ~ sixth all time
		ArrayList<CDto> today7 = dao.t7_today_calendar();
		request.setAttribute("t7_today_calendar", today7);
		System.out.println("t7_today_calendar : " + today7);
		
		ArrayList<CDto> manana7 = dao.t7_manana_calendar();
		request.setAttribute("t7_manana_calendar", manana7);
		System.out.println("t7_manana_calendar : " + manana7);
		
		ArrayList<CDto> third7 = dao.t7_third_calendar();
		request.setAttribute("t7_third_calendar", third7);
		System.out.println("t7_third_calendar : " + third7);
		
		ArrayList<CDto> fourth7 = dao.t7_fourth_calendar();
		request.setAttribute("t7_fourth_calendar", fourth7);
		System.out.println("t7_fourth_calendar : " + fourth7);
		
		ArrayList<CDto> fifth7 = dao.t7_fifth_calendar();
		request.setAttribute("t7_fifth_calendar", fifth7);
		System.out.println("t7_fifth_calendar : " + fifth7);
		
		ArrayList<CDto> sixth7 = dao.t7_sixth_calendar();
		request.setAttribute("t7_sixth_calendar", sixth7);
		System.out.println("t7_sixth_calendar : " + sixth7);
		
		// Table No.8 today ~ sixth all time
		ArrayList<CDto> today8 = dao.t8_today_calendar();
		request.setAttribute("t8_today_calendar", today8);
		System.out.println("t8_today_calendar : " + today8);
		
		ArrayList<CDto> manana8 = dao.t8_manana_calendar();
		request.setAttribute("t8_manana_calendar", manana8);
		System.out.println("t8_manana_calendar : " + manana8);
		
		ArrayList<CDto> third8 = dao.t8_third_calendar();
		request.setAttribute("t8_third_calendar", third8);
		System.out.println("t8_third_calendar : " + third8);
		
		ArrayList<CDto> fourth8 = dao.t8_fourth_calendar();
		request.setAttribute("t8_fourth_calendar", fourth8);
		System.out.println("t8_fourth_calendar : " + fourth8);
		
		ArrayList<CDto> fifth8 = dao.t8_fifth_calendar();
		request.setAttribute("t8_fifth_calendar", fifth8);
		System.out.println("t8_fifth_calendar : " + fifth8);
		
		ArrayList<CDto> sixth8 = dao.t8_sixth_calendar();
		request.setAttribute("t8_sixth_calendar", sixth8);
		System.out.println("t8_sixth_calendar : " + sixth8);
		
		// Table No.9 today ~ sixth all time
		ArrayList<CDto> today9 = dao.t9_today_calendar();
		request.setAttribute("t9_today_calendar", today9);
		System.out.println("t9_today_calendar : " + today9);
		
		ArrayList<CDto> manana9 = dao.t9_manana_calendar();
		request.setAttribute("t9_manana_calendar", manana9);
		System.out.println("t9_manana_calendar : " + manana9);
		
		ArrayList<CDto> third9 = dao.t9_third_calendar();
		request.setAttribute("t9_third_calendar", third9);
		System.out.println("t9_third_calendar : " + third9);
		
		ArrayList<CDto> fourth9 = dao.t9_fourth_calendar();
		request.setAttribute("t9_fourth_calendar", fourth9);
		System.out.println("t9_fourth_calendar : " + fourth9);
		
		ArrayList<CDto> fifth9 = dao.t9_fifth_calendar();
		request.setAttribute("t9_fifth_calendar", fifth9);
		System.out.println("t9_fifth_calendar : " + fifth9);
		
		ArrayList<CDto> sixth9 = dao.t9_sixth_calendar();
		request.setAttribute("t9_sixth_calendar", sixth9);
		System.out.println("t9_sixth_calendar : " + sixth9);
		
		
		// is exist reserved time
		
		String reserved_Time = request.getParameter("reserved_Time");
		int re = dao.existTable(reserved_Time);
		System.out.println("reserved_Time"+ reserved_Time);		
		request.setAttribute("reserved_Time", re);


	}

}
