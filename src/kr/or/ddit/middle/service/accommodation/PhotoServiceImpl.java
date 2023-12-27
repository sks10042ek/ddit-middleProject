package kr.or.ddit.middle.service.accommodation;

import kr.or.ddit.middle.dao.accommodation.PhotoDaoImpl;
import kr.or.ddit.middle.vo.PhotoVO;

public class PhotoServiceImpl implements IPhotoService {

	private static PhotoServiceImpl service;

	private PhotoDaoImpl dao;

	private PhotoServiceImpl() {
		dao = PhotoDaoImpl.getInstance();
	}

	public static PhotoServiceImpl getInstance() {
		if (service == null)
			service = new PhotoServiceImpl();
		return service;
	}

	@Override
	public int photoInsert(PhotoVO vo) {

		return dao.photoInsert(vo);
	}

}
