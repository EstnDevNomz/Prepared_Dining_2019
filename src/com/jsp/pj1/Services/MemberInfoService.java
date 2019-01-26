package com.jsp.pj1.Services;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.pj1.dao.Dao;
import com.jsp.pj1.dto.RDto;

public class MemberInfoService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MemberInfoService");
		Dao dao = new Dao();
		
		// when you access admin account
		ArrayList<RDto> dtos = dao.purchaseList();
		request.setAttribute("plist", dtos);
		System.out.println("plist : " + dtos);

	}

}
