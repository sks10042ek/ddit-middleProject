package kr.or.ddit.middle.dao.accommodation;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.middle.vo.PhotoVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class PhotoDaoImpl implements IPhotoDao {

	private static PhotoDaoImpl dao;

	private PhotoDaoImpl() {
	}

	public static PhotoDaoImpl getInstance() {
		if (dao == null)
			dao = new PhotoDaoImpl();
		return dao;
	}

	@Override
	public int photoInsert(PhotoVO vo) {

		SqlSession session = null;
		int cnt = 0;

		try {
			
			session=MyBatisUtil.getSqlSession();
			cnt=session.insert("",vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			if (session != null)
				session.close();
		}

		return cnt;
	}

}
