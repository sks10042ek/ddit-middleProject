package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import kr.or.ddit.middle.vo.View_ServiceVO;

public interface IServiceListDao {
	/**
	 * 
	 * 해당 숙박업체가 포함하고 있는 서비스 리스트 조회하는 메서드
	 * 
	 * 숙박업체코드를 param으로 입력받아 해당 숙박업체가 가지고있는 service들을 출력
	 * 
	 * @param a_code : 숙박업체 코드
	 * @return : List<View_ServiceVO>를 return
	 */
	public List<View_ServiceVO> acServiceListCheck(String a_code); 
}
