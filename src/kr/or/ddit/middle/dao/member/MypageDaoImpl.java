package kr.or.ddit.middle.dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.middle.vo.Info_CouponVO;
import kr.or.ddit.middle.vo.Info_ReservVO;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.View_PhotoVO;
import kr.or.ddit.middle.vo.WishListVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class MypageDaoImpl implements IMypageDao {

	private static MypageDaoImpl dao;

	private MypageDaoImpl() {
	}

	public static MypageDaoImpl getInstance() {
		if (dao == null)
			dao = new MypageDaoImpl();
		return dao;
	}

	@Override
	public List<View_PhotoVO> wishListCheck(String id) {

		SqlSession session = null;
		List<View_PhotoVO> list = null;

		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Member.wishListCheck",id);	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	@Override
	public List<Info_ReservVO> resInfoCheck(String id) {

		SqlSession session = null;
		List<Info_ReservVO> list = null;

		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Member.resInfoCheck", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	@Override
	public List<Info_CouponVO> couponCheck(String id) {

		SqlSession session = null;
		List<Info_CouponVO> list = null;

		try {

			session = MyBatisUtil.getSqlSession();
			list=session.selectList("Member.couponCheck",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	@Override
	public int wishListCheck(WishListVO vo) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public int wishListDelete(WishListVO vo) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public int wishListInsert(WishListVO vo) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public Info_ReservVO resDetailCheck(Info_ReservVO vo) {
		SqlSession session = null;
		Info_ReservVO resvo = null;
		
		try {

			session = MyBatisUtil.getSqlSession();
			resvo = session.selectOne("Info_ReservVO", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return resvo;
		
	}
	@Override
	public List<Info_CouponVO> couponTotalCheck(String id) {
		SqlSession session = null;
		List<Info_CouponVO> list = null;

		try {

			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Member.couponTotalCheck", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	@Override
	public List<MileageVO> mileageInfo(String id) {
		
		SqlSession session = null;
		List<MileageVO> list = null;

		try {

			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Member.mileageInfo", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public String mileageTotal(String id) {
		SqlSession session = null;
		String total="";

		try {

			session = MyBatisUtil.getSqlSession();
			total = session.selectOne("Member.mileageTotal", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
		
	}
}
