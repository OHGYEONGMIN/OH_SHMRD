package boardcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardpack.smgridDAO;

@WebServlet("/BoardEdit2.do")
public class BoardEditController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	      response.setContentType("text/html; charset=UTF-8");
	      String num = request.getParameter("num");
	      String title = request.getParameter("title");
	      String content = request.getParameter("content");
	      smgridDAO dao = new smgridDAO();
	      int cnt= dao.BoardEdit(num,title, content);
	      
	      RequestDispatcher rd = request.getRequestDispatcher("BoardList.do"); //ÀÇ·Ú = °´Ã¼ ¹ÙÀÎµù
			rd.forward(request, response);
	}

}
