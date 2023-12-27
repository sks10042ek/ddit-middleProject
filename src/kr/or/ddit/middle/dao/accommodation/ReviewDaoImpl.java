package kr.or.ddit.middle.dao.accommodation;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.middle.vo.MileageVO;
import kr.or.ddit.middle.vo.PhotoVO;
import kr.or.ddit.middle.vo.ReviewVO;
import kr.or.ddit.middle.vo.View_ReviewVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class ReviewDaoImpl implements IReviewDao {
	
	private static ReviewDaoImpl dao;

	private ReviewDaoImpl() {
	}

	public static ReviewDaoImpl getInstance() {
		if (dao == null)
			dao = new ReviewDaoImpl();
		return dao;
	}

	
	@Override
	public List<View_ReviewVO> reviewCheck(String a_code) {
		
		SqlSession session = null;
		List<View_ReviewVO> list = null;

		try {
			session = MyBatisUtil.getSqlSession();
			list = session.selectList("Accom.reviewCheck",a_code);	
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	@Override
	public int reviewInsert(ReviewVO vo) {
		SqlSession session = null;
		int cnt = 0;

		try {
			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Accom.reviewInsert",vo);	
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
