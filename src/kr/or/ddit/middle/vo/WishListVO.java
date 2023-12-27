package kr.or.ddit.middle.vo;

public class WishListVO {

	private String mem_id;
	private String a_code;
	private String a_type;

	public String getType() {
		return a_type;
	}

	public void setType(String type) {
		this.a_type = type;
	}

	public WishListVO() {
	}

	

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getA_code() {
		return a_code;
	}

	public void setA_code(String a_code) {
		this.a_code = a_code;
	}

}
