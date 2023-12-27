package kr.or.ddit.middle.service.accommodation;

import java.util.List;

import kr.or.ddit.middle.dao.accommodation.ReviewDaoImpl;
import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.PhotoVO;
import kr.or.ddit.middle.vo.ReviewVO;
import kr.or.ddit.middle.vo.View_ReviewVO;

public class ReviewServiceImpl implements IReviewService {
	
	private static ReviewServiceImpl service;

	private ReviewDaoImpl dao;

	private ReviewServiceImpl() {
		dao = ReviewDaoImpl.getInstance();
	}
	public static ReviewServiceImpl getInstance() {
		if (service == null)
			service = new ReviewServiceImpl();
		return service;
	}
	
	@Override
	public List<View_ReviewVO> reviewCheck(String a_code) {
		// TODO Auto-generated method stub
		return dao.reviewCheck(a_code);
	}

	@Override
	public int reviewInsert(ReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewInsert(vo);
	}

	@Override
	public int revPhotoInsert(PhotoVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int photoRevCheck(String rev_code) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int mileInsert(MileageVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
