package test_project;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

public class application {
	public static void main(String[] args) {
		String[] jobposition = {"FE ����","IOS ����","Android ����","BE ����"};
		//���� �׸񺰷� 1~4�� ���� ����(1����----4����)
		int[] confidence = {4,1,3,2}; //������ �ִ� ����
		int[] want = {3,1,2,4};       //���ϴ� ����
		int[] interest = {4,1,2,3};   //��̰� �ִ� ����
		HashMap<String, Integer> job = new HashMap<>();
		for (int i = 0; i < jobposition.length; i++) {
			job.put(jobposition[i], confidence[i]+want[i]+interest[i]);
		}
		List<Entry<String, Integer>> list = new ArrayList<Entry<String, Integer>>(job.entrySet());
		Collections.sort(list, new Comparator<Entry<String, Integer>>() {
			@Override
			public int compare(Entry<String, Integer> arg0, Entry<String, Integer> arg1) {
				return arg1.getValue().compareTo(arg0.getValue());
			}
		});
		for (int i = 0; i < list.size()-1; i++) {
			System.out.println(list.get(i));
		}
	}
}
