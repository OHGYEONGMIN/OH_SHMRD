package CalculationE;

import java.util.Scanner;

public class Calculation {
	public static void main(String[] args) {
		lastdayMonth m = new lastdayMonth();
		Scanner sc = new Scanner(System.in);
		System.out.println("���ⷮ �󸶳� ��� �߽��ϱ�??(��/��/��뷮 ���� �Է��ϼ���)");
		int year = sc.nextInt();  // ��
		int month = sc.nextInt(); // ��
		int wh = sc.nextInt();    // ��뷮
		System.out.println("���� ���� �ϼ˳���??");
		int inday = sc.nextInt(); // ������
		double result = 0;
		//�⺻��� ����
		double section1 = 730;
		double section2 = 1260;
		double section3 = 6060;
		//�ΰ���
		double tax = 0;
		double fare = 0;
		// ��ħ���� 1�� �������� ���� ��¥���� �� �� ������ ����Ḧ ����� �ش�.
		double remain = ((m.lastday(year,month)+1)-inday)/m.lastday(year,month);
		/*
		 ������ �⺻ ���
		 7,8��  =  ~300  : 730��
		 		300~450 : 1260��
		 		450~ : 6060��
		 		
		 ������ ��
		         ~200 : 730��
		         200~400 : 1260��
		         400 ~ : 6060��
		 */
		
		// 7~8�� ����
		// 0~300  = 78.3��
		// 301~450 = 147.3��
		// 451~    = 215.6��
		
		
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
		//������ �ΰ��� ����ϱ�
		tax = result*0.1;
		//���»����ݱ��
		fare = result*0.037;
		//�Ѿ�
		result = result+tax+fare;
		System.out.println("�̴��� ���⼼�� = "+ (int)result + "��");
		
		
		sc.close();
	}

}
