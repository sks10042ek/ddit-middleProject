package kr.or.ddit.middle.vo;

//객실VO
public class RoomVO {
	private String r_code;
	private String r_type;
	private int r_min;
	private int r_max;
	private int r_price;
	private int r_inven;
	
	
	

	private String a_code;
	private String a_type;
	private String res_cin;
	private String res_cout;
	
	
	
	public String getCin() {
		return res_cin;
	}

	public void setCin(String cin) {
		this.res_cin = cin;
	}

	public String getCout() {
		return res_cout;
	}

	public void setCout(String cout) {
		this.res_cout = cout;
	}

	public String getR_code() {
		return r_code;
	}

	public String getA_type() {
		return a_type;
	}

	public void setA_type(String a_type) {
		this.a_type = a_type;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getR_type() {
		return r_type;
	}

	public void setR_type(String r_type) {
		this.r_type = r_type;
	}

	public int getR_min() {
		return r_min;
	}

	public void setR_min(int r_min) {
		this.r_min = r_min;
	}

	public int getR_max() {
		return r_max;
	}

	public void setR_max(int r_max) {
		this.r_max = r_max;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public int getR_inven() {
		return r_inven;
	}

	public void setR_inven(int r_inven) {
		this.r_inven = r_inven;
	}

	public String getA_code() {
		return a_code;
	}

	public void setA_code(String a_code) {
		this.a_code = a_code;
	}

}
