package kr.or.ddit.middle.vo;

public class View_CpHaving {

	// member
	private String mem_id;
	private String mem_name;
	private String mem_code;
	private String mem_photo;

	// cphaving
	private String co_code;
	private int cp_use;

	public View_CpHaving() {
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_code() {
		return mem_code;
	}

	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}

	public String getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}

	public String getCo_code() {
		return co_code;
	}

	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}

	public int getCp_use() {
		return cp_use;
	}

	public void setCp_use(int cp_use) {
		this.cp_use = cp_use;
	}

}
