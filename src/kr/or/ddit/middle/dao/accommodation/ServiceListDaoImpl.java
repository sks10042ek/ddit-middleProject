package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import kr.or.ddit.middle.vo.View_ServiceVO;

public class ServiceListDaoImpl implements IServiceListDao {
	
	private static ServiceListDaoImpl dao;

	private ServiceListDaoImpl() {
	}

	public static ServiceListDaoImpl getInstance() {
		if (dao == null)
			dao = new ServiceListDaoImpl();
		return dao;
	}
	
	@Override
	public List<View_ServiceVO> acServiceListCheck(String a_code) {
		// TODO Auto-generated method stub
		return null;
	}

}
