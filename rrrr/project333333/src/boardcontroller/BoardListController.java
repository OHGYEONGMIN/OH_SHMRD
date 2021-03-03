package boardcontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boardpack.boardVO;
import boardpack.smgridDAO;

@WebServlet("/BoardList.do")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		int temp = 0;
		int ten = 1; // 10자리수 전달
		int num = 0; // 현재페이지로 리스트 만들기 위한 변수

		String pnum = request.getParameter("pnum");
		System.out.println("pnum값 = " + pnum);
		if (pnum == null) {
			num = 1;
			pnum = "1";
		} else {

			num = Integer.parseInt(request.getParameter("pnum"));

		}

		smgridDAO dao = new smgridDAO();
		ArrayList<boardVO> vo = new ArrayList<boardVO>();

		// 검색기능

		// 검색 기능 시작
		String category = request.getParameter("category"); // 검색종류
		String title = "title";
		String content = "content";
		String name = "name";

		String search = request.getParameter("search"); // 검색내용
		System.out.println("검색내용 " + search);
		if (category == null) {
			category = "zero";

		} else if (category.equals(title)) {
			category = "title";
			System.out.println("카테고리 바꿔줌");
		} else if (category.equals(content)) {
			category = "content";

		} else if (category.equals(name)) {
			category = "name";

		}

		if (category.equals("zero")) {
			vo = dao.boardList();
			System.out.println("참(null일때)");

		} else {
			vo = dao.searchList(category, search);
			System.out.println("null 아닐때 거짓");
		}

		// vo = dao.boardList();

		// 불러온 vo에서 20개씩 쪼갬
		ArrayList<boardVO> vo1 = new ArrayList();
		System.out.println(vo.size());
		for (int i = (num - 1) * 7; i < (num - 1) * 7 + 7; i++) {

			try {
				vo1.add(vo.get(i));
				// 이렇게 하면 총게시글이 21개 있으므로 2page 만들때 out of bounds 뜸
				// 따라서 try/catch해줌
				// System.out.println("배열 "+i+"번째 들어갔음");

			} catch (Exception e) {
				// System.out.println("배열 "+i+"번째라서 캐치문으로옴");
				for (i = i; i < vo.size(); i++) {
					vo1.add(vo.get(i));
					// System.out.println("캐치문안에서 배열에 담아줌");
				}
				break;
			}
		}

		// 페이징 작업
		request.setAttribute("pnum", num); // 현재페이지
		System.out.println("pnum에 들어간 값 = " + num);
		while (num != 0) {
			num = num / 10;
			temp++;
		}

		for (int i = 1; i < temp; i++) {
			ten = ten * 10;

		}
		System.out.println("ten은 = " + ten);
		System.out.println("temp는 =" + temp);
		request.setAttribute("ten", ten);
		request.setAttribute("cnt", vo.size() / 7 + 1); // 총 페이지
		// request.setAttribute("cnt", 1088); // 총 페이지 실험
		// request.setAttribute("cnt", vo.size()); //총 페이지
		// request.setAttribute("vo1", vo); // was에 잇는 data 저장

		request.setAttribute("vo", vo1); //

		if (id.equals("admin")) {
			RequestDispatcher rd = request.getRequestDispatcher("admin/AdminNotice.jsp"); // 의뢰 = 객체 바인딩
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("user/UserNotice.jsp"); // 의뢰 = 객체 바인딩
			rd.forward(request, response);
		}
//		RequestDispatcher rd = request.getRequestDispatcher("user/UserNotice.jsp"); 
//		rd.forward(request, response);
	}

}
