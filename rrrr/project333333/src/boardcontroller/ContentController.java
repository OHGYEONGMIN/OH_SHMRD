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

import com.google.gson.Gson;

import boardpack.CommentVO;
import boardpack.boardVO;
import boardpack.smgridDAO;

/**
 * Servlet implementation class ContentController
 */
@WebServlet("/Content.do")
public class ContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String num = request.getParameter("num");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		smgridDAO dao = new smgridDAO();
		// 조회수 증가시켜주기
		dao.updateClick(num);
		//게시물 내용 가져오기
		boardVO vo = dao.ContentList(num);
		request.setAttribute("vo", vo); 
		System.out.println(vo.toString());
		System.out.println(vo.getContent());
//		ArrayList<CommentVO> vo1 = dao.CommentList(num); 
//		request.setAttribute("vo1", vo1); 
//		
//		 Gson gson = new Gson();
//		 String list1 = gson.toJson(vo1);
//		 System.out.println(list1);
//		
		if (id.equals("admin")) {
			RequestDispatcher rd = request.getRequestDispatcher("admin/AdminNotice.jsp"); // 의뢰 = 객체 바인딩
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("user/UserNotice.jsp"); // 의뢰 = 객체 바인딩
			rd.forward(request, response);
		}
	}

}
