package CalculationE;

public class CalculationVO {
	String basicpay, totalpay, taxpay, fundpay,Kwh;
	

	public CalculationVO(String kwh) {
		super();
		Kwh = kwh;
	}

	public CalculationVO() {
	}

	public String getBasicpay() {
		return basicpay;
	}

	public String getTotalpay() {
		return totalpay;
	}

	public String getTaxpay() {
		return taxpay;
	}

	public String getFundpay() {
		return fundpay;
	}

	public String getKwh() {
		return Kwh;
	}
	



}
