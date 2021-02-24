package servlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;

@WebServlet("/SelectRoom.do")
public class SelectRoomServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		
		String roomnum = request.getParameter("roomnum");
		String inputroom = roomnum.toString().substring(0, 3);
		
		MemberDAO dao = new MemberDAO();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		
		dao.roomupdate(id,inputroom);
		
		System.out.println(inputroom);
		
	}
	
	
	

}
