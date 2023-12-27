package kr.or.ddit.middle.dao.member;

import java.util.List;

import kr.or.ddit.middle.vo.MemberVO;

public interface IMemberDao {
	

	/**
	 * 로그인 메서드
	 * 기능 : Id와 password의 값을 받아와서 db에 값이 있는지 검사
	 * 
	 * @param vo : id와 password 값을 MemberVO에 담아서 param으로 넘김
	 * @return : 1이면 로그인 성공, 0이면 로그인 실패
	 */
	public int checkInfo(MemberVO vo);
	
	
	/**
	 * 
	 * 아이디 찾기 메서드
	 * 기능 : 이메일값을 param으로 넘겨서 해당 이메일의 Id값을 가져오는 메서드
	 * 
	 * @param email : email값을 param값으로 넘김
	 * @return 결과값으로 id값 반환
	 */
	public String findId(String email);
	
	/**
	 * 비밀번호 찾기 메서드
	 * 기능 : 아이디와 이메일을 param값으로 입력받아 입력받은 값과 db에 있는 값이 일치하는지 검사하는 메서드 
	 * 
	 * @param vo : id와 email을 MemberVO에 넣어서 param으로 넘김
	 * @return 1이면 결과값 일치 , 0이면 불일치
	 */
	public int findPass(MemberVO vo);
	
	/**
	 * 
	 * 비밀번호 초기화 메서드
	 * 
	 * findpass 메서드 실행 후 결과값이 1이면 실행하는 메서드
	 *  id값을 param으로 넘겨서 id의 값과 일치하는 password를 0000으로으로 초기화 해주는 메서드 
	 * 
	 * @param id : update할 대상의 id를 param으로 넘김
	 * @return : 실행이 완료되면1 , 실패시 0
	 */
	public int updatePass(String id);
	
	
			
	
	/**
	 * 
	 * 회원가입 메서드
	 * 
	 * 회원가입에 필요한 정보들을 MemberVO에 넣어서  db에 값을 저장 시켜주는 메서드
	 * 
	 * @param vo : 회원가입 입력정보
	 * @return 실행이 완료되면 1 , 실패시 0
	 */
	public int joinMember(MemberVO vo);
	
	
	/**
	 * 
	 * 아이디 중복검사 메서드
	 * 
	 * id값을 param으로 입력받아 db에 id값이 있는지 검사하는 메서드
	 * 
	 * @param id : 입력받은 id
	 * @return  id값이 있으면 1 , 없으면 0
	 */
	public int checkDuple(String id);
	
	
	/**
	 * 
	 * 마이페이지 - 회원정보 조회
	 *	
	 * id값을 param으로 넘겨 해당하는 member정보를 List타입으로 반환하는 메서드
	 * 
	 * @param id : 입력받은 id값
	 * @return member정보를 List<MemberVO>에 담아서 넘김
	 */
	public MemberVO memberInfo(String id);
	
	/**
	 * 회원 정보 수정
	 * 
	 * -> 회원정보 조회에서 받은 데이터를 전부 입력창에 뿌려주고 
	 * -> 유효성검사후 업테이트를 해준다.
	 * -> id값과 mileage값은 수정할수 없게 한다.
	 * -> vo값에 id와 mileage값은 넣어주지 않아야한다.
	 * 
	 * 수정하고 싶은 데이터
	 * 
	 * @param vo : 수정하기 위한 데이터값
	 * @return 실행이 완료되면 1 , 실패시 0
	 */
	public int memberInfoUpdate(MemberVO vo);
	
	/**
	 * 마이페이지에서 비밀번호 변경
	 * @param vo
	 * @return 실행이 완료되면 1 , 실패시 0
	 */
	public int memberPassUpdate(MemberVO vo);
	
	/**
	 * 프로필 사진 업로드
	 * 
	 * id값에 해당하는 프로필사진을 update 하는 메서드
	 * 
	 * @param vo : 프로필 사진, id값
	 * @return 실행이 완료되면 1 , 실패시 0
	 */
	public int memberPhotoUpload(MemberVO vo);

	
	
	/**
	 * 
	 * 관리자 회원목록 출력 
	 * 
	 * 관리자계정에서 모든 회원을 조회하여 출력해준다.
	 * 
	 * @return List<MemberVO>에 게시글 정보와 작성자의 정보까지 반환해준다.
	 */
	List<MemberVO> adminMemCheck();
	
	
	/**
	 * 
	 * 관리자 회원 삭제 
	 * 
	 * @param vo : id값
	 * @return 실행이 완료되면 1 , 실패시 0
	 * 
	 */
	public int memberDelete(String id);

}
