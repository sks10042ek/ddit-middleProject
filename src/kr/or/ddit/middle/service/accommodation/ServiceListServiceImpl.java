package kr.or.ddit.middle.service.accommodation;

import java.util.List;

import kr.or.ddit.middle.dao.accommodation.ServiceListDaoImpl;
import kr.or.ddit.middle.vo.View_ServiceVO;

public class ServiceListServiceImpl implements IServiceList {
	
	private static ServiceListServiceImpl service;

	private ServiceListDaoImpl dao;

	private ServiceListServiceImpl() {
		dao = ServiceListDaoImpl.getInstance();
	}

	public static ServiceListServiceImpl getInstance() {
		if (service == null)
			service = new ServiceListServiceImpl();
		return service;
	}
	
	@Override
	public List<View_ServiceVO> acServiceListCheck(String a_code) {
		// TODO Auto-generated method stub
		return null;
	}

}
