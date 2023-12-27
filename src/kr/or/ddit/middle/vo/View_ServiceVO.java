package kr.or.ddit.middle.vo;

public class View_ServiceVO {

	// service_info
	private String si_code;
	private String si_name;

	// service_list
	private String a_code;

	public View_ServiceVO() {
	}

	public String getSi_code() {
		return si_code;
	}

	public void setSi_code(String si_code) {
		this.si_code = si_code;
	}

	public String getSi_name() {
		return si_name;
	}

	public void setSi_name(String si_name) {
		this.si_name = si_name;
	}

	public String getA_code() {
		return a_code;
	}

	public void setA_code(String a_code) {
		this.a_code = a_code;
	}

}
