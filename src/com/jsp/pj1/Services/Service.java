package com.jsp.pj1.Services;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//추상메소드 execute
//인터페이스로 구현하여 각 커맨드에 implements해준다.
public interface Service {
	void execute(HttpServletRequest request, HttpServletResponse response);	//각 커맨드와 연결되며 컨트롤러에서 커맨드에 지시를 하기위해 execute 객체가 호출된다
	
}
