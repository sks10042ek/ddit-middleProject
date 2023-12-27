package kr.or.ddit.middle.service.board;

import java.util.List;

import kr.or.ddit.middle.dao.board.AttendenceDaoImpl;
import kr.or.ddit.middle.vo.AttendanceVO;
import kr.or.ddit.middle.vo.Cp_HavingVO;

public class AttendenceServiceImpl implements IAttendence {
	
	private static AttendenceServiceImpl service;

	private AttendenceDaoImpl dao;

	private AttendenceServiceImpl() {
		dao = AttendenceDaoImpl.getInstance();
	}

	public static AttendenceServiceImpl getInstance() {
		if (service == null)
			service = new AttendenceServiceImpl();
		return service;
	}
	
	@Override
	public int attInsert(String bo_id) {
		// TODO Auto-generated method stub
		return dao.attInsert(bo_id);
	}

	@Override
	public List<AttendanceVO> attCheck(String id) {
		// TODO Auto-generated method stub
		return dao.attCheck(id);
	}

	@Override
	public int couponInsert(Cp_HavingVO vo) {
		// TODO Auto-generated method stub
		return dao.couponInsert(vo);
	}

}
