package servlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CalDate.do")
public class CalDateAjax extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/plain; charset=UTF-8");
		request.setCharacterEncoding("EUC-KR");
		
		String mm = request.getParameter("nm");
		
		HttpSession session = request.getSession();
		session.setAttribute("mm", mm);
		System.out.println(mm);
	}

}
