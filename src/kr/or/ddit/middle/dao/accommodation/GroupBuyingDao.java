package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import kr.or.ddit.middle.vo.GroupBuyingVO;

public interface GroupBuyingDao {

	/** 
	 * 
	 *
	 * */
	public List<GroupBuyingVO> groupbuylist(String n_code);
	
	
	public int buying(GroupBuyingVO vo);
	
}
