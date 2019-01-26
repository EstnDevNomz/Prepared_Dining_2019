package com.jsp.pj1.cont;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.pj1.Services.MakeMenuService;
import com.jsp.pj1.Services.MakeScheduleService;
import com.jsp.pj1.Services.MemberInfoService;
import com.jsp.pj1.Services.MenuInfoService;
import com.jsp.pj1.Services.Service;
import com.jsp.pj1.Services.VideoService;

@WebServlet("*.do")
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontCon() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("actionDo");

		String viewPage = null;
		Service service = null;
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		String conPath = request.getContextPath();
		System.out.println(conPath);
		String com = uri.substring(conPath.length());
		System.out.println("com:" + com);	
		
		if(com.equals("/index.do")) {
			service = new MenuInfoService();		
			service.execute(request, response);
			service = new MemberInfoService();
			service.execute(request, response);
			service = new VideoService();
			service.execute(request, response);
			viewPage = "index.jsp";	
			
		}if(com.equals("/admin_index.do")) {
			service = new MenuInfoService();		
			service.execute(request, response);
			service = new MemberInfoService();
			service.execute(request, response);
			viewPage = "admin_index.jsp";	
			
		}else if(com.equals("/menu/write.do")) {
			service = new MakeMenuService();
			service.execute(request, response);
			viewPage = "menuOk.jsp";
			
		}else if(com.equals("/bookup.do")) {		
			//service = new BookUpService();
			//service.execute(request, response);
			viewPage = "reservation/bookupOk.jsp";
			
		}else if(com.equals("/reservation/schedule.do")) {
			service = new MakeScheduleService();
			service.execute(request, response);
			viewPage = "schedulingOk.jsp";	
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		System.out.println("dispatcher : " + dispatcher);		

		} 
	}

	
