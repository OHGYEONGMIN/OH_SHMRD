package servlet.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;

@WebServlet("/InsertRoom.do")
public class InsertRoomServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		
		String roomnum = request.getParameter("roomnum");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberDAO dao = new MemberDAO();
		
		
		//--------------πÊΩ≈√ª-------------------
		int Insertroom = dao.roomupdate(id, roomnum);
		PrintWriter out = response.getWriter();
		out.print(Insertroom);
		
		
		
	}

}
