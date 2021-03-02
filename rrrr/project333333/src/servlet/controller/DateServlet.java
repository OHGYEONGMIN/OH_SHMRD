package servlet.controller;

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import CalculationE.barchartCal;
import Model.ElectricDAO;

@WebServlet("/Date.do")
public class DateServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/plain; charset=UTF-8");
		request.setCharacterEncoding("EUC-KR");
		barchartCal cal = new barchartCal();
		
		HttpSession session = request.getSession();
		String room = (String) session.getAttribute("room");
		String yy = request.getParameter("yy");
		int mmr = Integer.parseInt(request.getParameter("mm"));
		String mm = cal.month(mmr);
		int ddr = Integer.parseInt(request.getParameter("dd"));
		String dd = cal.weekday(ddr);
//		System.out.println("Room = " + room);
//		System.out.println("yy = "+yy);
//		System.out.println("mm = "+mm);
//		System.out.println("dd = "+dd);
		//각각 하루에 각각 기기마다의 전기사용량
		ElectricDAO dao = new ElectricDAO();
		String LAD = dao.wh_item_LAD(room, yy, mm, dd);
		String LBD = dao.wh_item_LBD(room, yy, mm, dd);
		String LCD = dao.wh_item_LCD(room, yy, mm, dd);
//		System.out.println("LAD ="+LAD);
//		System.out.println("LBD ="+LBD);
//		System.out.println("LCD ="+LCD);
		
		//주간 전체 사용량!!
		//해야할것 이 스트링값들을 가공해서 아래 DAO에 넣어야함!! 
		//9보다 작을 경우 0을 붙이는 작업해야댐!!
		
		
		
		//날짜를 클릭 날짜부터 -3일~+3일까지 빼옴
		String[] weekbar = new String[7];
		
		for (int i = 0; i < weekbar.length; i++) {
			weekbar[i] = cal.barchartlist(ddr).get(i);
		}
		
//		for (int i = 0; i < weekbar.length; i++) {
//			System.out.println("weekbar : "+ weekbar[i]);
//		}
		
		
		ArrayList<String> mm3 = dao.wh_week(room, yy, mm, weekbar[0]);
		ArrayList<String> mm2 = dao.wh_week(room, yy, mm, weekbar[1]);
		ArrayList<String> mm1 = dao.wh_week(room, yy, mm, weekbar[2]);
		ArrayList<String> mm0 = dao.wh_week(room, yy, mm, weekbar[3]);
		ArrayList<String> pp1 = dao.wh_week(room, yy, mm, weekbar[4]);
		ArrayList<String> pp2 = dao.wh_week(room, yy, mm, weekbar[5]);
		ArrayList<String> pp3 = dao.wh_week(room, yy, mm, weekbar[6]);
		
		
			
			
		
		int sum[] = new int[7];
		
		for (int i = 0; i < mm3.size(); i++) {
			int a = Integer.parseInt(mm3.get(i));
			sum[0] += a;
		}
		for (int i = 0; i < mm2.size(); i++) {
			int a = Integer.parseInt(mm2.get(i));
			sum[1] += a;
		}
		for (int i = 0; i < mm1.size(); i++) {
			int a = Integer.parseInt(mm1.get(i));
			sum[2] += a;
		}
		for (int i = 0; i < mm0.size(); i++) {
			int a = Integer.parseInt(mm0.get(i));
			sum[3] += a;
		}
		for (int i = 0; i < pp1.size(); i++) {
			int a = Integer.parseInt(pp1.get(i));
			sum[4] += a;
		}
		for (int i = 0; i < pp2.size(); i++) {
			int a = Integer.parseInt(pp2.get(i));
			sum[5] += a;
		}
		for (int i = 0; i < pp3.size(); i++) {
			int a = Integer.parseInt(pp3.get(i));
			sum[6] += a;
		}
		
//		//확인
//		for (int i = 0; i < sum.length; i++) {
//			System.out.println(ddr-3+i+"일 : "+sum[i] );
//			
//		}
//		//확인완료(2.27)
		
		
		// 1주일 -3,+3일 정리 해야함!!
		PrintWriter out = response.getWriter();
		JsonObject jsonObject = new JsonObject();
		jsonObject.addProperty("LAD", LAD);
		jsonObject.addProperty("LBD", LBD);
		jsonObject.addProperty("LCD", LCD);
		for (int i = 0; i < sum.length; i++) {
			jsonObject.addProperty("dm"+i, sum[i]);
			
		}
		out.print(jsonObject);
	}
}
