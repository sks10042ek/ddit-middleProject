package kr.or.ddit.middle.service.member;

import java.util.List;

import kr.or.ddit.middle.dao.member.MypageDaoImpl;
import kr.or.ddit.middle.vo.Info_CouponVO;
import kr.or.ddit.middle.vo.Info_ReservVO;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.View_PhotoVO;
import kr.or.ddit.middle.vo.WishListVO;

public class MyPageServiceImpl implements IMypageService {

	private static MyPageServiceImpl service;

	private MypageDaoImpl dao;

	private MyPageServiceImpl() {
		dao = MypageDaoImpl.getInstance();
	}

	public static MyPageServiceImpl getInstance() {
		if (service == null)
			service = new MyPageServiceImpl();
		return service;
	}

	@Override
	public List<View_PhotoVO> wishListCheck(String id) {

		return dao.wishListCheck(id);
	}

	@Override
	public List<Info_ReservVO> resInfoCheck(String id) {

		return dao.resInfoCheck(id);
	}

	@Override
	public List<Info_CouponVO> couponCheck(String id) {

		return dao.couponCheck(id);
	}

	@Override
	public int wishValueCheck(WishListVO vo) {

		return dao.wishListCheck(vo);
	}

	@Override
	public int wishListDelete(WishListVO vo) {

		return dao.wishListDelete(vo);
	}

	@Override
	public int wishListInsert(WishListVO vo) {

		return dao.wishListInsert(vo);
	}

	@Override
	public Info_ReservVO resDetailCheck(Info_ReservVO vo) {
		
		return dao.resDetailCheck(vo);
	}

	@Override
	public List<Info_CouponVO> couponTotalCheck(String id) {
		// TODO Auto-generated method stub
		return dao.couponTotalCheck(id);
	}

	@Override
	public List<MileageVO> mileageInfo(String id) {
		// TODO Auto-generated method stub
		return dao.mileageInfo(id);
	}

	@Override
	public String mileageTotal(String id) {
		// TODO Auto-generated method stub
		return dao.mileageTotal(id);
	}


}
