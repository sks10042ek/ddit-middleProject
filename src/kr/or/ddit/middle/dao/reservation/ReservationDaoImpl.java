package kr.or.ddit.middle.dao.reservation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.middle.vo.AccommodationVO;
import kr.or.ddit.middle.vo.Cp_HavingVO;
import kr.or.ddit.middle.vo.MemberVO;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.PaymentVO;
import kr.or.ddit.middle.vo.ReservationVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.middle.vo.RoomVO;


public class ReservationDaoImpl implements IReservationDao {
	
	private static ReservationDaoImpl dao;

	private ReservationDaoImpl() {
	}

	public static ReservationDaoImpl getInstance() {
		if (dao == null)
			dao = new ReservationDaoImpl();
		return dao;
	}

	
	@Override
	public int resInsert(ReservationVO vo) {
		int cnt =0;
		SqlSession session =null;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Reservation.resInsert", vo);		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(cnt>0) {
				session.commit();
			}
			if(session!=null)session.close();
		}
		return cnt;
	}

	@Override
	public int refundInsert(String pay_no) {
		int cnt =0;
		SqlSession session =null;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Reservation.refundInsert", pay_no);		
			
			if(cnt>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return cnt;
	}

	@Override
	public int resStatusUpdate(String res_code) {
		int cnt =0;
		SqlSession session =null;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.update("Reservation.resStatusUpdate", res_code);		
			
			if(cnt>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)session.close();
		}
		return cnt;
	}

	@Override
	public List<String> cphCheck(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memPosMileage(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int memCpdelete(Cp_HavingVO vo) {
		int cnt =0;
		SqlSession session =null;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.update("Reservation.memCpdelete", vo);		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(cnt>0) {
				session.commit();
			}
			if(session!=null)session.close();
		}
		return cnt;
	}

	public AccommodationVO accomInfo(String a_code) {
		SqlSession session = null;
		AccommodationVO aVO = null;

		try {

			session = MyBatisUtil.getSqlSession();
			aVO = session.selectOne("Reservation.accomInfo", a_code);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return aVO;
	}

	public RoomVO roomInfo(String r_code) {
		SqlSession session = null;
		RoomVO rVO = null;

		try {

			session = MyBatisUtil.getSqlSession();
			rVO = session.selectOne("Reservation.roomInfo", r_code);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return rVO;
	}

	public int payInsert(PaymentVO pVO) {
		int cnt =0;
		SqlSession session =null;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Reservation.payInsert", pVO);		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(cnt>0) {
				session.commit();
			}
			if(session!=null)session.close();
		}
		return cnt;
	}

	public int milInsert(MileageVO mVO) {
		int cnt =0;
		SqlSession session =null;
		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Member.mileageInsert", mVO);		
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(cnt>0) {
				session.commit();
			}
			if(session!=null)session.close();
		}
		return cnt;
	}
	
	@Override
	public List<PaymentVO> adminPayCheck() {
		SqlSession session = null;
		List<PaymentVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Reservation.adminPayCheck");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	         if(session != null) session.close();
	      }
	      return list;
	}

	@Override
	public List<PaymentVO> adminSalesCheck() {
		SqlSession session = null;
		List<PaymentVO> list = null;
		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Reservation.adminSalesCheck");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	         if(session != null) session.close();
	      }
	      return list;
	}

}
