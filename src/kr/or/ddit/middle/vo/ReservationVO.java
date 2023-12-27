package kr.or.ddit.middle.vo;

public class ReservationVO {
	private String res_code;
	private String r_code;
	private String mem_id;
	private String res_cin;
	private String res_cout;
	private String res_memo;
	private String res_status;
	
	
	
	private int r_inven;

	public int getR_inven() {
		return r_inven;
	}

	public void setR_inven(int r_inven) {
		this.r_inven = r_inven;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getRes_code() {
		return res_code;
	}

	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}

	public String getRes_cin() {
		return res_cin;
	}

	public void setRes_cin(String res_cin) {
		this.res_cin = res_cin;
	}

	public String getRes_cout() {
		return res_cout;
	}

	public void setRes_cout(String res_cout) {
		this.res_cout = res_cout;
	}

	public String getRes_memo() {
		return res_memo;
	}

	public void setRes_memo(String res_memo) {
		this.res_memo = res_memo;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

}
