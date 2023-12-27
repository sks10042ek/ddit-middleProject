package kr.or.ddit.middle.vo;

public class ComentVO {
	//기본 commentVO
	private String co_code;
	private String co_content;
	private String bo_code;

	//Comment 기록 뽑는데 필요한 추가 vo들	
	private int rowNumber;
	private String mem_id;
	private String bo_date;
	
	private String mem_name;
	
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getCo_code() {
		return co_code;
	}
	public void setCo_code(String co_code) {
		this.co_code = co_code;
	}
	public String getCo_content() {
		return co_content;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public String getBo_code() {
		return bo_code;
	}
	public void setBo_code(String bo_code) {
		this.bo_code = bo_code;
	}
	public int getRowNumber() {
		return rowNumber;
	}
	public void setRowNumber(int rowNumber) {
		this.rowNumber = rowNumber;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBo_date() {
		return bo_date;
	}
	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}

	

	
}
