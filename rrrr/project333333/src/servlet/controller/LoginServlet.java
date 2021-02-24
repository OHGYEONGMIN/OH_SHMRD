package servlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ElectricDAO;
import Model.MemberDAO;

@WebServlet("/Login.do")
public class LoginServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
		String id = request.getParameter("loginid");
		String pw = request.getParameter("loginpw");
		
		MemberDAO dao = new MemberDAO();
		boolean succ = dao.login(id, pw);
		
		if(succ) {
			String room = dao.findroom(id);
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("room", room);
			if(id.equals("admin")) {
				response.sendRedirect("admin/AdminTotalPower.jsp");
			}else{
				response.sendRedirect("user/UserTotalPower.jsp");
			}
			
		}else {
			response.sendRedirect("main/MainPage.jsp");
		}
		
	
	}

}
