package CalculationE;

import java.util.ArrayList;

public class barchartCal {

	public String month(int mm) {
		String month = "";
		if (mm <= 9) {
			month = "0" + Integer.toString(mm);
		} else {
			month = Integer.toString(mm);
		}
		return month;
	}

	public String weekday(int day) {
		String weekday = "";
		if (day <= 9) {
			weekday = "0" + Integer.toString(day);
		} else {
			weekday = Integer.toString(day);
		}
		return weekday;
	}

	public ArrayList<String> barchartlist(int day) {

		ArrayList<Integer> weekday = new ArrayList<Integer>();
		for (int i = 0; i < 7; i++) {
			weekday.add(day - 3 + i);
		}

		ArrayList<String> barchart = new ArrayList<String>();
		for (int i = 0; i < 7; i++) {
			if (weekday.get(i) <= 9) {
				barchart.add("0" + Integer.toString(weekday.get(i)));
			} else {
				barchart.add(Integer.toString(weekday.get(i)));
			}
		}

		return barchart;

	}

}
