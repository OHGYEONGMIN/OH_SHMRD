package servlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.MemberDAO;

@WebServlet("/Approve.do")
public class ApproveAjaxServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
	
		//--------------방 허가 --------------------------
		MemberDAO dao = new MemberDAO();
		String accept = request.getParameter("accept");
		String num = request.getParameter("num");
		if(accept.equals("2")) {
			//방 승인
			dao.roomappro(num,accept);
		}else if(accept.equals("0")) {
			//방 취소
			dao.roomreset(num,accept);
		}
		
		response.sendRedirect("admin/AdminApprove.jsp");
	
	}

}
