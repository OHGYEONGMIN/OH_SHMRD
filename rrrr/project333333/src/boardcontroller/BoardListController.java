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
		int ten = 1; // 10�ڸ��� ����
		int num = 0; // ������������ ����Ʈ ����� ���� ����

		String pnum = request.getParameter("pnum");
		System.out.println("pnum�� = " + pnum);
		if (pnum == null) {
			num = 1;
			pnum = "1";
		} else {

			num = Integer.parseInt(request.getParameter("pnum"));

		}

		smgridDAO dao = new smgridDAO();
		ArrayList<boardVO> vo = new ArrayList<boardVO>();

		// �˻����

		// �˻� ��� ����
		String category = request.getParameter("category"); // �˻�����
		String title = "title";
		String content = "content";
		String name = "name";

		String search = request.getParameter("search"); // �˻�����
		System.out.println("�˻����� " + search);
		if (category == null) {
			category = "zero";

		} else if (category.equals(title)) {
			category = "title";
			System.out.println("ī�װ� �ٲ���");
		} else if (category.equals(content)) {
			category = "content";

		} else if (category.equals(name)) {
			category = "name";

		}

		if (category.equals("zero")) {
			vo = dao.boardList();
			System.out.println("��(null�϶�)");

		} else {
			vo = dao.searchList(category, search);
			System.out.println("null �ƴҶ� ����");
		}

		// vo = dao.boardList();

		// �ҷ��� vo���� 20���� �ɰ�
		ArrayList<boardVO> vo1 = new ArrayList();
		System.out.println(vo.size());
		for (int i = (num - 1) * 7; i < (num - 1) * 7 + 7; i++) {

			try {
				vo1.add(vo.get(i));
				// �̷��� �ϸ� �ѰԽñ��� 21�� �����Ƿ� 2page ���鶧 out of bounds ��
				// ���� try/catch����
				// System.out.println("�迭 "+i+"��° ����");

			} catch (Exception e) {
				// System.out.println("�迭 "+i+"��°�� ĳġ�����ο�");
				for (i = i; i < vo.size(); i++) {
					vo1.add(vo.get(i));
					// System.out.println("ĳġ���ȿ��� �迭�� �����");
				}
				break;
			}
		}

		// ����¡ �۾�
		request.setAttribute("pnum", num); // ����������
		System.out.println("pnum�� �� �� = " + num);
		while (num != 0) {
			num = num / 10;
			temp++;
		}

		for (int i = 1; i < temp; i++) {
			ten = ten * 10;

		}
		System.out.println("ten�� = " + ten);
		System.out.println("temp�� =" + temp);
		request.setAttribute("ten", ten);
		request.setAttribute("cnt", vo.size() / 7 + 1); // �� ������
		// request.setAttribute("cnt", 1088); // �� ������ ����
		// request.setAttribute("cnt", vo.size()); //�� ������
		// request.setAttribute("vo1", vo); // was�� �մ� data ����

		request.setAttribute("vo", vo1); //

		if (id.equals("admin")) {
			RequestDispatcher rd = request.getRequestDispatcher("admin/AdminNotice.jsp"); // �Ƿ� = ��ü ���ε�
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("user/UserNotice.jsp"); // �Ƿ� = ��ü ���ε�
			rd.forward(request, response);
		}
//		RequestDispatcher rd = request.getRequestDispatcher("user/UserNotice.jsp"); 
//		rd.forward(request, response);
	}

}
