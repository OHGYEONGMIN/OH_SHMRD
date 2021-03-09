package boardcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BoardEdit.do")
public class BoardEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		System.out.println(num + " " + title + " " + content);
		// ���� �迭�̳� ����Ʈ�� ���� �ʿ� ����
		request.setAttribute("num", num);
		request.setAttribute("title", title);
		request.setAttribute("content", content);

		System.out.println(num + title + content);
		if (id.equals("admin")) {
			RequestDispatcher rd = request.getRequestDispatcher("admin/AdminNoticeEdit.jsp"); // �Ƿ� = ��ü ���ε�
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("user/UserNoticeEdit.jsp"); // �Ƿ� = ��ü ���ε�
			rd.forward(request, response);
		}
	}

}
