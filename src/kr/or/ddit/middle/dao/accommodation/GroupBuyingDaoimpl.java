package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import kr.or.ddit.middle.vo.GroupBuyingVO;

public class GroupBuyingDaoimpl implements  GroupBuyingDao{

private static GroupBuyingDaoimpl dao;

private GroupBuyingDaoimpl() {
	
}
	
public static GroupBuyingDaoimpl getInstance() {
	if(dao ==null)
		dao = new GroupBuyingDaoimpl();
	return dao;
	
}

@Override
public List<GroupBuyingVO> groupbuylist(String n_code) {
	// TODO Auto-generated method stub
	return null;
}




@Override
public int buying(GroupBuyingVO vo) {
	// TODO Auto-generated method stub
	return 0;
}
}