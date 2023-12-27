package kr.or.ddit.middle.service.accommodation;

import java.util.List;

import kr.or.ddit.middle.dao.accommodation.RoomDaoImpl;
import kr.or.ddit.middle.vo.RoomVO;
import kr.or.ddit.middle.vo.View_PhotoVO;

public class RoomServiceImpl implements IRoomService {
	
	private static RoomServiceImpl service;

	private RoomDaoImpl dao;

	private RoomServiceImpl() {
		dao = RoomDaoImpl.getInstance();
	}
	public static RoomServiceImpl getInstance() {
		if (service == null)
			service = new RoomServiceImpl();
		return service;
	}
	
	@Override
	public int roomInsert(RoomVO vo) {
		// TODO Auto-generated method stub
		return dao.roomInsert(vo);
	}

	@Override
	public RoomVO roomInfoCheck(String r_code) {
		// TODO Auto-generated method stub
		return dao.roomInfoCheck(r_code);
	}

	@Override
	public List<View_PhotoVO> roomMainCheck(String a_code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int roomUpdate(RoomVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int roomDelete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public String roomCodeCheck() {
		// TODO Auto-generated method stub
		return dao.roomCodeCheck();
	}

}
