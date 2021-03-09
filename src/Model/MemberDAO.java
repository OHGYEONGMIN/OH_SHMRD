package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	Connection conn;
	PreparedStatement pst;
	ResultSet rs;

	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "hr";
			String pw = "hr";

			conn = DriverManager.getConnection(url, id, pw);
			if (conn != null) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// ---------------------- ���̵� �ߺ� üũ -------------------------
	public int check(MemberVO vo) {

		return 0;

	}
	// ---------------------- ���̵� �ߺ� üũ -------------------------
	// -----------------------------ȸ�� ���� ----------------------------

	public int insert(MemberVO vo) {
		connect();
		String sql = "insert into member(no,id,pw,name,sex,tel,addr,mail) values(no.nextval,?,?,?,?,?,?,?)";
		int cnt = 0;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, vo.getId());
			pst.setString(2, vo.getPw());
			pst.setString(3, vo.getName());
			pst.setString(4, vo.getSex());
			pst.setString(5, vo.getTel());
			pst.setString(6, vo.getAddr());
			pst.setString(7, vo.getMail());

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return cnt;
	}

	// -----------------------------ȸ�� ���� ----------------------------
	// ----------------------------ȸ�� ����Ʈ �� ----------------------------
	public ArrayList<MemberVO> View() {
		ArrayList<MemberVO> View = new ArrayList<MemberVO>();
		try {
			connect();
			String sql = "select * from member where accept = '2'";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				String num = rs.getString(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String name = rs.getString(4);
				String sex = rs.getString(5);
				String tel = rs.getString(6);
				String addr = rs.getString(7);
				String mail = rs.getString(8);
				String room = rs.getString(9);

				MemberVO vo = new MemberVO(num, id, pw, name, sex, tel, addr, mail, room);
				View.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return View;
	}

	public ArrayList<MemberVO> apview() {
		ArrayList<MemberVO> View = new ArrayList<MemberVO>();
		try {
			connect();
			String sql = "select * from member where accept = '1'";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				String num = rs.getString(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String name = rs.getString(4);
				String sex = rs.getString(5);
				String tel = rs.getString(6);
				String addr = rs.getString(7);
				String mail = rs.getString(8);
				String room = rs.getString(9);

				MemberVO vo = new MemberVO(num, id, pw, name, sex, tel, addr, mail, room);
				View.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return View;
	}

	// ----------------------------- �α��� ----------------------------
	public boolean login(String id, String pw) {
		boolean succ = false;

		try {
			connect();
			String sql = "SELECT * FROM member WHERE id = ? AND pw = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, pw);

			rs = pst.executeQuery();

			if (rs.next()) {
				succ = true;
			}
			/*
			 * �������� succ Ʈ�� �ǰԲ� ����� �����!! �Ķ� ���� ���̶� DB�� �մ� ���̵�� �н����尡 ������!!
			 */
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}

		return succ;
	}

	// ----------------------------- �α��� ----------------------------

	// -------------------------- ȸ�� Ż�� ----------------------------

	public int Delete(MemberVO vo) {
		connect();
		int result = -1;
		String sql = "delete from member where id=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, vo.getId());
			// ��ư ������ �� ���� ���� �Ǵ°Ŷ� vo.getID()���� �ٽ� �����;��ҵ�!!
			result = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return result;
	}
	// -------------------------- ȸ�� Ż�� ----------------------------

	// -----------------------------�ݱ�(Close) -------------------------
	private void getClose() {
		try {
			if (rs != null)
				rs.close();
			if (pst != null)
				pst.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			System.out.println("close����");
		}
	}

	// -----------------------------�ݱ�(Close) --------------------------
	// ------------------- ID���� ���� ��ã�� -------------------------------
	public String findroom(String id) {
		String room = "";
		try {
			connect();
			String sql = "select room from member where id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				room = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return room;
	}
	// ------------------- ��ã�� -------------------------------

	// ------------------- �� ����ϱ� ---------------------------
	public int roomupdate(String id, String inputroom) {
		int cnt = -1;
		connect();
		String SQL = "update member set room = ?, accept = ? where id = ?";
		try {
			pst = conn.prepareStatement(SQL);
			pst.setString(1, inputroom);
			pst.setString(2, "1"); // 1 : ��û ��, ���� ��
			pst.setString(3, id);
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return cnt;
	}

	// ------------------- �� ����ϱ� ---------------------------
	// ------------------- ��� Ȯ�� ----------------------------
	public boolean searchroom(String inputroom) {
		connect();
		boolean check = false;
		String SQL = "select room from member where room = ?";
		try {
			pst = conn.prepareStatement(SQL);
			pst.setString(1, inputroom);
			rs = pst.executeQuery();
			while (rs.next()) {
				check = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return check;
	}

	// ------------------- ��� Ȯ�� ----------------------------
	// --------------------�� ���� --------------------------
	public int roomappro(String num, String accept) {

		int cnt = -1;
		connect();
		String SQL = "update member set accept = ? where no = ?";
		try {
			pst = conn.prepareStatement(SQL);
			pst.setString(1, accept); // 1 : ��û ��, ���� ��
			pst.setString(2, num);
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return cnt;
	}
	// --------------------�� ���� --------------------------

	// --------------------�������� ------------------------

	public int roomreset(String num, String accept) {

		int cnt = -1;
		connect();
		String SQL = "update member set room = null, accept = ? where no = ?";
		try {
			pst = conn.prepareStatement(SQL);
			pst.setString(1, accept); // 1 : ��û ��, �������
			pst.setString(2, num);
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return cnt;
	}
	// --------------------�������� ------------------------
	
	//----------------------�̸� ã��----------------------------
	public String searchname(String id) {
		String name = "";
		try {
			connect();
			String sql = "select * from member where id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				name = rs.getString(4);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return name;
	}
	//----------------------�̸� ã��----------------------------
}
