package kr.or.ddit.middle.vo;

import javax.websocket.Session;

//멤버VO
public class MemberVO {
	private String mem_id;
	private String mem_pass;
	private String mem_name;
	private String mem_email;
	private String mem_tel;
	private String mem_birth;
	private String mem_gender;
	private String mem_code;
	private int mem_mil;
	private String mem_photo;
	private Session session;
	
	public MemberVO() {}
	
	public MemberVO(String mem_id,Session session) {
		this.mem_id = mem_id;
		this.session = session;
	}
	
	public String getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
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
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_code() {
		return mem_code;
	}
	public void setMem_code(String mem_code) {
		this.mem_code = mem_code;
	}
	public int getMem_mil() {
		return mem_mil;
	}
	public void setMem_mil(int mem_mil) {
		this.mem_mil = mem_mil;
	}
	
	
	
}
