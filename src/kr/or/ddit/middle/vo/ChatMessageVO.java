package kr.or.ddit.middle.vo;

public class ChatMessageVO {

	     private String mem_id;
	     private String room;
	     private String command; //접속하는 상태를알림
	     private String message;
	     
		public String getMem_id() {
			return mem_id;
		}
		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
		}
		public String getRoom() {
			return room;
		}
		public void setRoom(String room) {
			this.room = room;
		}
		public String getCommand() {
			return command;
		}
		public void setCommand(String command) {
			this.command = command;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
	     
	     
	     
}    
