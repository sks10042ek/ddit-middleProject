package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.middle.vo.RoomVO;
import kr.or.ddit.middle.vo.View_PhotoVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class RoomDaoImpl implements IRoomDao {
		
	private static RoomDaoImpl dao;

	private RoomDaoImpl() {
	}

	public static RoomDaoImpl getInstance() {
		if (dao == null)
			dao = new RoomDaoImpl();
		return dao;
	}

	@Override
	public int roomInsert(RoomVO vo) {
		SqlSession session = null;
		int cnt=0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Accom.roomInsert", vo);
			if(cnt>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public RoomVO roomInfoCheck(String r_code) {
		
		SqlSession session = null;
		RoomVO rVO=null;
		
		try {

			session = MyBatisUtil.getSqlSession();
			rVO = session.selectOne("Reservation.roomDetail", r_code);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return rVO;
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

		SqlSession session = null;
		String r_code = null;
		
		try {

			session = MyBatisUtil.getSqlSession();
			r_code = session.selectOne("Accom.roomCodeCheck");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return r_code;
	}

}
