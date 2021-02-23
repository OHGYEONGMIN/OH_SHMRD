package servlet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MemberDAO;
import Model.MemberVO;


@WebServlet("/member.do")
public class memberservlet extends HttpServlet {
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String mail = request.getParameter("email");
		String room = request.getParameter("room");
		
		MemberVO vo = new MemberVO(id, pw, name, sex, tel, addr, mail, room);
		MemberDAO dao = new MemberDAO();
		dao.insert(vo);
		
		
		
	}

}
