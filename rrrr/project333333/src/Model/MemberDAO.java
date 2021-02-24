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

	// ---------------------- 아이디 중복 체크 -------------------------
	public int check(MemberVO vo) {

		return 0;

	}
	// ---------------------- 아이디 중복 체크 -------------------------
	// -----------------------------회원 가입 ----------------------------

	public int insert(MemberVO vo) {
		connect();
		String sql = "insert into member values(1,?,?,?,?,?,?,?,?)";
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
			pst.setString(8, vo.getRoom());

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return cnt;
	}

	// -----------------------------회원 가입 ----------------------------
	// ----------------------------회원 리스트 뷰 ----------------------------
	public ArrayList<MemberVO> View() {
		ArrayList<MemberVO> View = new ArrayList<MemberVO>();
		try {
			connect();
			String sql = "select * from member";
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

	// ----------------------------- 로그인 ----------------------------
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
			 * 서블릿에서 succ 트루 되게끔 만들어 줘야함!! 파라 미터 값이랑 DB에 잇는 아이디와 패스워드가 같을때!!
			 */
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}

		return succ;
	}

	// ----------------------------- 로그인 ----------------------------

	// -------------------------- 회원 탈퇴 ----------------------------

	public int Delete(MemberVO vo) {
		connect();
		int result = -1;
		String sql = "delete from member where id=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, vo.getId());
			// 버튼 누르면 그 행이 삭제 되는거라 vo.getID()값을 다시 가져와야할듯!!
			result = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return result;
	}
	// -------------------------- 회원 탈퇴 ----------------------------

	// -----------------------------닫기(Close) -------------------------
	private void getClose() {
		try {
			if (rs != null)
				rs.close();
			if (pst != null)
				pst.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			System.out.println("close에러");
		}
	}

	// -----------------------------닫기(Close) --------------------------
	// ------------------- 방찾기 -------------------------------
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
	// ------------------- 방찾기 -------------------------------

	// ------------------- 방 등록하기 ---------------------------
	public int roomupdate(String id, String inputroom) {
		int cnt = -1;
		connect();
		String SQL = "update member set room = ? where id = ?";
		try {
			pst = conn.prepareStatement(SQL);
			pst.setString(1, inputroom);
			pst.setString(2, id);
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return cnt;
	}
}
