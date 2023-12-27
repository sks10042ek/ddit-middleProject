package kr.or.ddit.middle.service.accommodation;

import java.util.List;

import kr.or.ddit.middle.vo.GroupBuyingVO;

public interface GroupDetailService {

		/**
		 * 값을 불러오게 만들어줄 메서드를 만들어 보자..........
		 * */
	
	public List<GroupBuyingVO> groupbuylist (String n_code);
	

	public int groupBuyDetail(GroupBuyingVO vo );
}
