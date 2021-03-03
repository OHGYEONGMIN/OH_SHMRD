package boardcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardpack.smgridDAO;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/BoardInsert.do")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		System.out.println("작성자 : "+name);
		System.out.println("제목 : "+title);
		System.out.println("내용 : "+content);
		
		smgridDAO dao = new smgridDAO();
		int cnt = dao.BoardInsert(name, title, content);
		
		if(cnt!=0) {
			System.out.println("입력 성공");
		}else {
			System.out.println("입력 실패");
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("BoardList.do"); //의뢰 = 객체 바인딩
		rd.forward(request, response);
	}

}
