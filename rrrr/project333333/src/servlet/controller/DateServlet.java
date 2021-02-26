package servlet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.ElectricDAO;

@WebServlet("/Date.do")
public class DateServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/plain; charset=UTF-8");
		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		String room = (String) session.getAttribute("room");
		String yy = request.getParameter("yy");
		int mmr = Integer.parseInt(request.getParameter("mm"));
		String mm ="";
		
		if (mmr < 9) {
			mm = "0" + Integer.toString(mmr);
		} else {
			mm = Integer.toString(mmr);
		}
		String dd = request.getParameter("dd");
		System.out.println("Room = " + room);
		System.out.println("yy = "+yy);
		System.out.println("mm = "+mm);
		System.out.println("dd = "+dd);
		
		
		
		ElectricDAO dao = new ElectricDAO();
		String LAD = dao.wh_item_LAD(room, yy, mm, dd);
		String LBD = dao.wh_item_LBD(room, yy, mm, dd);
		String LCD = dao.wh_item_LCD(room, yy, mm, dd);
		System.out.println("LAD ="+LAD);
		System.out.println("LBD ="+LBD);
		System.out.println("LCD ="+LCD);
		
		
		
		
//		ElectricDAO dao = new ElectricDAO();
		// 뭘해야되나 yy,mm,dd값이 db에 있는 날짜 값을 꺼내 와야한다
		// 날짜에 따른 그래프값을 만들꺼야!
		
		
		
		
		
		
		
	}
}
