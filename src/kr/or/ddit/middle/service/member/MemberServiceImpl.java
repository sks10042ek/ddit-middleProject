package kr.or.ddit.middle.service.member;

import java.util.List;

import kr.or.ddit.middle.dao.member.MemberDaoImpl;
import kr.or.ddit.middle.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private static MemberServiceImpl service;

	private MemberDaoImpl dao;

	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}

	public static MemberServiceImpl getInstance() {
		if (service == null)
			service = new MemberServiceImpl();
		return service;
	}

	@Override
	public int checkInfo(MemberVO vo) {

		return dao.checkInfo(vo);
	}

	@Override
	public String findId(String email) {

		return dao.findId(email);
	}

	@Override
	public int findPass(MemberVO vo) {

		return dao.findPass(vo);
	}

	@Override
	public int updatePass(String id) {

		return dao.updatePass(id);
	}
	


	@Override
	public int joinMember(MemberVO vo) {

		return dao.joinMember(vo);
	}

	@Override
	public int checkDuple(String id) {

		return dao.checkDuple(id);
	}

	@Override
	public MemberVO memberInfo(String id) {

		return dao.memberInfo(id);
	}

	@Override
	public int memberInfoUpdate(MemberVO vo) {

		return dao.memberInfoUpdate(vo);
	}

	@Override
	public int memberPhotoUpload(MemberVO vo) {

		return dao.memberPhotoUpload(vo);
	}

	@Override
	public int memberPassUpdate(MemberVO vo) {
		return dao.memberPassUpdate(vo);
	}
	
	@Override
	public List<MemberVO> adminMemCheck() {
		return dao.adminMemCheck();
	}

	@Override
	public int memberDelete(String id) {
		// TODO Auto-generated method stub
		return dao.memberDelete(id);
	}

}
