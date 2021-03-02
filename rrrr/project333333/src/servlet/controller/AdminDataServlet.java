package servlet.controller;

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

@WebServlet("/AdminData.do")
public class AdminDataServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/plain; charset=UTF-8");
		request.setCharacterEncoding("EUC-KR");
		
		barchartCal cal = new barchartCal();
		
		HttpSession session = request.getSession();
		String yy = request.getParameter("yy");
		int mmr = Integer.parseInt(request.getParameter("mm"));
		String mm = cal.month(mmr);
		int ddr = Integer.parseInt(request.getParameter("dd"));
		String dd = cal.weekday(ddr);
		String mma = (String) session.getAttribute("mm");
		
		//방 번호를 배열로 만들기
		String[] roomnum = {"101","102","103","201","202","203","301","302","303"};
		
		//관리자 보는 방마다 당일 사용 전기량(파이그래프 용)
		ElectricDAO dao = new ElectricDAO();
		ArrayList<String> monthview101 = dao.wh_month_room1(roomnum[0],mma);
		ArrayList<String> monthview102 = dao.wh_month_room2(roomnum[1],mma);
		ArrayList<String> monthview103 = dao.wh_month_room3(roomnum[2],mma);
		ArrayList<String> monthview201 = dao.wh_month_room1(roomnum[3],mma);
		ArrayList<String> monthview202 = dao.wh_month_room2(roomnum[4],mma);
		ArrayList<String> monthview203 = dao.wh_month_room3(roomnum[5],mma);
		ArrayList<String> monthview301 = dao.wh_month_room1(roomnum[6],mma);
		ArrayList<String> monthview302 = dao.wh_month_room2(roomnum[7],mma);
		ArrayList<String> monthview303 = dao.wh_month_room3(roomnum[8],mma);
		
		
		// 101~303까지 전체 사용량
		int[] sumview = new int[9];
		for(int i = 0; i<monthview101.size(); i++){
			int a = Integer.parseInt(monthview101.get(i));
			sumview[0] += a;
		}
		for(int i = 0; i<monthview102.size(); i++){
			int a = Integer.parseInt(monthview102.get(i));
			sumview[1] += a;
		}
		for(int i = 0; i<monthview103.size(); i++){
			int a = Integer.parseInt(monthview103.get(i));
			sumview[2] += a;
		}
		for(int i = 0; i<monthview201.size(); i++){
			int a = Integer.parseInt(monthview201.get(i));
			sumview[3] += a;
		}
		for(int i = 0; i<monthview202.size(); i++){
			int a = Integer.parseInt(monthview202.get(i));
			sumview[4] += a;
		}
		for(int i = 0; i<monthview203.size(); i++){
			int a = Integer.parseInt(monthview203.get(i));
			sumview[5] += a;
		}
		for(int i = 0; i<monthview301.size(); i++){
			int a = Integer.parseInt(monthview301.get(i));
			sumview[6] += a;
		}
		for(int i = 0; i<monthview302.size(); i++){
			int a = Integer.parseInt(monthview302.get(i));
			sumview[7] += a;
		}
		for(int i = 0; i<monthview303.size(); i++){
			int a = Integer.parseInt(monthview303.get(i));
			sumview[8] += a;
		}
		
		int sum100 = sumview[0]+sumview[1]+sumview[2];
		int sum200 = sumview[3]+sumview[4]+sumview[5];
		int sum300 = sumview[6]+sumview[7]+sumview[8];
		
		
		PrintWriter out = response.getWriter();
		JsonObject jsonObject = new JsonObject();
		
		jsonObject.addProperty("sum100", sum100);
		jsonObject.addProperty("sum200", sum200);
		jsonObject.addProperty("sum300", sum300);
		
		for (int j = 0; j < sumview.length; j++) {
			
			jsonObject.addProperty("view"+j, sumview[j]);
		}
		
		out.print(jsonObject);
		
		
	}

}
