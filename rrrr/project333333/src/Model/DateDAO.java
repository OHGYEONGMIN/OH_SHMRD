package Model;

import java.util.Calendar;
import java.util.Date;

public class DateDAO {
	

	
	public int Year(String Clickd) {
		Calendar now = Calendar.getInstance();
		int Clickday = Integer.parseInt(Clickd);
		//년도 값 달력에서 뽑아와야한다!!
		//년도 값 뽑아와서 calculation쪽으로 계산 보내야함
		//윤년계산
		
		return 2020;
	}
	public int month(String Clickd) {
		Calendar now = Calendar.getInstance();
		int Clickday = Integer.parseInt(Clickd);
		//달력에서 월(달) 값 뽑아와야함!!
		// 달마다 전체 일수가 다르기 때문에
		return 2;
	}
	public int day(String Clickd) {
		Calendar now = Calendar.getInstance();
		int Clickday = Integer.parseInt(Clickd);
		// 달력에서 일값 가져오기
		return 20;
	}
	//년.월.일 가져와서 DB에 있는 값과 비교해서 그날 값 꺼내주기
	// 또한 주간 그래프는 선택한 날짜 -3/+3일로 해서 계산하기
	public static void main(String[] args) {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int Month = now.get(Calendar.MONTH);
		int day = now.get(Calendar.DAY_OF_MONTH);
		int sec = now.get(Calendar.SECOND);
		String a = "11";
		String b = "22";
		
		
		System.out.println(year);
		System.out.println(Month);
		System.out.println(day-1);
		System.out.println(sec);
		System.out.println(a+b);
				
	}
}
