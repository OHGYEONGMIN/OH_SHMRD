package CalculationE;

import java.util.Scanner;

public class Calculation {
	public static void main(String[] args) {
		lastdayMonth m = new lastdayMonth();
		Scanner sc = new Scanner(System.in);
		System.out.println("전기량 얼마나 사용 했습니까??(년/월/사용량 으로 입력하세요)");
		int year = sc.nextInt();  // 년
		int month = sc.nextInt(); // 월
		int wh = sc.nextInt();    // 사용량
		System.out.println("언제 입주 하셧나요??");
		int inday = sc.nextInt(); // 입주일
		double result = 0;
		//기본요금 정의
		double section1 = 730;
		double section2 = 1260;
		double section3 = 6060;
		//부가세
		double tax = 0;
		double fare = 0;
		// 검침일은 1일 기준으로 들어온 날짜부터 그 달 말까지 전기료를 계산해 준다.
		double remain = ((m.lastday(year,month)+1)-inday)/m.lastday(year,month);
		/*
		 구간별 기본 요금
		 7,8월  =  ~300  : 730원
		 		300~450 : 1260원
		 		450~ : 6060원
		 		
		 나머지 달
		         ~200 : 730원
		         200~400 : 1260원
		         400 ~ : 6060원
		 */
		
		// 7~8월 기준
		// 0~300  = 78.3원
		// 301~450 = 147.3원
		// 451~    = 215.6원
		
		
		if(month ==7 || month ==8) {
			if(wh>450) {
				result = (300*remain*78.3) + (150*remain*147.3) + ((wh-450)*remain*215.6) + section3;
			}else if(wh > 300) {
				result = (300*remain*78.3) + ((wh-300)*remain*147.3) + section2;
			}else {
				result = (wh*remain*78.3) + section1;
			}
		}else {
			if(wh>400) {
				result = (200*remain*78.3) + (200*remain*147.3) + ((wh-400)*remain*215.6)+section3;
			}else if(wh > 200) {
				result = (200*remain*78.3) + ((wh-200)*remain*147.3)+section2;
			}else {
				result = (wh*78.3)+section1;
			}
		}
		//나머지 부가세 계산하기
		tax = result*0.1;
		//전력산업기반기금
		fare = result*0.037;
		//총액
		result = result+tax+fare;
		System.out.println("이달의 전기세는 = "+ (int)result + "원");
		
		
		sc.close();
	}

}
