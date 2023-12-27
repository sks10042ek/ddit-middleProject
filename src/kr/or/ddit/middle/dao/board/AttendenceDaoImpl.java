package kr.or.ddit.middle.dao.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.middle.vo.AttendanceVO;
import kr.or.ddit.middle.vo.Cp_HavingVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class AttendenceDaoImpl implements IAttendenceDao {
	

	private static AttendenceDaoImpl dao;

	private AttendenceDaoImpl() {
	}

	public static AttendenceDaoImpl getInstance() {
		if (dao == null)
			dao = new AttendenceDaoImpl();
		return dao;
	}
	
	@Override
	public int attInsert(String bo_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AttendanceVO> attCheck(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int couponInsert(Cp_HavingVO vo) {
		SqlSession session = null;
		int cnt =0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Board.couponInsert",vo);
			if(cnt>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session !=null)session.close();
		}
		return cnt;
	}

}
