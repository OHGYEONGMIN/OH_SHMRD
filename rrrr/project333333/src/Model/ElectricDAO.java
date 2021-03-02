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
				System.out.println("���� ����!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// --------------------------���� ---------------------------
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

//-----------------------------�ݱ�(Close) --------------------------

// ---------------------------�ϳ��ϳ� ������ �����ö� -----------------------
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

//---------------------------�� �� ���� ǥ��(�溰 ����) Userpay������ -----------------------
	public ArrayList<String> wh_month(String room, String mm) {
		ArrayList<String> selectwh = new ArrayList<String>();
		try {
			String room_num = room.toString().substring(0, 1);
			// �����
			int mon = Integer.parseInt(mm);
			// 0�� 1�� 9>10��
			String month = "";
			if (mon < 9) {
				month = "0" + Integer.toString(mon);
			} else {
				month = Integer.toString(mon);
			}
			connect();
			String sql = "select room,day,sum(use_wh) " + "from item_electiricuse " + "group by room,day "
					+ "having room like ? and day like ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, room_num + "%");
			pst.setString(2, "____" + month + "%");
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

	// ---------------------------�� �� ���� ǥ��(�溰 ����) -----------------------
	// ---------------------------�� �� ���� ǥ��(�溰 ����) Userpay������ -------------------
	public ArrayList<String> wh_month_room(String room, String mm) {
		ArrayList<String> selectwh = new ArrayList<String>();
		try {
			String room_num_first = room.toString().substring(0, 1);
			String room_num_end = room.toString().substring(2);
			String month = "";
			// �����
			int mon = Integer.parseInt(mm);
			// 0�� 1�� 9>10��
			if (mon < 9) {
				month = "0" + Integer.toString(mon);
			} else {
				month = Integer.toString(mon);
			}
			if (room_num_end.equals("1")) {
				connect();
				String sql = "select room,day,sum(use_wh) " + "from item_electiricuse " + "group by room,day "
						+ "having room like ? and day like ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, room_num_first + "%" + room_num_end);
				pst.setString(2, "____" + month + "%");
				rs = pst.executeQuery();
				while (rs.next()) {

					String room_wh = rs.getString(3);
					selectwh.add(room_wh);
				}
			} else if (room_num_end.equals("2")) {
				connect();
				String sql = "select room,day,sum(use_wh) " + "from item_electiricuse " + "group by room,day "
						+ "having room like ? and day like ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, room_num_first + "%" + room_num_end);
				pst.setString(2, "____" + month + "%");
				rs = pst.executeQuery();
				while (rs.next()) {

					String room_wh = rs.getString(3);

					selectwh.add(room_wh);
				}
			} else if (room_num_end.equals("3")) {
				connect();
				String sql = "select room,day,sum(use_wh) " + "from item_electiricuse " + "group by room,day "
						+ "having room like ? and day like ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, room_num_first + "%" + room_num_end);
				pst.setString(2, "____" + month + "%");
				rs = pst.executeQuery();
				while (rs.next()) {

					String room_wh = rs.getString(3);

					selectwh.add(room_wh);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return selectwh;
	}

//---------------------------�� �� ���� ǥ��(�溰 ����) Userpay������ -------------------
// ---------------------------�� �� ���� ǥ��(�ٸ��� �����ֱ�) Userpay������ -------------------
	// ---Room --1�� ���
	public ArrayList<String> wh_month_room1(String room,String mm) {

		ArrayList<String> selectwh = new ArrayList<String>();
		try {
			String room_num = room.toString().substring(0, 1);
			// �����
			int mon = Integer.parseInt(mm);
			// 0�� 1�� 9>10��
			String month = "";
			if (mon < 9) {
				month = "0" + Integer.toString(mon);
			} else {
				month = Integer.toString(mon);
			}
			connect();
			String sql = "select room,day,sum(use_wh) " + "from item_electiricuse " + "group by room,day "
					+ "having room like ? and day like ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, room_num + "%" + 1);
			pst.setString(2, "____" + month + "%");
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

//---Room --2�� ���
	public ArrayList<String> wh_month_room2(String room, String mm) {

		ArrayList<String> selectwh = new ArrayList<String>();
		try {
			String room_num = room.toString().substring(0, 1);
			// �����
			int mon = Integer.parseInt(mm);
			// 0�� 1�� 9>10��
			String month = "";
			if (mon < 9) {
				month = "0" + Integer.toString(mon);
			} else {
				month = Integer.toString(mon);
			}
			connect();
			String sql = "select room,day,sum(use_wh) " + "from item_electiricuse " + "group by room,day "
					+ "having room like ? and day like ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, room_num + "%" + 2);
			pst.setString(2, "____" + month + "%");
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

//---Room --3�� ���
	public ArrayList<String> wh_month_room3(String room, String mm) {

		ArrayList<String> selectwh = new ArrayList<String>();
		try {
			String room_num = room.toString().substring(0, 1);
			// �����
			int mon = Integer.parseInt(mm);
			// 0�� 1�� 9>10��
			String month = "";
			if (mon < 9) {
				month = "0" + Integer.toString(mon);
			} else {
				month = Integer.toString(mon);
			}
			connect();
			String sql = "select room,day,sum(use_wh) " + "from item_electiricuse " + "group by room,day "
					+ "having room like ? and day like ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, room_num + "%" + 3);
			pst.setString(2, "____" + month + "%");
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

	// ---Room --3�� ��� ---------�� end
	// -------------------------������ �� ��뷮!!-----------------------------------------
	// �濡 ���� LAD ��뷮-------------------------------------------
	public String wh_item_LAD(String room, String yy, String mm, String dd) {

		String LAD = "";
		try {
			connect();
			String sql = "select room,item_name,day,use_wh from item_electiricuse where room = ? and day = ? and item_name = 'LAD' ";
			pst = conn.prepareStatement(sql);
			pst.setString(1, room);
			pst.setString(2, yy + mm + dd);
			rs = pst.executeQuery();
			while (rs.next()) {

				String room_wh = rs.getString(4);

				LAD = room_wh;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return LAD;
	}

	// �濡 ���� LBD ��뷮-------------------------------------------
	public String wh_item_LBD(String room, String yy, String mm, String dd) {

		String LBD = "";
		try {
			connect();
			String sql = "select room,item_name,day,use_wh from item_electiricuse where room = ? and day = ? and item_name = 'LBD' ";

			pst = conn.prepareStatement(sql);
			pst.setString(1, room);
			pst.setString(2, yy + mm + dd);
			rs = pst.executeQuery();
			while (rs.next()) {

				String room_wh = rs.getString(4);

				LBD = room_wh;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return LBD;
	}

	// �濡 ���� LCD ��뷮-------------------------------------------
	public String wh_item_LCD(String room, String yy, String mm, String dd) {

		String LCD = "";
		try {
			connect();
			String sql = "select room,item_name,day,use_wh from item_electiricuse where room = ? and day = ? and item_name = 'LCD' ";

			pst = conn.prepareStatement(sql);
			pst.setString(1, room);
			pst.setString(2, yy + mm + dd);
			rs = pst.executeQuery();
			while (rs.next()) {

				String room_wh = rs.getString(4);

				LCD = room_wh;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return LCD;
	}

//---------------------------------������ ������ �̴� �� ----------------------------------
	public ArrayList<String> wh_week(String room,String yy, String mm, String dd) {

		ArrayList<String> week = new ArrayList<String>();
		
		try {
			connect();
			String sql = "select room,day,use_wh from item_electiricuse where room = ? and day = ?";

			pst = conn.prepareStatement(sql);
			pst.setString(1, room);
			pst.setString(2, yy + mm + dd);
			rs = pst.executeQuery();
			while (rs.next()) {

				String room_wh = rs.getString(3);

				week.add(room_wh);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		return week;

	}
	
//---------------------------�� �� ��� ���� ������(������������, ������Ʈ �� )------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}