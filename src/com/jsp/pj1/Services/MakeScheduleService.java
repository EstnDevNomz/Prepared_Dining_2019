package com.jsp.pj1.Services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.pj1.dao.Dao;

public class MakeScheduleService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MakeScheduleService");
		
		String table = request.getParameter("calendarTable");
		System.out.println(table);
		String day = request.getParameter("calendarDay");
		System.out.println(day);
		String time = request.getParameter("calendarTime");
		System.out.println(time);
		
		Dao dao = Dao.getInstance();
		dao.schedule(table, day, time);

	}

}
