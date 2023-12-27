package kr.or.ddit.middle.vo;

public class View_ReviewVO {

	// Review
	private String rev_code;
	private String rev_date;
	private int rev_score;
	private String rev_title;
	private String rev_content;

	// reservation
	private String res_code;
	private String mem_id;
	private String res_status;

	// room
	private String r_code;
	private String a_code;
	private String r_type;
	private String r_price;
	
	//photo
	private String pt_code;
	private String pt_file;
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getPt_code() {
		return pt_code;
	}

	public void setPt_code(String pt_code) {
		this.pt_code = pt_code;
	}

	public String getPt_file() {
		return pt_file;
	}

	public void setPt_file(String pt_file) {
		this.pt_file = pt_file;
	}


	
	
	public View_ReviewVO() {
	}

	public String getRev_code() {
		return rev_code;
	}

	public void setRev_code(String rev_code) {
		this.rev_code = rev_code;
	}

	public String getRev_date() {
		return rev_date;
	}

	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}

	public int getRev_score() {
		return rev_score;
	}

	public void setRev_score(int rev_score) {
		this.rev_score = rev_score;
	}

	public String getRev_title() {
		return rev_title;
	}

	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public String getRes_code() {
		return res_code;
	}

	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getA_code() {
		return a_code;
	}

	public void setA_code(String a_code) {
		this.a_code = a_code;
	}

	public String getR_type() {
		return r_type;
	}

	public void setR_type(String r_type) {
		this.r_type = r_type;
	}

	public String getR_price() {
		return r_price;
	}

	public void setR_price(String r_price) {
		this.r_price = r_price;
	}

}
