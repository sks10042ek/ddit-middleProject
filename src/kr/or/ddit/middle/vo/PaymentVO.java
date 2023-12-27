package kr.or.ddit.middle.vo;

public class PaymentVO {
	private String pay_no;
	private String res_code;
	private String pay_date;
	private int pay_price;
	private String pay_method;
	private String mil_use;
	private String cou_use;

	//관리자 매출 조회에서 그래프에 들어갈 자료
	private String pay_month;
	private String pay_total_sales;

	public String getPay_month() {
		return pay_month;
	}

	public void setPay_month(String pay_month) {
		this.pay_month = pay_month;
	}

	public String getPay_total_sales() {
		return pay_total_sales;
	}

	public void setPay_total_sales(String pay_total_sales) {
		this.pay_total_sales = pay_total_sales;
	}

	public String getMil_use() {
		return mil_use;
	}

	public void setMil_use(String mil_use) {
		this.mil_use = mil_use;
	}

	public String getCou_use() {
		return cou_use;
	}

	public void setCou_use(String cou_use) {
		this.cou_use = cou_use;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getRes_code() {
		return res_code;
	}

	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

}
