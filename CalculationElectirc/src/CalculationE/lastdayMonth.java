package CalculationE;

public class lastdayMonth {
	
	public double lastday(int year, int month) {
		//-------------날짜 별로 마지막 날----------------
		// 년 값을 어떻게 처리 할 것인가?? 어디서 가져올 것인가!!?
		double day = 0;
		switch (month) {
		case 1:
			day = 31;
			break;
		case 2:
			if (( year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
				day = 29;
				break;
			} else {
				day = 28;
				break;
			}
		case 3:
			day = 31;
			break;
		case 4:
			day = 30;
			break;
		case 5:
			day = 31;
			break;
		case 6:
			day = 30;
			break;
		case 7:
			day = 31;
			break;
		case 8:
			day = 31;
			break;
		case 9:
			day = 30;
			break;
		case 10:
			day = 31;
			break;
		case 11:
			day = 30;
			break;
		case 12:
			day = 31;
			break;
		default:
			break;
		}
		return day;
		
		
		
		
	}

}
