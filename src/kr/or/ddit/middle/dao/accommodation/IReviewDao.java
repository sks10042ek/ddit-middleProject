package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.PhotoVO;
import kr.or.ddit.middle.vo.ReviewVO;
import kr.or.ddit.middle.vo.View_ReviewVO;

public interface IReviewDao {
	/**
	 * 
	 * 리뷰조회 메서드
	 * 
	 * 해당 a_code에 해당하는 리뷰데이터를 List<View_ReviewVO>에 담아서 return해줌
	 * 
	 * @param a_code : 해당숙박업체코드
	 * @return  List<View_ReviewVO>에 데이터를담아서 ruturn
	 */
	public List<View_ReviewVO> reviewCheck(String a_code);
	
	/**
	 * 
	 * review insert 메서드
	 * 
	 * 데이터를 입력받아서 insert해주는 기능
	 *  
	 * @param vo review데이터
	 * @return 성공시 1 실패시 0
	 */
	public int reviewInsert(ReviewVO vo);
	
	
	/**
	 * 
	 * review 포토 등록 
	 *  
	 * @param vo : photo데이터 
	 * @return 성공시 1, 실패시0
	 */
	public int revPhotoInsert(PhotoVO vo);
	
	
	/**
	 * 
	 * review에서 photo가 있는지 없는지 유무검사 메서드
	 * 
	 * @param rev_code : 예약code를 param으로 넘김 
	 * @return review에 photo가 있으면 1 없으면 0
	 */
	public int photoRevCheck(String rev_code);
	
	
	/**
	 * 
	 * 포토 확인후 마일리지 지급 
	 * 
	 * @param vo : milage 데이터를 담은 vo
	 * @return 성공시 1 실패시 0
	 */
	public int mileInsert(MileageVO vo);
}
