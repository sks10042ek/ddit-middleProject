package kr.or.ddit.middle.vo;

public class Info_ReservVO {

	// accom
	private String a_code;
	private String a_name;
	private String a_addr;
	private String a_tel;
	private String a_entime;
	private String a_extime;
	private String a_type;

	// reserv
	private String res_code;
	private String res_cin;
	private String res_cout;
	private String res_memo;
	private String res_status;

	// room
	private String r_code;
	private String r_type;
	private int r_min;
	private int r_max;
	private int r_price;
	private int r_inven;

	// pay
	private String pay_no;

	private String pay_date;
	private int pay_price;
	private String pay_method;
	private String mil_use;
	private String cou_use;

	// refund
	private String rf_code;
	private String rf_date;

	// member
	private String mem_id;
	private String mem_name;
	private String mem_email;
	private String mem_tel;
	private int mem_mil;
	private String mem_photo;
	private int cnt;

	public String getMil_use() {
		return mil_use;
	}

	public void setMil_use(String mil_use) {
		this.mil_use = mil_use;
	}

	public String getCou_use() {
		return cou_use;
	}

	public void setCou_use(String cou_use) {
		this.cou_use = cou_use;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public Info_ReservVO() {
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

	public String getA_addr() {
		return a_addr;
	}

	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}

	public String getA_tel() {
		return a_tel;
	}

	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}

	public String getA_entime() {
		return a_entime;
	}

	public void setA_entime(String a_entime) {
		this.a_entime = a_entime;
	}

	public String getA_extime() {
		return a_extime;
	}

	public void setA_extime(String a_extime) {
		this.a_extime = a_extime;
	}

	public String getA_type() {
		return a_type;
	}

	public void setA_type(String a_type) {
		this.a_type = a_type;
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

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public int getPay_price() {
		return pay_price;
	}

	public void setPay_price(int pay_price) {
		this.pay_price = pay_price;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getRf_code() {
		return rf_code;
	}

	public void setRf_code(String rf_code) {
		this.rf_code = rf_code;
	}

	public String getRf_date() {
		return rf_date;
	}

	public void setRf_date(String rf_date) {
		this.rf_date = rf_date;
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

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public int getMem_mil() {
		return mem_mil;
	}

	public void setMem_mil(int mem_mil) {
		this.mem_mil = mem_mil;
	}

	public String getMem_photo() {
		return mem_photo;
	}

	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
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

	public int getR_inven() {
		return r_inven;
	}

	public void setR_inven(int r_inven) {
		this.r_inven = r_inven;
	}

}
