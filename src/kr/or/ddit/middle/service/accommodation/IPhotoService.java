package kr.or.ddit.middle.service.accommodation;

import kr.or.ddit.middle.vo.PhotoVO;
	//Photo에 관련된 service
public interface IPhotoService {
	
	
	/**
	 * 
	 * 새로운 사진을 등록하는 메서드 
	 * 
	 * 새로운 사진의 정보를 입력받아 db에 insert해주는 메서드
	 * 
	 * @param vo : 사진에 대한 정보
	 * @return insert 성공시 1 , 실패시 0
	 */
	public int photoInsert(PhotoVO vo);
	
	
}
