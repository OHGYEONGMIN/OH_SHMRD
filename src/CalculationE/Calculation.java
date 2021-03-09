package CalculationE;

import java.util.Scanner;

public class Calculation {
	double kwh;
	int section1 = 730;
	int section2 = 1260;
	int section3 = 6060;
	double tax = 0;
	double fare = 0;
	
	// �⺻ ��� ���
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
	//------------------------------------�⺻ ��� ���
	
	// ��ü ��� ���
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
	// ------------------------------------��ü ��� ���
	
	// �ΰ���
	public int Calculater_taxpay(double Kwh) {
		this.kwh = Kwh;
		int total = Calculater_total(Kwh);
		double tax = (double)total*0.1;
		return (int)tax;	
	}
	// ------------------------------------�ΰ���
	
	// ���� ��� ���� ���
	public int Calculater_fundpay(double Kwh) {
		this.kwh = Kwh;
		int total = Calculater_total(Kwh);
		double fund = (double)total * 0.037;
		return (int)fund;
	}
	// -------------------------------------���� ��� ���� ���
	
	// ���� �� ���
	public int Month(int year, int month) {
		int lastday = 0;
		LastdayMonth LM = new LastdayMonth();
		lastday = LM.lastday(year, month);	
		return lastday;
	}
	// -------------------------------------- ���� �� (���������ϰ��)
	
	
	
	
	public static void main(String[] args) {
		LastdayMonth m = new LastdayMonth();
		Scanner sc = new Scanner(System.in);
		System.out.println("���ⷮ �󸶳� ��� �߽��ϱ�??(��/��/��뷮 ���� �Է��ϼ���)");
		int year = sc.nextInt(); // ��
		int month = sc.nextInt(); // ��
		int wh = sc.nextInt(); // ��뷮
		System.out.println("���� ���� �ϼ˳���??");
		int inday = sc.nextInt(); // ������
		double result = 0;
		// �⺻��� ����
		double section1 = 730;
		double section2 = 1260;
		double section3 = 6060;
		// �ΰ���
		double tax = 0;
		double fare = 0;
		// ��ħ���� 1�� �������� ���� ��¥���� �� �� ������ ����Ḧ ����� �ش�.
		double remain = ((m.lastday(year, month) + 1) - inday) / m.lastday(year, month);
		/*
		 * ������ �⺻ ��� 7,8�� = ~300 : 730�� 300~450 : 1260�� 450~ : 6060��
		 * 
		 * ������ �� ~200 : 730�� 200~400 : 1260�� 400 ~ : 6060��
		 */

		// 7~8�� ����2
		// 0~300 = 78.3��
		// 301~450 = 147.3��
		// 451~ = 215.6��

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
		// ������ �ΰ��� ����ϱ�
		tax = result * 0.1;
		// ���»����ݱ��
		fare = result * 0.037;
		// �Ѿ�
		result = result + tax + fare;
		System.out.println("�̴��� ���⼼�� = " + (int) result + "��");

		sc.close();
	}

}
