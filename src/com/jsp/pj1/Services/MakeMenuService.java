package com.jsp.pj1.Services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jsp.pj1.dao.Dao;


public class MakeMenuService implements Service {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)  {
		System.out.println("in makeMenuService");
		
		String menuImg = request.getParameter("menuImg");
		System.out.println(menuImg);
		String menuName = request.getParameter("menuName");
		System.out.println(menuName);
		String content = request.getParameter("content");
		content = content.replace("\r\n", "<br/>"); //'\r\n' by textarea Change HTML enter
		System.out.println(content);
		String price = request.getParameter("price");
		System.out.println(price);
		
		Dao dao = Dao.getInstance();	//�������� �ʰ� ���⼭ dao�� ����
		dao.insertMenu(menuImg, menuName, content, price);
	}

}
