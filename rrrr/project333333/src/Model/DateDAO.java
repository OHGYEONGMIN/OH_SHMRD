package Model;

import java.util.Calendar;
import java.util.Date;

public class DateDAO {
	

	
	public int Year(String Clickd) {
		Calendar now = Calendar.getInstance();
		int Clickday = Integer.parseInt(Clickd);
		//�⵵ �� �޷¿��� �̾ƿ;��Ѵ�!!
		//�⵵ �� �̾ƿͼ� calculation������ ��� ��������
		//������
		
		return 2020;
	}
	public int month(String Clickd) {
		Calendar now = Calendar.getInstance();
		int Clickday = Integer.parseInt(Clickd);
		//�޷¿��� ��(��) �� �̾ƿ;���!!
		// �޸��� ��ü �ϼ��� �ٸ��� ������
		return 2;
	}
	public int day(String Clickd) {
		Calendar now = Calendar.getInstance();
		int Clickday = Integer.parseInt(Clickd);
		// �޷¿��� �ϰ� ��������
		return 20;
	}
	//��.��.�� �����ͼ� DB�� �ִ� ���� ���ؼ� �׳� �� �����ֱ�
	// ���� �ְ� �׷����� ������ ��¥ -3/+3�Ϸ� �ؼ� ����ϱ�
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
