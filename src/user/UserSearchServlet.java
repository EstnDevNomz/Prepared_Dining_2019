package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.com")
public class UserSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		
		
		String uri = request.getRequestURI();
		System.out.println(uri);
		String conPath = request.getContextPath();
		System.out.println(conPath);
		String com = uri.substring(conPath.length());
		System.out.println("com:" + com);	
		
		//service�������� �� ������ �б��ϰ� ���⼭ DAO �۾��� �� �ϴ� ���� �ƴ϶�
		if(com.equals("/insertVideo.com")) {
			String filename = request.getParameter("filename");
			getInputVideo(filename);
		}else if(com.equals("/index.com")) {
			String keyword = request.getParameter("keyword");
			response.getWriter().write(getJSON(keyword));
		}else if(com.equals("/cancel.com")) {
			String bseq = request.getParameter("bseq");
			response.getWriter().write(getCancel(bseq));
			
		}else if(com.equals("/deleteMenu.com")) {
			System.out.println("servlete deletemenu");
			String menuname = request.getParameter("menuname");
			getDeleteMenu(menuname);
			
		}else if(com.equals("/deleteCalendar.com")) {
			String table = request.getParameter("table");
			String time = request.getParameter("time");
			String day = request.getParameter("day");
			System.out.println("table : " + table);
			getDeleteToday(table, time, day);
		}
	}


	private void getInputVideo(String filename) {
		System.out.println("filename : " + filename);
		if(filename == null) filename = "";
		AjaxDAO ajaxDAO = new AjaxDAO();
		ajaxDAO.insertVideo(filename);
	}


	private void getDeleteToday(String table, String time, String day) {
		System.out.println("getDeleteToday table : " + table);
		if(time == null) time = "";
		AjaxDAO ajaxDAO = new AjaxDAO();
		ajaxDAO.deleteToday(table, time, day);
		
	}

	public void getDeleteMenu(String menuname) {
		System.out.println("getdeletemenu : " + menuname);
		if(menuname == null) menuname = "";
		AjaxDAO ajaxDAO = new AjaxDAO();
		ajaxDAO.deleteMenu(menuname);
	}
	
	// Delete Reservation
	public String getCancel(String bseq) {
		if(bseq == null) bseq = "";
		String result = null;
		
		AjaxDAO ajaxDAO = new AjaxDAO();
		ajaxDAO.cancel(bseq);
		
		return result;
	}

	//제이슨으로 변환
	public String getJSON(String keyword) {
		
		if(keyword == null) keyword = "";
		StringBuffer result = new StringBuffer("");
		
		result.append("{\"result\":[");
		
		AjaxDAO ajaxDAO = new AjaxDAO();
		ArrayList<PGHistoyDto> userList = ajaxDAO.search(keyword);
		System.out.println(userList);
		
		for(int i=0; i < userList.size(); i++) {
			result.append("[{\"value\": \"" + userList.get(i).getPaymentDate() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getEmail() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getPhone() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getWithdraw() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getCard() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getCdn() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getName() + "\"},");
			result.append("{\"value\": \"" + userList.get(i).getIntallment() + "\"}],");
			
		}
		
		result.append("]}");
		System.out.println(result);
		return result.toString();
	}

}
