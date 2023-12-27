package kr.or.ddit.middle.vo;

public class Info_CouponVO {

	// coupon
	private String co_code;
	private String co_name;
	private int co_rate;

	// cp_having
	private String mem_id;
	private int cp_use;
	private String cp_date;
	private String cp_validity;			//유효기간 받아올 변수

	public String getCp_validity() {
		return cp_validity;
	}

	public String getCp_date() {
		return cp_date;
	}

	public void setCp_date(String cp_date) {
		this.cp_date = cp_date;
	}

	public Info_CouponVO() {
	}

	public String getCo_code() {
		return co_code;
	}

	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}

	public String getCo_name() {
		return co_name;
	}

	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}

	public int getCo_rate() {
		return co_rate;
	}

	public void setCo_rate(int co_rate) {
		this.co_rate = co_rate;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getCp_use() {
		return cp_use;
	}

	public void setCp_use(int cp_use) {
		this.cp_use = cp_use;
	}

}
