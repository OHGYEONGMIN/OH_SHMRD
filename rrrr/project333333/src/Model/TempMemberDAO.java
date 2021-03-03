package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TempMemberDAO {

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

	private void getClose() {
		try {
			if (rs != null)
				rs.close();
			if (pst != null)
				pst.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			System.out.println("close¿¡·¯");
		}
	}

	public int insert(TempMemberVO vo) {
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

	public ArrayList<TempMemberVO> View() {
		ArrayList<TempMemberVO> View = new ArrayList<TempMemberVO>();
		try {
			connect();
			String sql = "select * from tempmember";
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

				TempMemberVO vo = new TempMemberVO(num, id, pw, name, sex, tel, addr, mail, room);
				View.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return View;
	}

	public ArrayList<TempMemberVO> listup(String id, String roomnum) {

		ArrayList<TempMemberVO> View = new ArrayList<TempMemberVO>();
		try {
			connect();
			String sql = "select * from tempmember where id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery(); 
			while (rs.next()) {
				String num = rs.getString(1);
				id = rs.getString(2);
				String pw = rs.getString(3);
				String name = rs.getString(4);
				String sex = rs.getString(5);
				String tel = rs.getString(6);
				String addr = rs.getString(7);
				String mail = rs.getString(8);
				String room = rs.getString(9);

				TempMemberVO vo = new TempMemberVO(num, id, pw, name, sex, tel, addr, mail, room);
				View.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return View;
	}

}
