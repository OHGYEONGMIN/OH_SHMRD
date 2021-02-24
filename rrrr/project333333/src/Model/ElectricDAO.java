package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

public class ElectricDAO {
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
				System.out.println("연결 성공!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// --------------------------연동 ---------------------------
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

//-----------------------------닫기(Close) --------------------------
	// ----------------각 방마다 전력 사용량(토탈) --------------------------
	public ArrayList<String> room_wh(String room) {
		ArrayList<String> selectwh = new ArrayList<String>();
		try {
			Calendar now = Calendar.getInstance();
			String room_num = room.toString().substring(0, 1);
			// 어제 계산
//			int sday = now.get(Calendar.DAY_OF_MONTH) - 1;
			String day = "20";
			connect();
			String sql = "select room,day,sum(use_wh) " + "from item_electiricuse " + "group by room,day "
					+ "having room like ? and day like ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, room_num + "%");
			pst.setString(2, "%" + day);

			rs = pst.executeQuery();
			while (rs.next()) {

				String room_wh = rs.getString(3);

				selectwh.add(room_wh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return selectwh;

	}
	// -------------------------------------------------------------------

	// ---------------------------하나하나 데이터 가져올때 -----------------------
	public ArrayList<ElectricVO> Eview() {

		ArrayList<ElectricVO> Eview = new ArrayList<ElectricVO>();
		try {
			connect();
			String sql = "select * from item_electiricuse";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				String room = rs.getString(1);
				String item_name = rs.getString(2);
				String day = rs.getString(3);
				String use_hour = rs.getString(4);
				String use_wh = rs.getString(5);

				ElectricVO vo = new ElectricVO(room, item_name, day, use_hour, use_wh);

				Eview.add(vo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return Eview;
	}
}
