package CalculationE;

import java.util.Scanner;

public class Calculation {
	double kwh;
	int section1 = 730;
	int section2 = 1260;
	int section3 = 6060;
	double tax = 0;
	double fare = 0;
	
	// 기본 요금 계산
	public int Calculater_basic(double Kwh) {
		this.kwh = Kwh;
		int basic_pay = 0;
		if (kwh > 400) {
			basic_pay = section3;
		}else if(kwh > 200) {
			basic_pay = section2;
		}else {
			basic_pay = section1;
		}
		return basic_pay;
	}
	//------------------------------------기본 요금 계산
	
	// 전체 요금 계산
	public int Calculater_total(double Kwh) {
		this.kwh = Kwh;
		double total_pay = 0;
		if (Kwh > 400) {
			total_pay  = (200  * 78.3) + (200  * 147.3) + ((Kwh - 400)* 215.6) + section3;
		} else if (Kwh > 200) {
			total_pay  = (200  * 78.3) + ((Kwh - 200)  * 147.3) + section2;
		} else {
			total_pay  = (Kwh * 78.3) + section1;
		}
		tax = total_pay * 0.1;
		fare = total_pay * 0.037;
		total_pay = total_pay + tax + fare;
		return (int) total_pay;
	}
	// ------------------------------------전체 요금 계산
	
	// 부가세
	public int Calculater_taxpay(double Kwh) {
		this.kwh = Kwh;
		int total = Calculater_total(Kwh);
		double tax = (double)total*0.1;
		return (int)tax;	
	}
	// ------------------------------------부가세
	
	// 젼력 산업 발전 기금
	public int Calculater_fundpay(double Kwh) {
		this.kwh = Kwh;
		int total = Calculater_total(Kwh);
		double fund = (double)total * 0.037;
		return (int)fund;
	}
	// -------------------------------------전력 산업 발전 기금
	
	// 입주 달 계산
	public int Month(int year, int month) {
		int lastday = 0;
		LastdayMonth LM = new LastdayMonth();
		lastday = LM.lastday(year, month);	
		return lastday;
	}
	// -------------------------------------- 입주 달 (마지막요일계산)
	
	
	
	
	public static void main(String[] args) {
		LastdayMonth m = new LastdayMonth();
		Scanner sc = new Scanner(System.in);
		System.out.println("전기량 얼마나 사용 했습니까??(년/월/사용량 으로 입력하세요)");
		int year = sc.nextInt(); // 년
		int month = sc.nextInt(); // 월
		int wh = sc.nextInt(); // 사용량
		System.out.println("언제 입주 하셧나요??");
		int inday = sc.nextInt(); // 입주일
		double result = 0;
		// 기본요금 정의
		double section1 = 730;
		double section2 = 1260;
		double section3 = 6060;
		// 부가세
		double tax = 0;
		double fare = 0;
		// 검침일은 1일 기준으로 들어온 날짜부터 그 달 말까지 전기료를 계산해 준다.
		double remain = ((m.lastday(year, month) + 1) - inday) / m.lastday(year, month);
		/*
		 * 구간별 기본 요금 7,8월 = ~300 : 730원 300~450 : 1260원 450~ : 6060원
		 * 
		 * 나머지 달 ~200 : 730원 200~400 : 1260원 400 ~ : 6060원
		 */

		// 7~8월 기준2
		// 0~300 = 78.3원
		// 301~450 = 147.3원
		// 451~ = 215.6원

		if (month == 7 || month == 8) {
			if (wh > 450) {
				result = (300 * remain * 78.3) + (150 * remain * 147.3) + ((wh - 450) * remain * 215.6) + section3;
			} else if (wh > 300) {
				result = (300 * remain * 78.3) + ((wh - 300) * remain * 147.3) + section2;
			} else {
				result = (wh * remain * 78.3) + section1;
			}
		} else {
			if (wh > 400) {
				result = (200 * remain * 78.3) + (200 * remain * 147.3) + ((wh - 400) * remain * 215.6) + section3;
			} else if (wh > 200) {
				result = (200 * remain * 78.3) + ((wh - 200) * remain * 147.3) + section2;
			} else {
				result = (wh * 78.3) + section1;
			}
		}
		// 나머지 부가세 계산하기
		tax = result * 0.1;
		// 전력산업기반기금
		fare = result * 0.037;
		// 총액
		result = result + tax + fare;
		System.out.println("이달의 전기세는 = " + (int) result + "원");

		sc.close();
	}

}
