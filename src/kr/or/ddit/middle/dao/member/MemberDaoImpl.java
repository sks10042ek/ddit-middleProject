package kr.or.ddit.middle.dao.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.middle.vo.MemberVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class MemberDaoImpl implements IMemberDao {

	private static MemberDaoImpl dao;

	private MemberDaoImpl() {
	}

	public static MemberDaoImpl getInstance() {
		if (dao == null)
			dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public int checkInfo(MemberVO vo) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("Member.checkInfo", vo);
			System.out.println(cnt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cnt;
	}

	@Override
	public String findId(String email) {

		SqlSession session = null;
		String id = "";

		try {

			session = MyBatisUtil.getSqlSession();
			id = session.selectOne("Member.findId",email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return id;
	}

	@Override
	public int findPass(MemberVO vo) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			cnt=session.selectOne("Member.findPass",vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}

	@Override
	public int updatePass(String id) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			cnt=session.update("Member.updatePass",id);

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
	public int joinMember(MemberVO vo) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			cnt = session.insert("Member.joinMember", vo);
			System.out.println(cnt);
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
	public int checkDuple(String id) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			cnt = session.selectOne("Member.checkDuple", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}

	@Override
	public MemberVO memberInfo(String id) {

		SqlSession session = null;
		MemberVO memberVO = null;

		try {

			session = MyBatisUtil.getSqlSession();
			memberVO = session.selectOne("Member.memberInfo",id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return memberVO;
	}

	@Override
	public int memberInfoUpdate(MemberVO vo) {

		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			cnt=session.update("Member.memberInfoUpdate",vo);
			if(cnt > 0) {
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
	public int memberPhotoUpload(MemberVO vo) {

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

	public int memberPassUpdate(MemberVO vo) {
		
		SqlSession session = null;
		int cnt = 0;

		try {

			session = MyBatisUtil.getSqlSession();
			cnt=session.update("Member.memberPassUpdate",vo);

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
	public List<MemberVO> adminMemCheck() {
		SqlSession session = null;
		List<MemberVO> list = null;
		 try {
			 session = MyBatisUtil.getSqlSession();
	         list = session.selectList("Member.adminMemCheck");
			 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	         if(session != null) session.close();
	      }
	      return list;
	}

	public int memberDelete(String id) {
		SqlSession session = null;
	    int cnt =0;
	    
	    try {
			
	    	session = MyBatisUtil.getSqlSession();
	    	System.out.println("테스트1");
	    	cnt = session.delete("Member.memberDelete", id);
	    	System.out.println(cnt);
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

}
