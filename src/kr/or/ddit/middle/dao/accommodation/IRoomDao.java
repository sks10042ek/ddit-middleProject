package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import kr.or.ddit.middle.vo.RoomVO;
import kr.or.ddit.middle.vo.View_PhotoVO;

public interface IRoomDao {
	/**
	 * 
	 * Room insert 메서드
	 *  
	 * @param vo : Room의 테이터값을 param으로 받아와서 값을 insert한다.
	 * @return 성공시 1, 실패시 0
	 */
	public int roomInsert(RoomVO vo);
	
	
	/**
	 * 
	 * 전체 객실 정보 출력 
	 * 
	 * 내가 선택한 숙박업체코드를 param으로 받아와서 해당하는 객실의 데이터를 List<View_PhotoVO>에 담아 return
	 * 
	 * @param a_code : 내가 선택한 숙박업체코드
	 * @return List<View_PhotoVO>에 담은 값을 return
	 */
	public RoomVO roomInfoCheck(String a_code);
	
	/**
	 * 
	 * 객실의 정보와 메인사진출력 
	 * 
	 * 내가 선택한 숙박업체코드를 param으로 받아와서 해당하는 객실의 데이터를 List<View_PhotoVO>에 담아 return
	 * 
	 * @param a_code : 내가 선택한 숙박업체코드 
	 * @return List<View_PhotoVO>에 담은 값을 return
	 */
	public List<View_PhotoVO> roomMainCheck(String a_code);
	
	/**
	 * 
	 * 관리자가 객실의 원하는값을 수정하는 update 문 
	 * 
	 * @param vo : 수정하고싶은 값을 VO에 담아 param으로 넘김
	 * @return 성공시 1 실패시 0
	 */
	public int roomUpdate(RoomVO vo);
	
	/**
	 * 
	 * 관리자가 객실을 삭제하는 delete메서드
	 * 
	 * @param id 
	 * @return
	 */
	public int roomDelete(String id);
	
	/**
	 * 객실의 가장 최신 코드를 가져오는 메소드
	 * 
	 * @return r_code
	 */
	public String roomCodeCheck();
}
