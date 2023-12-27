package kr.or.ddit.middle.vo;

public class View_BoardVO {

	// board
	private String bo_code;
	private String bo_type;
	private String bo_title;
	private String bo_content;
	private String bo_date;

	// member
	private String mem_id;
	private String mem_name;
	private String mem_code;
	private String mem_photo;

	public View_BoardVO() {
	}

	public String getBo_code() {
		return bo_code;
	}

	public void setBo_code(String bo_code) {
		this.bo_code = bo_code;
	}

	public String getBo_type() {
		return bo_type;
	}

	public void setBo_type(String bo_type) {
		this.bo_type = bo_type;
	}

	public String getBo_title() {
		return bo_title;
	}

	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public String getBo_date() {
		return bo_date;
	}

	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
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

}
