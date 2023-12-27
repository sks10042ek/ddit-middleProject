package kr.or.ddit.middle.vo;

public class View_PhotoVO {

	// 사진 데이터를 가질 VO

	// photo
	private String pt_code;
	private String pt_file;
	private String pt_type;

	// ACCOM
	private String a_code;
	private String a_name;
	private int a_wnum;
	private String a_type;
	private String a_addr;
	
	// REVIEW
	private String rev_code;

	// ROOM
	private String r_code;
	private String r_type;
	private int r_min;
	private int r_max;
	private int r_price;
	private int r_inven;

	// WishList ->a_code는 Accom 코드와 곂침
	private String mem_id;

	public View_PhotoVO() {
	}

	// setter getter
	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getPt_code() {
		return pt_code;
	}

	public void setPt_code(String pt_code) {
		this.pt_code = pt_code;
	}

	

	public String getPt_type() {
		return pt_type;
	}

	public void setPt_type(String pt_type) {
		this.pt_type = pt_type;
	}

	

	public String getPt_file() {
		return pt_file;
	}

	public void setPt_file(String pt_file) {
		this.pt_file = pt_file;
	}

	public String getA_code() {
		return a_code;
	}

	public void setA_code(String a_code) {
		this.a_code = a_code;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public int getA_wnum() {
		return a_wnum;
	}

	public void setA_wnum(int a_wnum) {
		this.a_wnum = a_wnum;
	}

	public String getA_type() {
		return a_type;
	}

	public void setA_type(String a_type) {
		this.a_type = a_type;
	}

	public String getRev_code() {
		return rev_code;
	}

	public void setRev_code(String rev_code) {
		this.rev_code = rev_code;
	}

	public String getR_code() {
		return r_code;
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

	public String getA_addr() {
		return a_addr;
	}

	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}

}
