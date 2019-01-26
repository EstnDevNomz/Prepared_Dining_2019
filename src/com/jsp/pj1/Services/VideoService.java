package com.jsp.pj1.Services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.pj1.dao.Dao;

public class VideoService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MemberInfoService");
		Dao dao = new Dao();
		String filename = dao.getVideo();
		request.setAttribute("filename", filename);
		System.out.println("filename : " + filename);

	}

}
