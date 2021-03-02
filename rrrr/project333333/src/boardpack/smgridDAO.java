package boardpack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

public class smgridDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	private void getConnetct() {
		String URL = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "hr";
		String password = "hr";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 동적로딩 왜 하는가?

			conn = DriverManager.getConnection(URL, user, password);
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}

	}

	private void dbClose() {
		try {

			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	public ArrayList<boardVO> boardList() {
		
		Calendar cd = Calendar.getInstance();
	      int hour = cd.get(cd.HOUR_OF_DAY);
	      int min = cd.get(cd.MINUTE);
	      int sec = cd.get(cd.SECOND);

	      int year = cd.get(cd.YEAR);
	      int month = cd.get(cd.MONTH) + 1;
	      
	      String change_month = "";

	      if (month < 10) {
	         change_month = "0" + month;
	      } else {
	         change_month += month;
	      }

	      int date = cd.get(cd.DATE);
	      String dataSet = year + "-" + change_month + "-" 
	      + date;
	      
	      String today = dataSet; 
	      today = today.substring(0, 10);
	      
	
	getConnetct();
	System.out.println("연결됨");
	String SQL = "select * from board order by groupno desc, groupod asc ";
	ArrayList<boardVO> list = new ArrayList<boardVO>();

	try {
		ps = conn.prepareStatement(SQL);
		rs = ps.executeQuery();
		while (rs.next()) {

			int num = rs.getInt("num");
			String title = rs.getString("title");
			String name = rs.getString("name");
			String day = rs.getString("day");
			String day2 = day.substring(0,10);
			if(day2.equals(today)) {
				day = day.substring(11, 16);
			}else {
				day = day2;
			}
			
			int click = rs.getInt("click");
			int rec = rs.getInt("rec");

			boardVO vo = new boardVO(num, title, name, day, click);
//            
			list.add(vo);

		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
}
	// 조회수 증가
	public void updateClick(String num) {
		getConnetct();
		int click = 0;

		
		
		System.out.println("게시물 번호는 = "+ num);
		
		
		String SQL = "select click from board where num=?";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, num);
			rs = ps.executeQuery();
			while(rs.next()) {
				click = rs.getInt("click");
				System.out.println("조회성공, click은 ="+click);
				
			}
		} catch (Exception e) {
		}
		click++;
		System.out.println("조회수 증가 ="+click);
		SQL = "update board set click = ? where num=?";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, click);
			ps.setString(2, num);
			int cnt = ps.executeUpdate();
			if (cnt != 0) {
				System.out.println("조회수증가");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public boardVO ContentList(String num) {
		getConnetct();
		String SQL = "select * from board where num=?";
		boardVO vo = null;

		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {

				String title = rs.getString("title");
				String name = rs.getString("name");
				String day = rs.getString("day");
				int click = rs.getInt("click");
				int rec = rs.getInt("rec");
				String content = rs.getString("content");
				int groupno = rs.getInt("groupno");
				int groupod = rs.getInt("groupod");
				int depth = rs.getInt("depth");
				vo = new boardVO(Integer.parseInt(num), title, name, day, click,  content, groupno, groupod, depth);

			} else {

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return vo;
	}

	public ArrayList<CommentVO> CommentList(String num) {
		// int Click 도 받아와야함 getparameter로
		getConnetct();
		
		
		System.out.println("게시물 번호는 = "+ num);
		
		CommentVO vo1 = null;
		String SQL = "update board set click = ? where num=?";

		SQL = "select * from reply where boardnum=? order by groupno asc, groupod asc";

		// ArrayList<boardVO> list = new ArrayList<boardVO>();
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, num);
			rs = ps.executeQuery();

			while (rs.next()) {

				String name = rs.getString("name");
				String reply = rs.getString("reply");
				String day = rs.getString("day");

				vo1 = new CommentVO(reply, day, name);
				list.add(vo1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return list;
	}

	//관리자 답글 달기
	public int AnswerInsert(String title, String content, String groupno, String groupod) {
		getConnetct();
		String SQL = "insert into board values(num_seq.nextval, ?, 'admin', sysdate, 0, 0, ?, ?,?,0   )";
		int od = Integer.parseInt(groupod);
		od++;
		System.out.println("od 증가 = "+od);
		int cnt =0;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, groupno);
			ps.setInt(4, od);
			cnt = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public int BoardInsert(String name, String title, String content) {
		getConnetct();
		String SQL = "insert into board values(num_seq.nextval, ?, ?, sysdate, 0, 0, ?, board_seq.nextval,0,0   )";
		int cnt =0;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, title);
			ps.setString(2, name);
			ps.setString(3, content);
			cnt = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public int BoardEdit(String num, String title, String content) {
		getConnetct();
		String SQL = "update board set title = ? , content = ? where num = ?";
		int cnt =0;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, num);
			cnt = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public int BoardDelete(String num) {
		getConnetct();
		String SQL = "delete from board where num=?";
		int cnt = 0;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, num);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return cnt;
	}

	public ArrayList<boardVO> searchList(String category, String search) {
		
		Calendar cd = Calendar.getInstance();
	      int hour = cd.get(cd.HOUR_OF_DAY);
	      int min = cd.get(cd.MINUTE);
	      int sec = cd.get(cd.SECOND);

	      int year = cd.get(cd.YEAR);
	      int month = cd.get(cd.MONTH) + 1;
	      
	      String change_month = "";

	      if (month < 10) {
	         change_month = "0" + month;
	      } else {
	         change_month += month;
	      }

	      int date = cd.get(cd.DATE);
	      String dataSet = year + "-" + change_month + "-" 
	      + date;
	      
	      String today = dataSet; 
	      today = today.substring(0, 10);
	      
	
	getConnetct();
	System.out.println("연결됨");
	String theme = category;
	String SQL = "select * from board where "+theme +" like '%'||?||'%' order by groupno desc, groupod asc ";
	ArrayList<boardVO> list = new ArrayList<boardVO>();
	System.out.println("dao의 카테고리는="+theme+"공백없음");
	try {
		ps = conn.prepareStatement(SQL);
		//ps.setString(1, category);
		ps.setString(1, search);
		rs = ps.executeQuery();
		while (rs.next()) {

			int num = rs.getInt("num");
			String title = rs.getString("title");
			String name = rs.getString("name");
			String day = rs.getString("day");
			String day2 = day.substring(0,10);
			int groupno = rs.getInt("groupno");
			int groupod = rs.getInt("groupod");
			int depth = rs.getInt("depth");
			
			if(day2.equals(today)) {
				day = day.substring(11, 16);
			}else {
				day = day2;
			}
			
			int click = rs.getInt("click");
			int rec = rs.getInt("rec");

			boardVO vo = new boardVO(num, title, name, day, click, groupno, groupod, depth );
//            
			list.add(vo);

		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
}

}
