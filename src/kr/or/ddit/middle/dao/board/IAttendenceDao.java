package kr.or.ddit.middle.dao.board;

import java.util.List;

import kr.or.ddit.middle.vo.AttendanceVO;
import kr.or.ddit.middle.vo.Cp_HavingVO;

public interface IAttendenceDao {
	/**
	 * 
	 * 출석체크 
	 * 
	 * @param bo_id : 해당하는 게시판 id를 param으로 보낸다.
	 * @return 성공시 1 실패시 0
	 */
	public int attInsert(String bo_id);
	
	/**
	 * 
	 * 출석체크 조회 메서드
	 * 
	 * @param id : 세션에 저장되어있는 id값을 가져와서 param으로 보내준다.
	 * @return List<Attendance>에 데이터를 담아 return 한다.
	 */
	public List<AttendanceVO> attCheck(String id); 
	
	/**
	 * 
	 * 쿠폰등록 메서드
	 * 
	 * @param vo 등록에 필요한 데이터를 vo에 담아 
	 * @return 성공시 1 실패시 0
	 */
	public int couponInsert(Cp_HavingVO vo);
}
